var database = require("../database/config");

function listarSetorPorLoja(id_loja) {
    console.log('Acessando o model para listar os setores');

    var instrucaoSql = `SELECT id_setor AS ID, nome_setor AS nome_setor, descricao AS Descrição FROM setor_amostra WHERE id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function deletarSetorPorLoja(id_loja, id_setor) {
    console.log('Acessando o model para deletar os setores');

    var instrucaoSql = `DELETE FROM setor_amostra WHERE id_setor = ${id_setor} AND id_loja = ${id_loja};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function inserirSetorPorLoja(id_loja, nome_setor, descricao) {
    console.log('Acessando o model para adicionar os setores');

    var instrucaoSql = `INSERT INTO setor_amostra 
    (id_loja, nome_setor, descricao) VALUES
    ('${id_loja}', '${nome_setor}', '${descricao}');`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

module.exports = {
    listarSetorPorLoja,
    deletarSetorPorLoja,
    inserirSetorPorLoja
}