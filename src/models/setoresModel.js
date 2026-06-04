var database = require("../database/config");

function listarSetorPorLoja(id_loja) {
    console.log('Acessando o model para listar os setores');

    var instrucaoSql = `SELECT id_setor AS ID, nome_setor AS "Nome do Setor", descricao AS Descrição FROM setor_amostra WHERE id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listarSetorPorLoja
}