var setoresModel = require("../models/setoresModel");

function listarContato(req, res) {
    var id_contato = req.params.idContato;

    contatoModel.listarContato(telefone)
        .then(
            function (resultadoContato) {
                console.log(`\nResultados encontrados: ${resultadoContato.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoContato)}`); // transforma JSON em String

                res.json(resultadoContato);
            })
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function deletarContato(req, res) {
    var id_contato = req.params.idContato;
    var telefone = req.body.telefone;

    contatoModel.deletarContato(id_contato, telefone)
        .then(
            function (resultadoContato) {
                console.log(`\nResultados encontrados: ${resultadoContato.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoContato)}`); // transforma JSON em String

                res.json(resultadoContato);
            })
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function inserirContato(req, res) {
    var id_contato = req.params.idContato;
    var telefone = req.body.telefone;

    contatoModel.inserirContato(id_contato, telefone)
        .then(
            function (resultadoContato) {
                console.log(`\nResultados encontrados: ${resultadoContato.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoContato)}`); // transforma JSON em String

                res.json(resultadoContato);
            })
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    listarContato,
    deletarContato,
    inserirContato
}