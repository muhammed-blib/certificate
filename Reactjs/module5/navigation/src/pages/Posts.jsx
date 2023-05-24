import { Link } from "react-router-dom";
import React from "react";

const Post = (props) => {
  const { id, title, author, body, date } = props;
  return (
    <div className="p-4 bg-gray-100 rounded-md shadow-md">
      <Link to={`/posts/${id}`}>
        <h2 className="text-lg font-bold">{title}</h2>
      </Link>
      <div className="text-gray-600 text-sm mb-2">
        By {author} on {date}
      </div>
      <p className="text-gray-800">{body}</p>
    </div>
  );
};

export default Post;
