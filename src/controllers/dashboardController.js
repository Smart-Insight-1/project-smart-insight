var produtoModel = require("../models/produtoModel");

function obterInteracoesPorProduto(req, res) {
    var id_loja = req.params.idLoja;

    dashboardModel.interacoesPorProduto(id_loja)
        .then(function (resultado) {
            console.log(`\nResultados encontrados: ${resultado.length}`);
            console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

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
}
function obterTempoRetencao(req, res) {
    var id_loja = req.params.idLoja;
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