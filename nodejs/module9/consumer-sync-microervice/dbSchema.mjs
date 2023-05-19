import mongoose from "mongoose";

mongoose.connect("mongodb://localhost/todoDB", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Define a Todo schema
const todoSchema = new mongoose.Schema({
  title: String,
  description: String,
});
export const Todo = mongoose.model("Todo", todoSchema);
