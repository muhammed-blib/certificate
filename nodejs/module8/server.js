// server.js
const express = require('express');
const { sum } = require('./math');

const app = express();
app.use(express.json());

app.post('/sum', (req, res) => {
  const { numbers } = req.body;
  const result = sum(numbers);
  res.json({ result });
});

module.exports = app;
