CREATE DATABASE prateleiraInteligente;
USE prateleiraInteligente;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    razao_social VARCHAR(100),
    cnpj CHAR(14) UNIQUE,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    telefone CHAR(11),
    celular CHAR(11),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nome_loja VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_loja INT NOT NULL,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    uf CHAR(2),
    cep CHAR(8),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);

CREATE TABLE area_amostra (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    id_loja INT NOT NULL,
    nome_area VARCHAR(100),
    descricao VARCHAR(200),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_loja INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo_produto VARCHAR(50),
    cod_produto CHAR(13),
    quantidade INT,
    marca VARCHAR(100),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);
CREATE TABLE sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    id_area INT NOT NULL,
    id_produto INT NOT NULL,
	situacao VARCHAR(20) DEFAULT 'Ativo',
    data_instalacao DATE,
    CONSTRAINT chSituacao
        CHECK (situacao IN ('Ativo','Inativo','Manutenção')),
    FOREIGN KEY (id_area) REFERENCES area_amostra(id_area),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE interacao (
    id_interacao INT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT NOT NULL,
    tempo_inicio DATETIME NOT NULL,
    tempo_fim DATETIME,
    FOREIGN KEY (id_sensor) REFERENCES sensor(id_sensor)
);