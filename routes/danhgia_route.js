const path = require("path");
const fs = require("fs");
const crypto = require("crypto");
const express = require("express");
const formidable = require("formidable");
const helpers = require("../helpers");
const db = require("../database.js");

const mediaRoot = path.join(__dirname, "../media");

const router = express.Router();

router.post(
  "/",
  helpers.authorizeMiddleware,
  (req, res, next) => {
    const form = formidable({ multiples: true });
    form.uploadDir = mediaRoot;

    form.parse(req, (err, fields, files) => {
      if (err) {
        next(err);
      } else {
        req.body = fields;
        req.files = files;
        next();
      }
    });
  },
  async (req, res) => {
    const id_truong = parseInt(req.body.id_truong);
    const sao = parseInt(req.body.sao);
    const danh_gia = req.body.danh_gia;
    const hinh_anh = req.files.hinh_anh;

    if (isNaN(sao) || sao > 5 || sao < 0) {
      return res.status(400).json({ fail: "so sao khong hop le (number, < 5, > 0" });
    }
    if (isNaN(id_truong) || !(await db("truong").where("id_truong", id_truong).first())) {
      return res.status(400).json({ fail: "id_truong khong hop le hoac truong khong ton tai" });
    }
    if (hinh_anh && hinh_anh.some((hinh) => !/image\/(jpeg|png|jpg)/.test(hinh.mimetype))) {
      await Promise.all(hinh_anh.map((hinh) => fs.promises.rm(hinh.filepath)));
      return res.status(400).json({ fail: "hinh_anh chi chap nhan file png va jpg" });
    }

    try {
      const [danhgia] = await db("danhgia")
        .insert({
          sao,
          danh_gia,
          id_truong,
          username: req.auth.username,
        })
        .returning(["id_danh_gia", "sao", "danh_gia", "id_truong", "username", "created_at"]);

      if (hinh_anh) {
        const hinhanhData = [];
        for (const hinh of hinh_anh) {
          const tenhinh =
            crypto.randomBytes(16).toString("hex") +
            hinh.originalFilename.slice(hinh.originalFilename.lastIndexOf("."));
          await fs.promises.rename(hinh.filepath, path.join(mediaRoot, tenhinh));
          hinhanhData.push({
            id_danh_gia: danhgia.id_danh_gia,
            url: "/static/" + tenhinh,
          });
        }
        danhgia.hinh_anh = await db("hinhanh")
          .insert(hinhanhData)
          .returning(["id_hinh", "url", "id_danh_gia"]);
      } else {
        danhgia.hinh_anh = [];
      }
      res.status(201).json(danhgia);
    } catch (e) {
      console.log(e);
      res.status(500).json({ fail: "loi may chu" });
    }
  }
);

router.delete("/:id(\\d+)", helpers.authorizeMiddleware, async (req, res) => {
  const id = req.params.id;

  const danhgia = await db("danhgia").where("id_danh_gia", id).first();
  if (!danhgia) {
    return res.status(404).json({ fail: "danhgia khong ton tai" });
  }
  if (danhgia.username !== req.auth.username) {
    return res.status(404).json({ fail: "khong the xoa danhgia cua nguoi khac" });
  }

  try {
    const rowAffected = await db("danhgia").where("id_danh_gia", id).del();
    res.status(200).json({ rowAffected });
  } catch (e) {
    console.log(e);
    res.status(500).json({ fail: "loi may chu" });
  }
});

router.put("/:id(\\d+)", helpers.authorizeMiddleware, async (req, res) => {
  const id = req.params.id;
  const danh_gia = req.body.danh_gia;
  const sao = req.body.sao ? parseInt(req.body.sao) : undefined;

  if (danh_gia === undefined && sao === undefined) {
    return res.status(404).json({ fail: "thieu tham so (danh_gia | sao)" });
  }
  if (sao !== undefined && (isNaN(sao) || sao > 5 || sao < 0)) {
    return res.status(400).json({ fail: "so sao khong hop le (number, < 5, > 0" });
  }
  const danhgia = await db("danhgia").where("id_danh_gia", id).first();
  if (!danhgia) {
    return res.status(404).json({ fail: "danhgia khong ton tai" });
  }
  if (danhgia.username !== req.auth.username) {
    return res.status(404).json({ fail: "khong the cap nhat danhgia cua nguoi khac" });
  }

  try {
    const rowAffected = await db("danhgia").update({ danh_gia, sao }).where("id_danh_gia", id);
    res.status(200).json({ rowAffected });
  } catch (e) {
    console.log(e);
    res.status(500).json({ fail: "loi may chu" });
  }
});

module.exports = router;
