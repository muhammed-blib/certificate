// Login route
import express from "express";
import User from "../controller/dbController.mjs";
const Login = express.Router();

Login.post("/login", async (req, res) => {
  try {
    // Validate user input
    const { username, password } = req.body;

    // Find the user by username
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(404).json({ error: "Incorrect credentials" });
    }

    // Compare the provided password with the hashed password stored in the database
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(404).json({ error: "Incorrect credentials" });
    }

    res.json({ message: "Login successful" });
  } catch (error) {
    if (error.name === "ValidationError") {
      res.status(400).json({ error: "Invalid input" });
    } else {
      console.error("Error during login:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  }
});
export default Login;
