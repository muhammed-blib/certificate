// App.test.js
import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import App from './App';

test('renders input element', () => {
  render(<App />);
  const inputElement = screen.getByPlaceholderText('Enter a todo');
  expect(inputElement).toBeInTheDocument();
});

test('updates input value', () => {
  render(<App />);
  const inputElement = screen.getByPlaceholderText('Enter a todo');
  fireEvent.change(inputElement, { target: { value: 'New Todo' } });
  expect(inputElement.value).toBe('New Todo');
});

test('adds todo to the list', () => {
  render(<App />);
  const inputElement = screen.getByPlaceholderText('Enter a todo');
  const addButton = screen.getByText('Add Todo');

  fireEvent.change(inputElement, { target: { value: 'New Todo' } });
  fireEvent.click(addButton);

  const todoElement = screen.getByText('New Todo');
  expect(todoElement).toBeInTheDocument();
});

test('marks todo as done when clicked', () => {
  render(<App />);
  const inputElement = screen.getByPlaceholderText('Enter a todo');
  const addButton = screen.getByText('Add Todo');

  fireEvent.change(inputElement, { target: { value: 'New Todo' } });
  fireEvent.click(addButton);

  const todoElement = screen.getByText('New Todo');
  fireEvent.click(todoElement);

  expect(todoElement).toHaveStyle('text-decoration: line-through');
});
