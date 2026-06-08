var empresaModel = require("../models/empresaModel");

function cadastrarEmpresa(req, res) {
    console.log('entrei no controller do cadastrar empresa')

    let razaoSocial = req.body.razaoSocialServer;
    let cnpjEmpresa = req.body.cnpjEmpresaServer;

    let nomeLoja = req.body.nomeLojaServer;
    let cnpjLoja = req.body.cnpjLojaServer;

    let nomeGestor = req.body.nomeGestorServer;
    let emailGestor = req.body.emailGestorServer;
    let senhaGestor = req.body.senhaGestorServer;

    empresaModel.cadastrarEmpresa(razaoSocial, cnpjEmpresa, nomeLoja, cnpjLoja, nomeGestor, emailGestor, senhaGestor)
        .then(
            function (resultado) {
                console.log(`\nResultados encontrados: ${resultado.length}`);
                console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                res.json(resultado);
            })
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro da empresa! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    cadastrarEmpresa
}