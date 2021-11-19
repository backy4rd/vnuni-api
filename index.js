require('dotenv').config({
  path: require('path').resolve(__dirname, './.env'),
});

const express = require('express');
const cors = require('cors');

const truongRoute = require('./routes/truong_route');
const tinhRoute = require('./routes/tinh_route');
const mienRoute = require('./routes/mien_route');
const nhomRoute = require('./routes/nhom_route');
const khacRoute = require('./routes/khac_route');
const taikhoanRoute = require('./routes/taikhoan_route');

const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use('/truong', truongRoute);
app.use('/tinh', tinhRoute);
app.use('/mien', mienRoute);
app.use('/nhom', nhomRoute);
app.use('/khac', khacRoute);
app.use('/taikhoan', taikhoanRoute);

app.listen(8000, (e) => {
  if (e) return console.log(e);
  console.log('app is listening on port 8000');
});
