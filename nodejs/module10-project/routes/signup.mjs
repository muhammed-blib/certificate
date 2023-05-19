import express from "express";
import User from "../controller/dbController.mjs";

const SignUP = express.Router();

SignUP.post("/signup", async (req, res) => {
  try {
    // Validate user input
    const { username, password } = req.body;

    // Check if the username already exists
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ error: "Username already exists" });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user document
    const newUser = new User({
      username,
      password: hashedPassword,
    });

    // Save the new user document
    await newUser.save();

    res.status(201).json({ message: "User created successfully" });
  } catch (error) {
    if (error.name === "ValidationError") {
      res.status(400).json({ error: "Invalid input" });
    } else {
      console.error("Error during sign up:", error);
      res.status(500).json({ error: "Internal server error" });
    }
  }
});
export default SignUP;
