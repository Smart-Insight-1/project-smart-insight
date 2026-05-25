var database = require("../database/config");

function listarProduto(id_loja) {
    console.log('Acessando o model para listar os produtos');

    var instrucaoSql = `SELECT * FROM produto WHERE id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

exports.module = {
    listarProduto
}