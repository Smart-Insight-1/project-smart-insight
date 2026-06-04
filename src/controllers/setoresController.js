var setoresModel = require("../models/setoresModel");

function listarSetorPorLoja(req, res) {
    var id_loja = req.params.idLoja;

        setoresModel.listarSetorPorLoja(id_loja)
        .then(
            function (resultadoSetor) {
                console.log(`\nResultados encontrados: ${resultadoSetor.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoSetor)}`); // transforma JSON em String

                    res.json(resultadoSetor);
            })
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

function deletarSetorPorLoja(req, res) {
    var id_loja = req.params.idLoja;
    var id_setor = req.params.idSetor

        setoresModel.deletarSetorPorLoja(id_loja, id_setor)
        .then(
            function (resultadoSetor) {
                console.log(`\nResultados encontrados: ${resultadoSetor.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoSetor)}`); // transforma JSON em String

                    res.json(resultadoSetor);
            })
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

function inserirSetorPorLoja(req, res) {
    var id_loja = req.params.idLoja;
    var nome_setor = req.body.nomeSetor;
    var descricao = req.body.descricao;

        setoresModel.inserirSetorPorLoja(id_loja, nome_setor, descricao)
        .then(
            function (resultadoSetor) {
                console.log(`\nResultados encontrados: ${resultadoSetor.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoSetor)}`); // transforma JSON em String

                    res.json(resultadoSetor);
            })
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
}

module.exports = {
    listarSetorPorLoja,
    deletarSetorPorLoja,
    inserirSetorPorLoja
}