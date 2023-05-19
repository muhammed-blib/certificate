const express = require("express");
const todoController = require("../controller/TodoController");

const router = express.Router();

router.get("/", (req, res) => todoController.getAllTodos(req, res));
router.post("/create", (req, res) => todoController.createTodo(req, res));
router.get("/:id", (req, res) => todoController.getTodoById(req, res));
router.put("/:id", (req, res) => todoController.updateTodoById(req, res));
router.delete("/:id", (req, res) => todoController.deleteTodoById(req, res));

module.exports = router;
