
CREATE DATABASE smart_insight;

USE smart_insight;

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
        



