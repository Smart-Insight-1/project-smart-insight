var database = require("../database/config");

function listarProduto(id_loja) {
    console.log('Acessando o model para listar os produtos');

     var instrucaoSql = `
    SELECT 
        p.cod_produto,
        p.nome,
        p.tipo_produto,
        p.marca,
        sa.nome_setor AS setor
    FROM produto p
    LEFT JOIN sensor s ON p.id_produto = s.id_produto
    LEFT JOIN setor_amostra sa ON s.id_setor = sa.id_setor
    WHERE p.id_loja = ${id_loja}
    GROUP BY p.id_produto, sa.nome_setor;
`

    console.log("Executando a instrução: ", instrucaoSql);
    return database.executar(instrucaoSql);
}

function inserirProduto(id_loja, nome, tipo_produto, cod_produto, marca, setor) {
    console.log('Acessando o model para inserir o produto');

    var instrucaoSql = `INSERT INTO produto 
    (id_loja, nome, tipo_produto, cod_produto, marca) VALUES
    ('${id_loja}', '${nome}', '${tipo_produto}', '${cod_produto}', '${marca}');
    
    INSERT INTO sensor (id_setor, id_produto, situacao, data_instalacao) VALUES
    (${setor}, (SELECT id_produto FROM produto WHERE cod_produto = '${cod_produto}';), DEFAULT, DEFAULT);
    `

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