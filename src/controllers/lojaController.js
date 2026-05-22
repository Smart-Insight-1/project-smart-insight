var lojaModel = require("../models/lojaModel");

function buscarLojaUsuario(req, res) {
  var idUsuario = req.params.id;

  lojaModel.buscarLojaUsuario(idUsuario).then((resultadoBuscarLojaUsuario) => {
    if (resultadoBuscarLojaUsuario.length > 0) {
      res.status(200).json(resultadoBuscarLojaUsuario);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as lojas: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}