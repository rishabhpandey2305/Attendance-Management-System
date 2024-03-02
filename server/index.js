const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const attendanceRouter = require('./src/models/attendance');
const attendanceCheck = require('./src/models/attendanceCheck');
const authRouter = require('./src/routes/auth');
const loggingMiddleware = require('./src/middlewares/loggingMiddleware');
const authenticationMiddleware = require('./src/middlewares/authenticationMiddleware');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/', attendanceRouter);
app.use('/', attendanceCheck);
app.use('/auth', authRouter);
// Use logging middleware
app.use(loggingMiddleware);

// Use authentication middleware
app.use(authenticationMiddleware);


app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
