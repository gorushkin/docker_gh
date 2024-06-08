import express from 'express';

console.log('start');

const app = express();
const port = 3000;

app.get('/', (_, res) => {
  res.send({
    message: 'Server is running!!!',
  });
});

app.get('/node', (req, res) => {
  res.send({
    message: 'Hello World!',
  });
});

app.get('/time', (req, res) => {
  const date = new Date().toDateString();
  res.send({
    date,
  });
});

app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
