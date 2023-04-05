import React from "react";
import { useParams } from "react-router-dom";
import { posts } from "../utils/posts";
import Posts from "../pages/Posts";

const PostById = () => {
  const { post_id } = useParams();

  // Find the post with the matching id
  const post = posts.filter((post) => post.id === parseInt(post_id));
  console.log(post, "post");
  // If the post is not found, display a message
  if (!post) {
    return <div>Post not found</div>;
  }

  return <Posts {...post[0]} />;
};

export default PostById;
