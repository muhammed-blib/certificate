echo "Hello World" > index.html
docker build -t html.
docker run -p 80:80 html
