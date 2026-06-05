var database = require("../database/config")

function obterInteracoesPorProduto(id_loja) {
    var instrucao = `
        SELECT p.nome AS produto, COUNT(i.id_interacao) AS total_interacoes
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN produto p ON s.id_produto = p.id_produto
        WHERE p.id_loja = ${id_loja}
        GROUP BY p.nome
        ORDER BY total_interacoes DESC
        LIMIT 6;
    `;
    return database.executar(instrucao);
}

function obterInteracoesPorSetor(id_loja) {
    var instrucao = `
        SELECT sa.nome_setor AS setor, COUNT(i.id_interacao) AS total_interacoes
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN setor_amostra sa ON s.id_setor = sa.id_setor
        WHERE sa.id_loja = ${id_loja}
        GROUP BY sa.nome_setor
        ORDER BY total_interacoes DESC;
    `;
    return database.executar(instrucao);
}



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

function obterKpis(id_loja, dataInicio, dataFim) {
    var instrucao = `
        -- Total de interações no período atual
        SELECT COUNT(i.id_interacao) AS total_atual
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN produto p ON s.id_produto = p.id_produto
        WHERE p.id_loja = ${id_loja}
        AND DATE(i.horario) BETWEEN '${dataInicio}' AND '${dataFim}';

        -- Produto com mais interações no período atual e anterior
        SELECT p.nome AS produto, COUNT(i.id_interacao) AS total
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN produto p ON s.id_produto = p.id_produto
        WHERE p.id_loja = ${id_loja}
        AND DATE(i.horario) BETWEEN '${dataInicio}' AND '${dataFim}'
        GROUP BY p.nome
        ORDER BY total DESC
        LIMIT 2;

        -- Setor com mais interações no período atual
        SELECT sa.nome_setor AS setor, COUNT(i.id_interacao) AS total
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN setor_amostra sa ON s.id_setor = sa.id_setor
        WHERE sa.id_loja = ${id_loja}
        AND DATE(i.horario) BETWEEN '${dataInicio}' AND '${dataFim}'
        GROUP BY sa.nome_setor
        ORDER BY total DESC
        LIMIT 2;

        -- Tempo médio de retenção no período atual
        SELECT ROUND(AVG(i.duracao), 0) AS tempo_medio
        FROM interacao i
        JOIN sensor s ON i.id_sensor = s.id_sensor
        JOIN produto p ON s.id_produto = p.id_produto
        WHERE p.id_loja = ${id_loja}
        AND DATE(i.horario) BETWEEN '${dataInicio}' AND '${dataFim}';
    `;
    return database.executar(instrucao);
}

module.exports = {
    obterInteracoesPorProduto,
    obterInteracoesPorSetor,
    obterTempoRetencao,
    obterKpis
}