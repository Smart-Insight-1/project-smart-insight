var database = require("../database/config")

function obterInteracoesPorProduto(id_loja) {
    var instrucao = `
        SELECT
            produto,
            COUNT(*) AS total_interacoes
        FROM vw_graficos
            WHERE id_loja = '${id_loja}'
            GROUP BY produto
            ORDER BY total_interacoes DESC
            LIMIT 5;
    `;
    return database.executar(instrucao);
}

function obterInteracoesPorSetor(id_loja) {
    var instrucao = `
        SELECT
            setor,
            COUNT(*) AS total_interacoes
        FROM vw_graficos
            WHERE id_loja = '${id_loja}'
            GROUP BY setor
            ORDER BY total_interacoes DESC
            LIMIT 5;
    `;
    return database.executar(instrucao);
}



function obterTempoRetencao(id_loja) {
    var instrucao = `
        SELECT
            produto,
            ROUND(AVG(duracao),0) AS tempo_medio
        FROM vw_graficos
            WHERE id_loja = '${id_loja}'
            GROUP BY produto
            ORDER BY tempo_medio DESC
            LIMIT 5;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterKpis(id_loja, dataInicio, dataFim) {
    var instrucao = `

-- Total atual
SELECT COUNT(id_interacao) AS total_atual
FROM vw_kpi
WHERE id_loja = ${id_loja}
AND DATE(horario) BETWEEN '${dataInicio}' AND '${dataFim}';

-- Total anterior
SELECT COUNT(id_interacao) AS total_anterior
FROM vw_kpi
WHERE id_loja = ${id_loja}
AND DATE(horario) BETWEEN
    DATE_SUB('${dataInicio}', INTERVAL DATEDIFF('${dataFim}', '${dataInicio}') + 1 DAY)
    AND DATE_SUB('${dataInicio}', INTERVAL 1 DAY);

        -- Top 2 produtos no período atual
        SELECT
			produto,
			COUNT(id_interacao) AS total
		FROM vw_kpi
		WHERE id_loja = ${id_loja}
		AND DATE(horario) BETWEEN '${dataInicio}' AND '${dataFim}'
		GROUP BY produto
		ORDER BY total DESC
		LIMIT 2;

        -- Top 2 setores no período atual
        SELECT
			setor,
			COUNT(id_interacao) AS total
		FROM vw_kpi
		WHERE id_loja = ${id_loja}
		AND DATE(horario) BETWEEN '${dataInicio}' AND '${dataFim}'
		GROUP BY setor
		ORDER BY total DESC
		LIMIT 2;

        -- Tempo médio de retenção no período atual
        SELECT
			ROUND(AVG(duracao),0) AS tempo_medio
		FROM vw_kpi
		WHERE id_loja = ${id_loja}
		AND DATE(horario) BETWEEN '${dataInicio}' AND '${dataFim}';

        -- Tempo médio no período anterior
    SELECT
		ROUND(AVG(duracao),0) AS tempo_medio_anterior
	FROM vw_kpi
	WHERE id_loja = ${id_loja}
	AND DATE(horario) BETWEEN
	DATE_SUB('${dataInicio}', INTERVAL DATEDIFF('${dataFim}', '${dataInicio}') + 1 DAY)
	AND DATE_SUB('${dataInicio}', INTERVAL 1 DAY);
    `;
    return database.executar(instrucao);
}

function obterInteracoesPorHora(id_loja) {
    var instrucao = `
        SELECT
            HOUR(horario) AS hora,
            COUNT(*) AS total_interacoes
        FROM vw_graficos
            WHERE id_loja = '${id_loja}'
            GROUP BY HOUR(horario)
            ORDER BY hora;
    `;
    return database.executar(instrucao);
}

module.exports = {
    obterInteracoesPorProduto,
    obterInteracoesPorSetor,
    obterTempoRetencao,
    obterInteracoesPorHora,
    obterKpis
}