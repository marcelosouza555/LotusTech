var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.post("/dashboard", function (req, res) {
    dashboardController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    dashboardController.autenticar(req, res);
});

module.exports = router;