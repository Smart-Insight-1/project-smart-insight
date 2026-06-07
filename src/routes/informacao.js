var express = require("express");
var router = express.Router();

var informacaoController = require('../controllers/informacaoController');

router.get("/buscarInformacoesEmpresaLoja/:idLoja", function (req, res) {
    informacaoController.buscarInformacoesEmpresaLoja(req, res)
});

module.exports = router;