const Todo = require("../models/Todo");

exports.createTodo = async (req, res) => {
  const todo = new Todo({
    description: req.body.description,
    done: false,
  });
  const newTodo = await todo.save();
  return newTodo;
};

exports.getAllTodos = async (req, res) => {
  const todos = await Todo.find();

  if (!todos || todos.length === 0) {
    return res.status(200).json([]);
  }

  res.json(todos);
};

exports.getTodoById = async (req, res) => {
  const todo = await Todo.findById(req.params.id);
  res.json(todo);
};

exports.updateTodoById = async (req, res) => {
  const todo = await Todo.findByIdAndUpdate(
    req.params.id,
    { done: req.body.done },
    { new: true }
  );
  res.json(todo);
};

exports.deleteTodoById = async (req, res) => {
  await Todo.findByIdAndRemove(req.params.id);
  res.send("Todo deleted");
};
