var informacaoModel = require('../models/informacaoModel');

function buscarInformacoesEmpresaLoja(req, res) {
    var idLoja = req.params.idLoja;

    if(idLoja == undefined || idLoja == null) {
        res.status(400).send('Id da Loja está vazio para buscar os dados');
    }

    informacaoModel.buscarInformacoesEmpresaLoja(idLoja).then((resultado) => {
        console.log("Resultados encontrados: ", resultado);
        if(resultado.length == 1) {
            res.status(200).json({
                razao_social: resultado[0].razao_social,
                cnpj_empresa: resultado[0].cnpj_empresa,
                nome_loja: resultado[0].nome_loja,
                cnpj_loja: resultado[0].cnpj_loja,
                endereco_loja: resultado[0].endereco_loja,
            });
        } else {
            res.status(403).send("Não foi possível encontrar as informações da Empresa e da Loja");
        }
    }).catch((err) => {
        console.log(err);
        console.log("\nHouve um erro ao buscar as informações! Erro: ", err.sqlMessage);
        res.status(500).json(err.sqlMessage);
    })
}

module.exports = {
    buscarInformacoesEmpresaLoja
}