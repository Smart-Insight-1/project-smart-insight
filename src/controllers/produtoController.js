var produtoModel = require("../models/produtoModel");

function listarProduto(req, res) {
    var id_loja = req.params.idLoja;

        produtoModel.listarProduto(id_loja)
        .then(
            function (resultadoProduto) {
                console.log(`\nResultados encontrados: ${resultadoProduto.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoProduto)}`); // transforma JSON em String

                    res.json(resultadoProduto);
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
    listarProduto
}