const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const attendanceRouter = require('./src/models/attendance');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/', attendanceRouter);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
