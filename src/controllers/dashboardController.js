var produtoModel = require("../models/produtoModel");
var dashboardModel = require("../models/dashboard");

function obterInteracoesPorProduto(req, res) {
    var id_loja = req.params.idLoja;

    dashboardModel.obterInteracoesPorProduto(id_loja)
        .then(function (resultado) {
            console.log(`\nResultados encontrados: ${resultado.length}`);
            console.log(`Resultados: ${JSON.stringify(resultado)}`);

            res.json(resultado);
        }).catch(function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao realizar o cadastro! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        });
}
function obterInteracoesPorSetor(req, res) {
    var id_loja = req.params.idLoja;

       dashboardModel.obterInteracoesPorSetor(id_loja)
        .then(function(resultado) {
            console.log(`\nResultados encontrados: ${resultado.length}`);
            console.log(`Resultados: ${JSON.stringify(resultado)}`);
            res.json(resultado);
        }).catch(function(erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function obterTempoRetencao(req, res) {
    var id_loja = req.params.idLoja;

    if (id_loja == undefined) {
        res.status(400).send("O ID da loja está undefined!");
    } else {
        dashboardModel.obterTempoRetencao(id_loja)
            .then(function (resultado) {
                res.json(resultado);
            })
            .catch(function (erro) {
                console.log(erro);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function obterInteracoesPorHora(req, res) {
    var id_loja = req.params.idLoja;
}

module.exports = {
    obterInteracoesPorProduto,
    obterInteracoesPorSetor,
    obterTempoRetencao,
    obterInteracoesPorHora,
}