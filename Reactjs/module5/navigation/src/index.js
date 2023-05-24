import React from "react";
import App from "./App";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./style.css";
import "./index.css";
import { ErrorPage, PostById, UsersById } from "./components";

import Users from "./pages/Users";
const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
    errorElement: <ErrorPage />,
  },
  {
    path: "/users",
    element: <Users />,
  },

  {
    path: "posts/:post_id",
    element: <PostById />,
  },
  {
    path: "posts/:user_id",
    element: <UsersById />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
