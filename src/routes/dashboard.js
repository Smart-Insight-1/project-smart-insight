var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/interacoesPorProduto/:idLoja", function(req, res) {
    dashboardController.obterInteracoesPorProduto(req, res);
});

router.get("/interacoesPorSetor/:idLoja", function(req, res) {
    dashboardController.obterInteracoesPorSetor(req, res);
});

router.get("/tempoRetencao/:idLoja", function(req, res) {
    dashboardController.obterTempoRetencao(req, res);
});

router.get("/interacoesPorHora/:idLoja", function(req, res) {
    dashboardController.obterInteracoesPorHora(req, res);
});

router.get("/kpis/:idLoja", function(req, res) {
    dashboardController.obterKpis(req, res);
});
module.exports = router;