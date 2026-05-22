var database = require("../database/config")

function buscarLojaUsuario(id) {
    console.log('acessando model loja');

    var instrucaoSql = `SELECT id_loja, nome_loja FROM acesso_loja al
    JOIN loja l ON al.id_loja = l.id_loja;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}