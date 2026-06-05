var database = require("../database/config");

function listarProduto(id_loja) {
    console.log('Acessando o model para listar os produtos');

    var instrucaoSql = `SELECT * FROM produto WHERE id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

function inserirProduto(id_loja, nome, tipo_produto, cod_produto, marca) {
    console.log('Acessando o model para inserir o produto');

    var instrucaoSql = `INSERT INTO produto 
    (id_loja, nome, tipo_produto, cod_produto, marca) VALUES
    ('${id_loja}', '${nome}', '${tipo_produto}', '${cod_produto}', '${marca}');`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

function deletarProduto(id_loja, cod_produto) {
    console.log('Acessando o model para deletar o produto');

    var instrucaoSql = `DELETE FROM produto WHERE cod_produto = '${cod_produto}' AND id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listarProduto,
    inserirProduto,
    deletarProduto
}