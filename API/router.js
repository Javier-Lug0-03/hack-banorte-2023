const express = require('express');
const router = express.Router();
const db = require('./config');

router.get('/data', (req, res) => {
    db.query('SELECT * FROM turnos', (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
})

module.exports = router;