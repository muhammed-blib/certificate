const http = require("http");
const url = require("url");
const querystring = require("querystring");

const server = http.createServer(handleRequest);

function handleRequest(req, res) {
  const { pathname, query } = url.parse(req.url, true);

  if (pathname === "/form") {
    handleFormRequest(req, res);
  } else if (pathname === "/querystring") {
    handleQueryStringRequest(req, res, query);
  } else {
    res.writeHead(404, { "Content-Type": "text/plain" });
    res.end("404 Not Found");
  }
}

function handleFormRequest(req, res) {
  if (req.method === "POST") {
    let body = "";

    req.on("data", (chunk) => {
      body += chunk.toString();
    });

    req.on("end", () => {
      const formData = querystring.parse(body);
      showFormData(res, formData);
    });
  } else {
    showForm(res);
  }
}

function showForm(res) {
  res.writeHead(200, { "Content-Type": "text/html" });
  res.end(`
    <form method="POST" action="/form">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name"><br>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email"><br>
      <button type="submit">Submit</button>
    </form>
  `);
}

function showFormData(res, formData) {
  res.writeHead(200, { "Content-Type": "text/html" });
  res.end(`
    <h2>Form Data:</h2>
    <p>Name: ${formData.name}</p>
    <p>Email: ${formData.email}</p>
  `);
}

function handleQueryStringRequest(req, res, query) {
  res.writeHead(200, { "Content-Type": "text/html" });

  if (Object.keys(query).length === 0) {
    res.end("<p>No query string data provided.</p>");
  } else {
    const decodedQuery = decodeQueryString(query);
    res.end(
      `<p>Decoded Query String Data: ${JSON.stringify(decodedQuery)}</p>`
    );
  }
}

function decodeQueryString(query) {
  const decoded = {};

  for (const [key, value] of Object.entries(query)) {
    decoded[key] = decodeURIComponent(value);
  }

  return decoded;
}

server.listen(3000, () => {
  console.log("Server listening on port 3000");
});
