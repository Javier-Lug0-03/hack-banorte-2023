const express = require('express');
const app = express();
const port = 2000;
const router = require('./router');

app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
)

app.use('/', router);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})