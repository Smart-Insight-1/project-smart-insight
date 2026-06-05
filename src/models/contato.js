var database = require("../database/config");

function listarContato(telefone) {
    console.log('Acessando o model para listar os contatos');

    var instrucaoSql = `SELECT telefone AS contato FROM contato WHERE telefone = ${telefone};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function deletarContato(id_contato, telefone) {
    console.log('Acessando o model para deletar os setores');

    var instrucaoSql = `DELETE FROM telefone WHERE id_contato = ${id_contato} AND telefone = ${telefone};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function inserirContato(id_contato, telefone) {
    console.log('Acessando o model para adicionar os setores');

    var instrucaoSql = `INSERT INTO contato 
    (id_contato, telefone) VALUES
    ('${id_contato}', '${telefone}');`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

module.exports = {
    listarContato,
    deletarContato,
    inserirContato
}