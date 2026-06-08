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

function inserirProduto(req, res) {
    var id_loja = req.params.idLoja;
    var nome = req.body.nome;
    var tipo_produto = req.body.tipoProduto;
    var cod_produto = req.body.codProduto;
    var marca = req.body.marca;
    var setor = req.body.setor;

    produtoModel.inserirProduto(id_loja, nome, tipo_produto, cod_produto, marca, setor)
        .then(function (resultadoProduto) {
            console.log(
                `\nResultados encontrados: ${resultadoProduto.length}`
            );
            console.log(
                `Resultados: ${JSON.stringify(resultadoProduto)}`
            );

            res.json(resultadoProduto);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao inserir! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}



function deletarProduto(req, res) {
    var id_loja = req.params.idLoja;
    var cod_produto = req.params.codProduto;

    produtoModel.deletarProduto(id_loja, cod_produto)
        .then(function (resultadoProduto) {
            console.log(`\nResultados encontrados: ${resultadoProduto.length}`);
            console.log(`Resultados: ${JSON.stringify(resultadoProduto)}`);

            res.json(resultadoProduto);
        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\nHouve um erro ao deletar! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    listarProduto,
    inserirProduto,
    deletarProduto
}