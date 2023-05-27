import React from 'react';
import Product from './Product';

function Cart() {
    const [products, setProducts] = React.useState([]);

    // Function to add a product to the cart
    const addProductToCart = (product) => {
        setProducts([...products, product]);
    };

    return (
        <div>
            <h2>Cart Component</h2>
            <Product onAddToCart={addProductToCart} />
            <p>Bought Products: {products.length}</p>
            <ul>
                {products.map((product) => (
                    <li key={product.id}>{product.name}</li>
                ))}
            </ul>
        </div>
    );
}

export default Cart;
