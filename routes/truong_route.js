const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  const { truong, tinh, mien, nhom } = req.query;

  try {
    let query = db
      .select('*', 'toado.STY AS lat', 'toado.STX AS long')
      .innerJoin('nhom', 'nhom.id_nhom', 'truong.id_nhom')
      .innerJoin('tinh', 'tinh.id_tinh', 'truong.id_tinh')
      .innerJoin('mien', 'mien.id_mien', 'tinh.id_mien')
      .from('truong');

    if (truong) {
      query = query.andWhere('truong.tentruong', 'like', `%${truong}%`);
    }
    if (nhom) {
      query = query.andWhere('nhom.ten_nhom', 'like', `%${nhom}%`);
    }
    if (tinh) {
      query = query.andWhere('tinh.ten_tinh', 'like', `%${tinh}%`);
    }
    if (mien) {
      query = query.andWhere('mien.ten_mien', 'like', `%${mien}%`);
    }

    // console.log(query.toString());

    const data = await query;
    const geojson = {
      type: 'FeatureCollection',
      features: data.map((r) => ({
        type: 'Feature',
        geometry: {
          type: 'Point',
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

    res.status(200).json(geojson);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

module.exports = router;
