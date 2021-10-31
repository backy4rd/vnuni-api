require('dotenv').config({
  path: require('path').resolve(__dirname, './.env'),
});

const express = require('express');
const cors = require('cors');

const truongRoute = require('./routes/truong_route');

const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use('/truong', truongRoute);

app.listen(8000, (e) => {
  if (e) return console.log(e);
  console.log('app is listening on port 8000');
});
