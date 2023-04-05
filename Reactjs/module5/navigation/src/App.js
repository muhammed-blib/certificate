import Posts from "./pages/Posts";
import { posts } from "./utils/posts";

const App = () => {
  return (
    <div>
      {posts.map((post, index) => (
        <Posts {...post} />
      ))}
    </div>
  );
};

export default App;
