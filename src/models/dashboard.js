var database = require("../database/config")


function obterTempoRetencao(id_loja) {
    var instrucao = `
        SELECT 
            p.nome AS produto, 
            ROUND(AVG(i.duracao), 0) AS tempo_medio
        FROM produto p
        JOIN sensor s ON p.id_produto = s.id_produto
        JOIN interacao i ON s.id_sensor = i.id_sensor
        WHERE p.id_loja = ${id_loja}
        GROUP BY p.id_produto, p.nome
        ORDER BY tempo_medio DESC
        LIMIT 6;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


module.exports = {
    obterInteracoesPorProduto,
    obterInteracoesPorSetor,
    obterTempoRetencao,
    obterInteracoesPorHora,
}