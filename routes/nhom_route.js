const express = require('express');
const db = require('../database.js');

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let nhoms = await db
      .select('*')
      .from('nhom');


    res.status(200).json(nhoms);
  } catch (e) {
    console.log(e);
    res.status(400).end();
  }
});

module.exports = router;

