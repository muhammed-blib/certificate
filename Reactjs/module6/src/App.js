import React from 'react';
import Main from './components/Main';
import ProductList from './components/ProductList';
import TotalPrice from './components/TotalPrice';

function App() {
  return (
    <div>
      <Main />
      <ProductList />
      <TotalPrice />
    </div>
  );
}

export default App;