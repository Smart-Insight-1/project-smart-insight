CREATE DATABASE prateleiraInteligente;
USE prateleiraInteligente;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    razao_social VARCHAR(100),
    cnpj CHAR(14) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    telefone CHAR(11),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    codigo_loja VARCHAR(20) UNIQUE,
    nome_loja VARCHAR(100) NOT NULL,
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

CREATE TABLE setor_amostra (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    id_loja INT NOT NULL,
    nome_setor VARCHAR(100),
    descricao VARCHAR(200),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_loja INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo_produto VARCHAR(50),
    cod_produto CHAR(13),
    marca VARCHAR(100),
    FOREIGN KEY (id_loja) REFERENCES loja(id_loja)
);
CREATE TABLE sensor (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    id_setor INT NOT NULL,
    id_produto INT NOT NULL,
	situacao VARCHAR(20) DEFAULT 'Ativo',
    data_instalacao DATE,
    CONSTRAINT chSituacao
        CHECK (situacao IN ('Ativo','Inativo','Manutenção')),
    FOREIGN KEY (id_setor) REFERENCES setor_amostra(id_setor),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE interacao (
    id_interacao INT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT NOT NULL,
    horario DATETIME,
    duracao FLOAT,
    FOREIGN KEY (id_sensor) REFERENCES sensor(id_sensor)
);

INSERT INTO usuario (nome, razao_social, cnpj, email, senha)
VALUES
('Administrador', 'Grupo Boticário LTDA', '12345678000101', 'admin@boticario.com', '123456'),
('Administrador', 'Natura Cosméticos SA', '98765432000199', 'admin@natura.com', '123456');

INSERT INTO loja (id_usuario, codigo_loja, nome_loja)
VALUES
(1, 'BOT-SP-001', 'O Boticário - Shopping Paulista'),
(1, 'BOT-SP-002', 'O Boticário - Shopping Ibirapuera'),
(2, 'NAT-SP-001', 'Natura - Shopping Morumbi');

INSERT INTO endereco (id_loja, rua, numero, bairro, cidade, uf, cep)
VALUES
(1,'Av Paulista','1578','Bela Vista','São Paulo','SP','01310200'),
(2,'Av Ibirapuera','3103','Moema','São Paulo','SP','04029200'),
(3,'Av Roque Petroni','1089','Morumbi','São Paulo','SP','04707000');

INSERT INTO setor_amostra (id_loja, nome_setor, descricao)
VALUES
(1,'Perfumes Masculinos','Linha masculina'),
(1,'Perfumes Femininos','Linha feminina'),
(2,'Perfumes Masculinos','Linha masculina'),
(2,'Lançamentos','Produtos novos'),
(3,'Perfumes Femininos','Linha feminina');

INSERT INTO produto (id_loja,nome,tipo_produto,cod_produto,marca)
VALUES
(1,'Malbec','Perfume Masculino','7891111111111','O Boticário'),
(1,'Zaad','Perfume Masculino','7891111111112','O Boticário'),
(1,'Lily','Perfume Feminino','7891111111113','O Boticário'),

(2,'Malbec','Perfume Masculino','7891111111111','O Boticário'),
(2,'Egeo Dolce','Perfume Feminino','7891111111114','O Boticário'),

(3,'Essencial','Perfume Masculino','7892222222221','Natura'),
(3,'Kaiak','Perfume Masculino','7892222222222','Natura');

SELECT * FROM sensor;

INSERT INTO sensor (id_setor,id_produto,data_instalacao)
VALUES
(1,1,'2026-03-01');

SELECT * FROM interacao;

INSERT INTO interacao (id_sensor, horario, duracao)
VALUES
(1, '2026-04-20 10:05:12', 3.5),
(1, '2026-04-20 10:17:48', 5.2),
(1, '2026-04-20 10:32:10', 2.1),
(1, '2026-04-20 11:03:27', 6.8),
(1, '2026-04-20 11:25:09', 4.0),
(1, '2026-04-20 12:10:44', 7.3),
(1, '2026-04-20 13:55:18', 1.9),
(1, '2026-04-20 14:22:36', 3.7),
(1, '2026-04-20 15:40:02', 8.5),
(1, '2026-04-20 16:05:50', 2.6);