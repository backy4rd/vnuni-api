const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let builder = db
      .select('*', 'toado.STY AS lat', 'toado.STX AS long')
      .from('truong');

    if (true) {
      builder = builder.innerJoin('nhom', 'truong.id_nhom', 'nhom.id_nhom');
      builder = builder.innerJoin('tinh', 'truong.id_tinh', 'tinh.id_tinh');
    }

    res.status(200).json({
      type: 'truong DH',
      features: (await builder).map((r) => ({
        type: 'Feature',
        geometry: {
          type: 'point',
          coordinates: [r.long, r.lat],
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
