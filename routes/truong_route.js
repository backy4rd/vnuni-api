const path = require("path");
const fs = require("fs");
const express = require("express");
const turf = require("@turf/turf");
const db = require("../database.js");
const helpers = require("../helpers");

const router = express.Router();

router.get("/", async (req, res) => {
  const { truong, tinh, mien, nhom } = req.query;

  try {
    let query = db
      .select(
        "truong.id_truong",
        "truong.tentruong",
        "toado.STY AS lat",
        "toado.STX AS long",
        "mien.id_mien",
        "mien.ten_mien",
        "nhom.id_nhom",
        "nhom.ten_nhom",
        "tinh.id_tinh",
        "tinh.ten_tinh"
      )
      .innerJoin("nhom", "nhom.id_nhom", "truong.id_nhom")
      .innerJoin("tinh", "tinh.id_tinh", "truong.id_tinh")
      .innerJoin("mien", "mien.id_mien", "tinh.id_mien")
      .from("truong");

    if (truong) {
      query = query.andWhere("truong.tentruong", "like", `%${truong}%`);
    }
    if (nhom) {
      query = query.andWhere("nhom.ten_nhom", "like", `%${nhom}%`);
    }
    if (tinh) {
      query = query.andWhere("tinh.ten_tinh", "like", `%${tinh}%`);
    }
    if (mien) {
      query = query.andWhere("mien.ten_mien", "like", `%${mien}%`);
    }

    // console.log(query.toString());

    const data = await query;
    const geojson = {
      type: "FeatureCollection",
      features: data.map((r) => ({
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [r.long, r.lat],
        },
        properties: {
          tentruong: r.tentruong,
          tennhom: r.ten_nhom || undefined,
          tentinh: r.ten_tinh || undefined,
          tenmien: r.ten_mien || undefined,
        },
      })),
    };

    res.status(200).json({ data, geojson });
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

router.post("/", helpers.authorizeMiddleware, async (req, res) => {
  const { ten_truong, coordinates, mo_ta, id_nhom } = req.body;

  if (req.auth.role !== "admin") {
    return res.status(400).json({ fail: "khong co quyen them truong" });
  }
  if (!ten_truong || !coordinates) {
    return res.status(400).json({ fail: "cần cung cấp tham số ten_truong và coordinates" });
  }
  if (
    !Array.isArray(coordinates) ||
    typeof coordinates[0] !== "number" ||
    typeof coordinates[1] !== "number"
  ) {
    return res.status(400).json({ fail: "coordination không hợp lệ [number, number]" });
  }
  if (id_nhom && !(await db("nhom").select(1).where("id_nhom", id_nhom))) {
    return res.status(400).json({ fail: "id_nhom khong hop le" });
  }
  if (!helpers.searchTinh(coordinates)) {
    return res.status(400).json({ fail: "khong nham trong dia phan VN" });
  }

  try {
    let STGeomFromText = helpers.convertToSTGeomFromText("Point", coordinates);

    const data = await db("truong")
      .insert({
        tentruong: ten_truong,
        toado: db.raw(STGeomFromText),
        mo_ta: mo_ta,
        id_nhom: id_nhom,
        id_tinh: helpers.searchTinh(coordinates),
      })
      .returning(["id_truong", "tentruong", "mo_ta", "id_tinh", "id_nhom"]);

    res.status(201).json(data[0]);
  } catch (e) {
    console.log(e);
    res
      .status(400)
      .json({ fail: "coordinate không hợp lệ với type hoặc xuất hiện lỗi ngoài ý muốn" });
  }
});

router.delete("/:id(\\d+)", helpers.authorizeMiddleware, async (req, res) => {
  const { id } = req.params;

  if (req.auth.role !== "admin") {
    return res.status(400).json({ fail: "khong co quyen them truong" });
  }

  const rowAffected = await db("truong").where("id_truong", id).del();
  if (rowAffected === 0) {
    res.status(404).json({ fail: "đối tượng không tồn tại" });
  } else {
    res.status(200).json({ rowAffected });
  }
});

router.put("/:id(\\d+)", helpers.authorizeMiddleware, async (req, res) => {
  const { id } = req.params;
  const { ten_truong, coordinates, mo_ta, id_nhom } = req.body;

  if (req.auth.role !== "admin") {
    return res.status(400).json({ fail: "khong co quyen them truong" });
  }
  if (!ten_truong && !coordinates && !mo_ta && !id_nhom) {
    return res.status(400).json({ fail: "cần cung cấp tham số ten_truong hoawc coordinates" });
  }
  if (
    coordinates &&
    (!Array.isArray(coordinates) ||
      typeof coordinates[0] !== "number" ||
      typeof coordinates[1] !== "number")
  ) {
    return res.status(400).json({ fail: "coordination không hợp lệ [number, number]" });
  }
  if (id_nhom && !(await db("nhom").select(1).where("id_nhom", id_nhom))) {
    return res.status(400).json({ fail: "id_nhom khong hop le" });
  }
  if (coordinates && !helpers.searchTinh(coordinates)) {
    return res.status(400).json({ fail: "khong nham trong dia phan VN" });
  }

  try {
    const rowAffected = await db("truong")
      .update({
        tentruong: ten_truong,
        toado: coordinates && db.raw(helpers.convertToSTGeomFromText("Point", coordinates)),
        mo_ta: mo_ta,
        id_nhom: id_nhom,
        id_tinh: coordinates && helpers.searchTinh(coordinates),
      })
      .where("id_truong", id);

    res.status(201).json({ rowAffected });
  } catch (e) {
    console.log(e);
    res
      .status(400)
      .json({ fail: "coordinate không hợp lệ với type hoặc xuất hiện lỗi ngoài ý muốn" });
  }
});

module.exports = router;
