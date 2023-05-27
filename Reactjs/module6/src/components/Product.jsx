import React from 'react';

function Product(props) {
    const handleAddToCart = () => {
        const product = {
            id: 1, // Replace with the actual product ID
            name: 'Product Name', // Replace with the actual product name
            price: 10, // Replace with the actual product price
        };
        props.onAddToCart(product);
    };

    return (
        <div>
            <h3>Product Component</h3>
            <button onClick={handleAddToCart}>Add to Cart</button>
        </div>
    );
}

export default Product;
