require(".."); // start the server

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");
const axios = require("axios");
const FormData = require("form-data");
const donwloader = require("image-downloader");

const etc = require("./etc");

const tempPath = path.join(__dirname, "../temp");
const data = JSON.parse(fs.readFileSync(path.join(__dirname, "./data.json"), "utf-8"));

if (!fs.existsSync(tempPath)) {
  fs.mkdirSync(tempPath);
}

async function createUsers(users) {
  let tokens = [];
  for (const user of users) {
    try {
      const { data } = await axios.post("http://localhost:8000/taikhoan/dangky", {
        username: user.login.username,
        password: "password",
        ho: user.name.first,
        ten: user.name.last,
      });
      tokens.push(data.token);
    } catch {}
  }
  return tokens;
}

async function createReview(idTruong, review, token) {
  if (!idTruong || !review || !token) return;

  let imagePaths = [];
  if (review.imageUrls) {
    await Promise.all(
      review.imageUrls.map((url) =>
        donwloader
          .image({
            url: url,
            dest: path.join(tempPath, crypto.randomBytes(8).toString("hex") + ".jpg"),
          })
          .then(({ filename }) => imagePaths.push(filename))
          .catch(() => {})
      )
    );
  }
  const form = new FormData();
  form.append("id_truong", idTruong);
  form.append("danh_gia", review.comment.slice(0, 4000));
  form.append("sao", review.rate);
  imagePaths.forEach((imagePath) => form.append("hinh_anh", fs.createReadStream(imagePath)));

  try {
    const { data } = await axios.post("http://localhost:8000/danhgia", form, {
      headers: {
        Authorization: token,
        ...form.getHeaders(),
      },
    });
    return data;
  } catch (e) {
  } finally {
    imagePaths.forEach((imagePath) => fs.unlinkSync(imagePath));
  }
}

async function main() {
  const tokens = await createUsers(data.users.slice(0, 200));

  const {
    data: { data: truongs },
  } = await axios.get("http://localhost:8000/truong");
  const idTruongs = truongs.map((truong) => truong.id_truong);

  let i = 0;
  for (const idTruong of idTruongs) {
    const reviews = etc.takeRandomEleInArray(data.reviews, etc.randomRange(1, 10));
    await Promise.all(
      reviews.map((review) => {
        const [token] = etc.takeRandomEleInArray(tokens, 1);
        return createReview(idTruong, review, token);
      })
    );
    i++;
    console.log(`${i}/${idTruongs.length} done`);
  }

  process.exit(0);
}

setTimeout(main, 2000);
