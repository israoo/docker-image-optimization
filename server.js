const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, Docker!');
});

if (process.env.NODE_ENV === 'production') {
  console.log('Running in production mode');
}

server.listen(3000, () => {
  console.log('Server running on http://localhost:3000/');
});
