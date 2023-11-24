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

CREATE TABLE Endereço (
	idEndereço INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
	complemento VARCHAR(50),
	numero int,
    CONSTRAINT fkUsuario FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario)
)auto_increment= 100;

CREATE TABLE Rastreamento(
	idRastreamento INT PRIMARY KEY AUTO_INCREMENT,
	dtHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	estadoEmocional INT,
	nivelEstresse INT,
    progresso INT,
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
)auto_increment= 200;

create table Gamificacao (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	idGamificacao INT PRIMARY KEY AUTO_INCREMENT,
	pontos INT,
	nivel INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
)auto_increment= 300;

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table infoMeditacao (
	idInfo INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR (100),
	descricao VARCHAR(300),
	beneficios VARCHAR(200),
	tecnicas VARCHAR(200),
    fkUsuario INT,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
)auto_increment= 400;

insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);