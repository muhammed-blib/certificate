import express from "express";
const app = express();

import { Todo } from "./dbSchema.mjs";
app.use(express.json());

// Save a todo
app.post("/todos", async (req, res) => {
  const { title, description } = req.body;
  const newTodo = new Todo({
    title,
    description,
  });
  try {
    await newTodo.save();
  } catch (err) {
    console.log(err);
  }
  res(200).json(`todo created successfully with title ${title}`);
});

// Get all todos
app.get("/todos", async (req, res) => {
  try {
    const todos = await Todo.find();
    res.json(200).send(todos);
  } catch (err) {
    console.log(err);
  }
});

app.listen(3001, () => {
  console.log("Second application listening on port 3001");
});
