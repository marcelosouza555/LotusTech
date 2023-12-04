var dashboardModel = require("../models/dashboardModel");

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo dashboard.html
    var emocional = req.body.emocionalServer;


    // Faça as validações dos valores
    if (emocional == undefined) {
        res.status(400).send("emoção está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        dashboardModel.cadastrar(emocional)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro no cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar
}