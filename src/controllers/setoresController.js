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

module.exports = {
    listarSetorPorLoja
}