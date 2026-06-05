var express = require("express");
var router = express.Router();

var produtoController = require("../controllers/produtoController");

router.get("/buscarProdutosPorLoja/:idLoja", function(req, res) {
    produtoController.listarProduto(req, res);
});

router.post("/inserirProduto/:idLoja", function(req, res) {
    produtoController.inserirProduto(req, res);
});

router.delete("/deletarProduto/:idLoja/:codProduto", function(req, res) {
    produtoController.deletarProduto(req, res);
});

module.exports = router;