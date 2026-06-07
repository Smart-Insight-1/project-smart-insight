var dashboardModel = require("../models/dashboard");

function obterInteracoesPorProduto(req, res) {
    let id_loja = req.params.idLoja;

    dashboardModel.obterInteracoesPorProduto(id_loja)
        .then(function (resultado) {
            console.log(`\nResultados encontrados: ${resultado.length}`);
            console.log(`Resultados: ${JSON.stringify(resultado)}`);
            res.json(resultado);
        }).catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

function obterInteracoesPorSetor(req, res) {
    let id_loja = req.params.idLoja;

    dashboardModel.obterInteracoesPorSetor(id_loja)
        .then(function (resultado) {
            console.log(`\nResultados encontrados: ${resultado.length}`);
            console.log(`Resultados: ${JSON.stringify(resultado)}`);
            res.json(resultado);
        }).catch(function (erro) {
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
}

function obterKpis(req, res) {
    let id_loja = req.params.idLoja;
    let dataInicio = req.query.dataInicio;
    let dataFim = req.query.dataFim;


    if (!dataInicio || !dataFim) {
        res.status(400).json("Informe as datas!");
        return;
    }

    dashboardModel.obterKpis(id_loja, dataInicio, dataFim)
        .then(function (resultado) {
            let totalAtual = resultado[0][0].total_atual;
            let totalAnterior = resultado[1][0].total_anterior;
            let variacao = Math.round(((totalAtual - totalAnterior) / totalAnterior) * 100);
            let tempoAtual = resultado[4][0].tempo_medio;
            let tempoAnterior = resultado[5][0].tempo_medio_anterior;
            let variacaoTempo = Math.round(((tempoAtual - tempoAnterior) / tempoAnterior) * 100);

            res.json({
                totalAtual: totalAtual,
                variacaoPercentual: variacao,
                topProdutoAtual: resultado[2][0].produto,
                topProdutoAnterior: resultado[2][1].produto,
                topSetorAtual: resultado[3][0].setor,
                topSetorAnterior: resultado[3][1].setor,
                tempoMedio: resultado[4][0].tempo_medio,
                variacaoTempo: variacaoTempo
            });
        }).catch(function (erro) {
            console.log(erro);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    obterInteracoesPorProduto,
    obterInteracoesPorSetor,
    obterTempoRetencao,
    obterInteracoesPorHora,
    obterKpis
}