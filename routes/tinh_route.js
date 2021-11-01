const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let tinhs = await db
      .select('*')
      .from('tinh');


    res.status(200).json(tinhs);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

module.exports = router;
