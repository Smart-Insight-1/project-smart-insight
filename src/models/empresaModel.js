var database = require("../database/config");

function cadastrarEmpresa(razaoSocial, cnpjEmpresa, nomeLoja, cnpjLoja, nomeGestor, emailGestor, senhaGestor) {
    console.log('Acessando o model cadastrar empresa');

    var instrucaoSql = `
    INSERT INTO empresa (razao_social, cnpj) VALUES
        ('${razaoSocial}', '${cnpjEmpresa}');

    INSERT INTO usuario (id_empresa, nome, email, senha, tipo_usuario) VALUES
        ((SELECT id_empresa FROM empresa WHERE cnpj = '${cnpjEmpresa}'), 
        '${nomeGestor}', '${emailGestor}', '${senhaGestor}', 'gestor');

    INSERT INTO loja (id_empresa, nome_loja, cnpj) VALUES
        ((SELECT id_empresa FROM empresa WHERE cnpj = '${cnpjEmpresa}'), 
        '${nomeLoja}', '${cnpjLoja}');`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
};

module.exports = {
    cadastrarEmpresa
}
