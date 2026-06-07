var database = require('../database/config');

function buscarInformacoesEmpresaLoja(id_loja) {
    console.log('Entrando no MODEL, buscando as informações da empresa e loja');

    var instrucaoSql = `SELECT * FROM informacoes_empresa_loja WHERE id_loja = ${id_loja};`;

    console.log('Executando a Instrução SQL: ', instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarInformacoesEmpresaLoja
}