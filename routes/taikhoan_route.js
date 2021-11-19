const crypto = require("crypto");
const express = require("express");
const jwt = require("jsonwebtoken");
const db = require("../database.js");

const router = express.Router();

const ADMIN = 2;
const USER = 1;
const JWT_SECRET = process.env.JWT_SECRET || "secret";

router.post("/dangky", async (req, res) => {
  const { username, password, ho, ten } = req.body;

  if (!username || !password || !ten) {
    return res.status(400).json({ fail: "thieu tham so (username, password, ten)" });
  }
  if (
    typeof username !== "string" ||
    username.length < 5 ||
    username.length > 32 ||
    !/^[a-zA-Z0-9_.]+$/.test(username)
  ) {
    return res.status(400).json({ fail: "username khong hop le 5 < (a-z, A-Z, 0-9, _, .) < 32" });
  }
  if (
    typeof password !== "string" ||
    password.length < 5 ||
    password.length > 32 ||
    !/^\S+$/.test(password)
  ) {
    return res
      .status(400)
      .json({ fail: "password khong hop le 5 <= (non white space character) <= 32" });
  }
  if (await db('nguoidung').where('username', username).first()) {
    return res
      .status(400)
      .json({ fail: "tai khoan da ton tai" });
  }

  const hash = crypto.createHash("sha256").update(password).digest("hex");

  try {
    await db("nguoidung").insert({
      username: username,
      password: hash,
      ho: ho,
      ten: ten,
      id_quyen: USER,
    });

    const token = jwt.sign({ username, ho, ten, role: "user" }, JWT_SECRET);
    res.status(201).json({ token });
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

router.post("/dangnhap", async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).json({ fail: "thieu tham so (username, password)" });
  }

  const hash = crypto.createHash("sha256").update(password).digest("hex");
  try {
    const user = await db("nguoidung").select("*").where({ username, password: hash }).first();
    if (!user) {
      return res.status(400).json({ fail: "username hoac password khong chinh xac" });
    }
    const token = jwt.sign(
      {
        username: user.username,
        role: user.id_quyen === ADMIN ? "admin" : "user",
        ho: user.ho,
        ten: user.ten,
      },
      JWT_SECRET
    );

    res.status(201).json({ token });
  } catch (e) {
    console.log(e);
    res.status(500).json({ fail: 'loi may chu'})
  }
});

module.exports = router;
