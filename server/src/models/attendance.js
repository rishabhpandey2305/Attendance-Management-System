const express = require('express');
const dbConnection = require('./src/db/db_connection');

const router = express.Router();

router.get('/', async (req, res) => {
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

router.post('/', async (req, res) => {
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

module.exports = router;
