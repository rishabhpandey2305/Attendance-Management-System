// src/routes/auth.js

const express = require('express');
const router = express.Router();
const dbConnection = require('../db/db_connection');

// User login route
router.post('/login', async (req, res) => {
    const { username, password } = req.body;

    try {
        const connection = await dbConnection();
        const [rows] = await connection.query('SELECT * FROM users WHERE username = ?', [username]);
        connection.release();

        if (rows.length === 0) {
            return res.status(401).json({ message: 'User not found' });
        }

        const user = rows[0];

        // Compare the passwords in plaintext
        if (password !== user.password) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        // If login successful, return user data
        res.status(200).json({ user });
    } catch (error) {
        console.error('Error authenticating user:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

module.exports = router;
