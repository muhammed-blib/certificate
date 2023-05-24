// main.js

const express = require("express");
const events = require("events");
const handler = require("./handler");

const app = express();
const eventEmitter = new events.EventEmitter();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/user/:username", (req, res) => {
  const { username } = req.params;
  eventEmitter.emit("connect", username);
  res.send(`User ${username} connected to the server`);
});

eventEmitter.on("connect", handler.handleConnect);

app.listen(3000, () => {
  console.log("Example app listening on port 3000!");
});
