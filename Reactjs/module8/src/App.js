// App.js
import React, { useState } from 'react';

function App() {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  };

  const handleAddTodo = () => {
    if (inputValue) {
      setTodos([...todos, { description: inputValue, done: false }]);
      setInputValue('');
    }
  };

  const handleTodoClick = (index) => {
    const updatedTodos = [...todos];
    updatedTodos[index].done = !updatedTodos[index].done;
    setTodos(updatedTodos);
  };

  return (
    <div>
      <input
        type="text"
        value={inputValue}
        onChange={handleInputChange}
        placeholder="Enter a todo"
      />
      <button onClick={handleAddTodo}>Add Todo</button>

      <ul>
        {todos.map((todo, index) => (
          <li
            key={index}
            onClick={() => handleTodoClick(index)}
            style={{ textDecoration: todo.done ? 'line-through' : 'none' }}
          >
            {todo.description}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
