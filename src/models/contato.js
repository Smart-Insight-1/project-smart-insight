var database = require("../database/config");

function listarContato(id_usuario) {
    console.log('Acessando o model para listar os contatos');

    var instrucaoSql = `SELECT id_contato, telefone FROM contato WHERE id_usuario = ${id_usuario};`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function deletarContato(id_contato, telefone) {
    console.log('Acessando o model para deletar os setores');

    var instrucaoSql = `DELETE FROM contato WHERE id_contato = ${id_contato}`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

function inserirContato(id_usuario, telefone) {
    console.log('Acessando o model para adicionar os setores');

    var instrucaoSql = `INSERT INTO contato 
    (id_usuario, telefone) VALUES
    ('${id_usuario}', '${telefone}');`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

module.exports = {
    listarContato,
    deletarContato,
    inserirContato
}