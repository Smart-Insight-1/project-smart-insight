var express = require("express");
var router = express.Router();

var setoresController = require("../controllers/setoresController");

router.get("/buscarSetorPorLoja/:idLoja", function(req, res) {
    setoresController.listarProduto(req, res);
});

module.exports = router;