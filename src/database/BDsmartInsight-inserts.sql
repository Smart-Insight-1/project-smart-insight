CREATE DATABASE prateleiraInteligente;
USE prateleiraInteligente;

CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chTipoUsuario
        CHECK(tipo_usuario IN ('gestor','analista')),
    FOREIGN KEY (id_empresa)
        REFERENCES empresa(id_empresa)
);

CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    telefone CHAR(11),
    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);

CREATE TABLE loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nome_loja VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (id_empresa)
        REFERENCES empresa(id_empresa)
);

CREATE TABLE acesso_loja (
    id_loja INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(id_loja, id_usuario),
    FOREIGN KEY (id_loja)
        REFERENCES loja(id_loja),
    FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
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



-- EMPRESA
INSERT INTO empresa (razao_social, cnpj)
VALUES ('Smart Insight Tecnologia Ltda', '12345678000199');

-- USUÁRIO
INSERT INTO usuario (
    id_empresa,
    nome,
    email,
    senha,
    tipo_usuario
)
VALUES (
    1,
    'Marcel Suriani',
    'usuariousuariomarcel@smartinsight.com',
    '12345678',
    'gestor'
);

-- CONTATO
INSERT INTO contato (id_usuario, telefone)
VALUES (1, '11999999999');

-- LOJA
INSERT INTO loja (id_empresa, nome_loja, cnpj)
VALUES (1, 'Loja Shopping Paulista', '12345678901234');

-- ACESSO LOJA
INSERT INTO acesso_loja (id_loja, id_usuario)
VALUES (1, 1);

-- ENDEREÇO
INSERT INTO endereco (
    id_loja,
    rua,
    numero,
    bairro,
    cidade,
    uf,
    cep
)
VALUES (
    1,
    'Av. Paulista',
    '1000',
    'Bela Vista',
    'São Paulo',
    'SP',
    '01310000'
);

-- SETOR
INSERT INTO setor_amostra (
    id_loja,
    nome_setor,
    descricao
)
VALUES (
    1,
    'Perfumaria',
    'Área de testers de perfumes'
);

-- PRODUTO
INSERT INTO produto (
    id_loja,
    nome,
    tipo_produto,
    cod_produto,
    marca
)
VALUES (
    1,
    'Perfume Tester Elegance',
    'Perfume',
    '7891234567890',
    'BeautyLux'
);

-- SENSOR
INSERT INTO sensor (
    id_setor,
    id_produto,
    situacao,
    data_instalacao
)
VALUES (
    1,
    1,
    'Ativo',
    CURDATE()
);

-- INTERAÇÕES
INSERT INTO interacao (
    id_sensor,
    horario,
    duracao
)
VALUES
(1, NOW() - INTERVAL 30 MINUTE, 12.5),
(1, NOW() - INTERVAL 25 MINUTE, 8.7),
(1, NOW() - INTERVAL 20 MINUTE, 15.2),
(1, NOW() - INTERVAL 15 MINUTE, 9.4),
(1, NOW() - INTERVAL 10 MINUTE, 21.8),
(1, NOW() - INTERVAL 5 MINUTE, 18.3),
(1, NOW(), 11.6);

CREATE VIEW vw_kpi AS
SELECT
    interacao.id_interacao,
    interacao.horario,
    interacao.duracao,

    sensor.id_sensor,

    produto.id_produto,
    produto.nome AS produto,
    produto.id_loja,

    setor_amostra.id_setor,
    setor_amostra.nome_setor AS setor
FROM interacao 
JOIN sensor ON interacao.id_sensor = sensor.id_sensor
JOIN produto ON sensor.id_produto = produto.id_produto
JOIN setor_amostra ON sensor.id_setor = setor_amostra.id_setor;



CREATE VIEW vw_graficos AS
SELECT
    interacao.id_interacao,
    interacao.horario,
    interacao.duracao,

    produto.id_loja,
    produto.nome AS produto,

    setor_amostra.nome_setor AS setor

FROM interacao 
JOIN sensor 
    ON interacao.id_sensor = sensor.id_sensor
JOIN produto 
    ON sensor.id_produto = produto.id_produto
JOIN setor_amostra 
    ON sensor.id_setor = setor_amostra.id_setor;

    

CREATE VIEW informacoes_empresa_loja AS
	SELECT l.id_loja AS id_loja, emp.razao_social, emp.cnpj AS cnpj_empresa, l.nome_loja, l.cnpj AS cnpj_loja, CONCAT(en.rua, ', ', en.numero, ' - ', en.bairro, ' - ', en.cidade, ' (',en.uf,') - ', en.cep) AS 'endereco_loja' FROM empresa emp
		JOIN loja l ON l.id_empresa = emp.id_empresa
		JOIN endereco en ON en.id_loja = l.id_loja;
        
INSERT INTO empresa (razao_social, cnpj)
VALUES
('Natura Cosméticos S.A.', '11111111000111'),
('O Boticário Franchising Ltda.', '22222222000122');

INSERT INTO loja (id_empresa, nome_loja)
VALUES
(1, 'Natura BH Shopping'),
(2, 'O Boticário BH Shopping');

INSERT INTO setor_amostra (id_loja, nome_setor, descricao)
VALUES
(1, 'Perfumaria Natura', 'Área de perfumes testers Natura'),
(2, 'Perfumaria Boticário', 'Área de perfumes testers Boticário');

INSERT INTO produto (id_loja, nome, tipo_produto, cod_produto, marca)
VALUES
(1, 'Kaiak Clássico', 'Perfume', '7891000000001', 'Natura'),
(1, 'Essencial Masculino', 'Perfume', '7891000000002', 'Natura'),

(2, 'Malbec Tradicional', 'Perfume', '7892000000001', 'O Boticário'),
(2, 'Coffee Man Sense', 'Perfume', '7892000000002', 'O Boticário');

INSERT INTO sensor (id_setor, id_produto, situacao, data_instalacao)
VALUES
(1, 1, 'Ativo', '2026-01-15'), -- Kaiak
(1, 2, 'Ativo', '2026-01-15'), -- Essencial

(2, 3, 'Ativo', '2026-01-15'), -- Malbec
(2, 4, 'Ativo', '2026-01-15'); -- Coffee Man

-- Período atual (01/06 a 07/06/2026)
INSERT INTO interacao (id_sensor, horario, duracao) VALUES

-- Kaiak
(1, '2026-06-01 10:00:00', 180),
(1, '2026-06-02 11:15:00', 170),

-- Essencial
(2, '2026-06-03 14:20:00', 160),
(2, '2026-06-04 10:45:00', 150),

-- Malbec
(3, '2026-06-05 13:10:00', 220),
(3, '2026-06-06 15:00:00', 210),

-- Coffee
(4, '2026-06-07 16:00:00', 140),

-- Período anterior (24/05 a 31/05/2026)

-- Kaiak
(1, '2026-05-24 10:00:00', 150),
(1, '2026-05-25 11:00:00', 140),

-- Essencial
(2, '2026-05-26 14:00:00', 130),
(2, '2026-05-27 10:30:00', 120),

-- Malbec
(3, '2026-05-28 12:00:00', 180),
(3, '2026-05-29 13:00:00', 170),

-- Coffee
(4, '2026-05-30 15:00:00', 100),
(4, '2026-05-31 16:30:00', 90);
