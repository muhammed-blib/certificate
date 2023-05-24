import express from "express";
const app = express();
import axios from "axios";

app.use(express.json());

// Define a route to pass requests to the second application
app.post("/todos", async (req, res) => {
  try {
    // Send the request to the second application
    const response = await axios.post("http://localhost:3001/todos", req.body);
    res.json(response.data);
  } catch (error) {
    res.status(500).json({ error: "An error occurred" });
  }
});

app.listen(3000, () => {
  console.log("First application listening on port 3000");
});
