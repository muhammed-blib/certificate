import { useParams } from "react-router-dom";
import { posts } from "../utils/posts";
import Posts from "../pages/Posts";

const User = () => {
  const { user_id } = useParams();

  const userPosts = posts.filter((post) => post.author === parseInt(user_id));

  return (
    <div>
      {userPosts.map((post) => (
        <Posts {...post} />
      ))}
    </div>
  );
};

export default User;
