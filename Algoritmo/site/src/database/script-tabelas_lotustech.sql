-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE lotustech;

USE lotustech;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50)NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	senha VARCHAR(50) NOT NULL,
    dtCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Feedback (
	idFeedback INT auto_increment,
    titulo VARCHAR(45),
	descricao VARCHAR(300),
    fkUsuario INT,
    CONSTRAINT fkUsuario FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),
	primary key(idFeedback, fkUsuario)
)auto_increment= 100;

CREATE TABLE Rastreamento(
	idRastreamento INT PRIMARY KEY AUTO_INCREMENT,
	dtHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	estadoEmocional INT,
	nivelEstresse INT,
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
)auto_increment= 200;

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

SELECT * FROM usuario;
SELECT * FROM rastreamento;

DELETE FROM usuario WHERE idUsuario= 36;


