import express from "express";
import Login from "./routes/login.mjs";
import SignUP from "./routes/signup.mjs";
const app = express();
const port = 3000;

app.use("Login", Login);
app.use("SignUP", SignUP);

app.listen(port, () => {
  console.log(`app is listening on port ${port}`);
});
