var express = require("express");
var router = express.Router();

var produtoController = require("../controllers/produtoController");

router.get("/buscarProdutosPorLoja/:idLoja", function(req, res) {
    produtoController.listarProduto(req, res);
});

module.exports = router;