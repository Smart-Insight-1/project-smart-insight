var express = require("express");
var router = express.Router();

var setoresController = require("../controllers/setoresController");

router.get("/buscarSetorPorLoja/:idLoja", function(req, res) {
    setoresController.listarSetorPorLoja(req, res);
});

router.delete("/deletarSetorPorLoja/:idLoja/:idSetor", function(req, res) {
    setoresController.deletarSetorPorLoja(req, res);
});

router.post("/inserirSetorPorLoja/:idLoja", function(req, res) {
    setoresController.inserirSetorPorLoja(req, res);
});

module.exports = router;