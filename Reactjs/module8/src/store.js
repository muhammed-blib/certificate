import { createStore } from 'redux';

// Define initial state
const initialState = {
  todos: [],
};

// Define reducer function
function rootReducer(state = initialState, action) {
  switch (action.type) {
    case 'ADD_TODO':
      return {
        ...state,
        todos: [...state.todos, action.payload],
      };
    case 'TOGGLE_TODO':
      return {
        ...state,
        todos: state.todos.map(todo =>
          todo.id === action.payload ? { ...todo, completed: !todo.completed } : todo
        ),
      };
    default:
      return state;
  }
}

// Create Redux store
const store = createStore(rootReducer);

export default store;
