import React from 'react';
import Product from './Product';

function ProductList() {
    const products = [
        { id: 1, name: 'Product 1', price: 10 },
        { id: 2, name: 'Product 2', price: 20 },
        // Add more products as needed
    ];

    return (
        <div>
            <h2>ProductList Component</h2>
            {products.map((product) => (
                <Product key={product.id} product={product} />
            ))}
        </div>
    );
}

export default ProductList;
