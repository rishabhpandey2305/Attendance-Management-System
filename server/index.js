const express = require('express');
const bodyParser = require('body-parser');
const dbConnection = require('./db_connection');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());


app.get('/attendance', async (req, res) => {
  try {
    const connection = await dbConnection();
    const query = 'SELECT `en_no` FROM `student`';
    const [results] = await connection.query(query);
    connection.release();
    res.json(results);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
});


app.post('/attendance', async (req, res) => {
  try {
    const connection = await dbConnection();
    const records = req.body.records;

    for (const record of records) {
      const { en_no: enrollmentNumber, attendance } = record;
      const date = '11/01/2024';

      const query = `INSERT INTO attendance (en_no, attendance_date) VALUES (?, ?)
                  ON DUPLICATE KEY UPDATE attendance_date = ?`;

      await connection.query(query, [enrollmentNumber, attendance, attendance]);
    }

    connection.release();
    res.status(200).send('Attendance recorded successfully.');
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
