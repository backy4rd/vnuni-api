const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let query = db
      .select('*', 'toado.STY AS lat', 'toado.STX AS long')
      .from('truong');

    if (true) {
      query = query.innerJoin('nhom', 'truong.id_nhom', 'nhom.id_nhom');
      query = query.innerJoin('tinh', 'truong.id_tinh', 'tinh.id_tinh');
    }

    res.status(200).json({
      type: 'FeatureCollection',
      features: (await query).map((r) => ({
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [r.lat, r.long],
        },
        properties: {
          tentruong: r.tentruong,
          tennhom: r.ten_nhom || undefined,
          tentinh: r.ten_tinh || undefined,
        },
      })),
    });
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

module.exports = router;
