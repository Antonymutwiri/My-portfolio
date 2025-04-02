// server.js
const express = require('express');
const cors = require('cors');
const db = require('./db');

const app = express();
app.use(cors());
app.use(express.json());

// Test database connection
app.get('/api/test-db', async (req, res) => {
  try {
    const [result] = await db.query('SELECT 1 + 1 AS solution');
    res.json({ message: 'Database connected!', solution: result[0].solution });
  } catch (err) {
    res.status(500).json({ error: 'Database connection failed' });
  }
});

// Get all skills
app.get('/api/skills', async (req, res) => {
  try {
    const [skills] = await db.query('SELECT * FROM skills');
    res.json(skills);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});