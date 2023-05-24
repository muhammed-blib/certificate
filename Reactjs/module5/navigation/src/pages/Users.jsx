import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { users } from "../utils/users";

const Users = () => {
  return (
    <div className="p-4">
      <h1 className="text-2xl font-bold mb-4">Users</h1>
      <ul className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
        {users.map((user) => (
          <li key={user.id} className="bg-gray-100 rounded-lg p-4">
            {user.name}

            <div className="mt-2 text-gray-500">{user.email}</div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Users;
