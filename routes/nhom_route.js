const express = require("express");
const db = require("../database.js");
const helpers = require("../helpers");

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    let nhoms = await db.select("*").from("nhom");

    res.status(200).json(nhoms);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

router.post("/", helpers.authorizeMiddleware, async (req, res) => {
  const { ten_nhom } = req.body;

  if (req.auth.role !== "admin") {
    return res.status(400).json({ fail: "khong co quyen them nhom" });
  }
  if (!ten_nhom) {
    return res.status(400).json({ fail: "thieu tham so (ten_nhom)" });
  }

  try {
    const [data] = await db("nhom").insert({ ten_nhom }).returning(["id_nhom", "ten_nhom"]);
    res.status(201).json(data);
  } catch (e) {
    console.log(e);
    res.status(500).json({ fail: "loi may chu" });
  }
});

module.exports = router;
