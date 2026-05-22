var express = require("express");
var router = express.Router();

var lojaController = require("../controllers/lojaController");

router.get("buscarLojaPorUsuario/:usuarioId", function (req, res) {
  lojaController.buscarLojaUsuario(req, res);
});


module.exports = router;