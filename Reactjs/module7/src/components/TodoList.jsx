import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

function TodoList() {
    const todos = useSelector(state => state.todos);
    const dispatch = useDispatch();

    const handleTodoClick = id => {
        dispatch({ type: 'TOGGLE_TODO', payload: id });
    };

    return (
        <ul>
            {todos.map(todo => (
                <li
                    key={todo.id}
                    onClick={() => handleTodoClick(todo.id)}
                    style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}
                >
                    {todo.description}
                </li>
            ))}
        </ul>
    );
}

export default TodoList;
