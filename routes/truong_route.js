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
  const { ten_truong, coordinates, mota } = req.body;

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

  let STGeomFromText = convertToSTGeomFromText(type, coordinates);

  try {
    const [{ valid }] = await db.select(db.raw(`${STGeomFromText}.STIsValid() AS valid`));
    if (!valid) throw new Error();

    const data = await db
      .insert({
        toado: db.raw(STGeomFromText),
        mota: mota,
      })
      .into("khac")
      .returning(["mota", "id"]);

    res.status(201).json(data[0]);
  } catch (e) {
    console.log(e);
    res
      .status(400)
      .json({ fail: "coordinate không hợp lệ với type hoặc xuất hiện lỗi ngoài ý muốn" });
  }
});

module.exports = router;
