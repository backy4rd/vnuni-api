const express = require("express");
const db = require("../database.js");
const { convertToSTGeomFromTextValue } = require("../helpers.js");

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    let query = db
      .select("id", "mota", db.raw("dbo.geomToGeoJSON(toado) AS geometry"))
      .from("khac");

    const geojson = {
      type: "FeatureCollection",
      features: (await query).map((r) => ({
        type: "Feature",
        geometry: JSON.parse(r.geometry),
        properties: r,
      })),
    };

    res.status(200).json(geojson);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

router.post("/", async (req, res) => {
  const { type, coordinates, mota } = req.body;

  if (!type || !coordinates) {
    return res.status(400).json({ fail: "cần cung cấp tham số type và coordinates" });
  }
  if (type !== "Polygon" && type !== "Point" && type !== "LineString") {
    return res.status(400).json({ fail: "type chỉ có 3 giá trị: Point, Polygon, LineString" });
  }
  if (!Array.isArray(coordinates)) {
    return res.status(400).json({ fail: "coordination không hợp lệ, Array only" });
  }

  let STGeomFromText = convertToSTGeomFromTextValue(type, coordinates);

  try {
    const data = await db
      .insert({
        toado: db.raw(`geometry::STGeomFromText('${STGeomFromText}', 0)`),
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

router.put("/:id(\\d+)", async (req, res) => {
  const { id } = req.params;
  const { coordinates, mota } = req.body;

  if (coordinates && !Array.isArray(coordinates)) {
    return res.status(400).json({ fail: "coordination không hợp lệ, Array only" });
  }

  const item = await db
    .select("id", "mota", db.raw("dbo.geomToGeoJSON(toado) AS geometry"))
    .from("khac")
    .where("id", id)
    .first();

  if (!item) {
    return res.status(400).json({ fail: "đối tượng không tồn tại" });
  }

  let STGeomFromText =
    coordinates && convertToSTGeomFromTextValue(JSON.parse(item.geometry).type, coordinates);

  try {
    const rowAffected = await db("khac")
      .update({
        toado: STGeomFromText && db.raw(`geometry::STGeomFromText('${STGeomFromText}', 0)`),
        mota: mota,
      })
      .where("id", id);

    res.status(200).json({ rowAffected });
  } catch (e) {
    console.log(e);
    res
      .status(400)
      .json({ fail: "coordinate không hợp lệ với type hoặc xuất hiện lỗi ngoài ý muốn" });
  }
});

router.delete("/:id(\\d+)", async (req, res) => {
  const { id } = req.params;

  const rowAffected = await db("khac").where("id", id).del();

  if (rowAffected === 0) {
    res.status(400).json({ fail: "đối tượng không tồn tại" });
  } else {
    res.status(200).json({ rowAffected });
  }
});

module.exports = router;
