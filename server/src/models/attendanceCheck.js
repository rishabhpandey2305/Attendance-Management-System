// routes/attendanceRoutes.js

const express = require('express');
const dbConnection = require('../db/db_connection'); // Adjusted path

const router = express.Router();

router.get('/attendance/:enrollmentNumber', async (req, res) => {
    try {
        const connection = await dbConnection();
        const enrollmentNumber = req.params.enrollmentNumber;
        const query = 'SELECT * FROM attendance WHERE en_no = ?';
        const [results] = await connection.query(query, [enrollmentNumber]);
        connection.release();
        res.json(results);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error', details: error.message });
    }
});

router.get('/attendancePercentage/:enrollmentNumber/:subject', async (req, res) => {
    try {
        const connection = await dbConnection();
        const enrollmentNumber = req.params.enrollmentNumber;
        const subject = req.params.subject;

        // Count total attendance taken for that subject
        const queryTotalAttendance = 'SELECT COUNT(*) as totalAttendance FROM attendance WHERE en_no = ? AND subject = ?';
        const [totalAttendanceResult] = await connection.query(queryTotalAttendance, [enrollmentNumber, subject]);
        const totalAttendance = totalAttendanceResult[0].totalAttendance;

        // Count total present of that enrollment number for that subject
        const queryTotalPresent = 'SELECT COUNT(*) as totalPresent FROM attendance WHERE en_no = ? AND subject = ? AND status = "P"';
        const [totalPresentResult] = await connection.query(queryTotalPresent, [enrollmentNumber, subject]);
        const totalPresent = totalPresentResult[0].totalPresent;

        const attendancePercentage = (totalPresent / totalAttendance) * 100;

        connection.release();
        res.json({ enrollmentNumber, subject, attendancePercentage });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error', details: error.message });
    }
});

module.exports = router;
