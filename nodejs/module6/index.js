const express = require("express");
const app = express();

// serve the HTML form
app.get("/form", (req, res) => {
  res.sendFile(__dirname + "/form.html");
});

// handle form submissions
app.post("/form", (req, res) => {
  let formData = "";
  req.on("data", (chunk) => {
    formData += chunk.toString();
  });
  req.on("end", () => {
    console.log(formData);
    res.send("Form data received");
  });
});

// start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
