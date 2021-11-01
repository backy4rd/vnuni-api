const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let miens = await db
      .select('*')
      .from('mien');


    res.status(200).json(miens);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

module.exports = router;
