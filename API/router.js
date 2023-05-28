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

router.post('/data/:sucursal/:cuenta/:fecha/:hora/:motivo/:tipo/:atendido', (req, res) => {
    const sucursal = req.params.sucursal;
    const cuenta = req.params.cuenta;
    const fecha = req.params.fecha;
    const hora = req.params.hora;
    const motivo = req.params.motivo;
    const tipo = req.params.tipo;
    const atendido = req.params.atendido;
    db.query(`INSERT INTO turnos(sucursal,cuenta,fecha,hora,motivo,tipo,atendido) VALUES('${sucursal}','${cuenta}','${fecha}','${hora}','${motivo}','${tipo}','${atendido}')`, (err, result) => {
        if (err) {
            console.log(err);
        } else {
            res.send(result);
        }
    })
})



module.exports = router;