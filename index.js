const fs = require("fs");
const path = require("path");

const dotenv = require("dotenv");
const express = require("express");
const cors = require("cors");

dotenv.config({ path: path.resolve(__dirname, "./.env") });

const truongRoute = require("./routes/truong_route");
const tinhRoute = require("./routes/tinh_route");
const mienRoute = require("./routes/mien_route");
const nhomRoute = require("./routes/nhom_route");
const khacRoute = require("./routes/khac_route");
const taikhoanRoute = require("./routes/taikhoan_route");
const danhgiaRoute = require("./routes/danhgia_route");

const app = express();

const mediaRoot = path.join(__dirname, "./media");
if (!fs.existsSync(mediaRoot)) {
  fs.mkdirSync(mediaRoot);
}

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/static", express.static(mediaRoot));

app.use("/truong", truongRoute);
app.use("/tinh", tinhRoute);
app.use("/mien", mienRoute);
app.use("/nhom", nhomRoute);
app.use("/khac", khacRoute);
app.use("/taikhoan", taikhoanRoute);
app.use("/danhgia", danhgiaRoute);

app.listen(8000, (e) => {
  if (e) return console.log(e);
  console.log("app is listening on port 8000");
});
