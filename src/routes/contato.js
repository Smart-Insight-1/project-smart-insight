var express = require("express");
var router = express.Router();

var contatoController = require("../controllers/contatoController");

router.get("/buscarContato/:idContato", function(req, res) {
    contatoController.listarContato(req, res);
});

router.delete("/deletarContato/:idContato", function(req, res) {
    contatoController.deletarContato(req, res);
});

router.post("/inserirContato/:idContato", function(req, res) {
    contatoController.inserirContato(req, res);
});

module.exports = router;