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
    celular CHAR(11),
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
    tempo_inicio DATETIME NOT NULL,
    tempo_fim DATETIME,
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

INSERT INTO sensor (id_setor,id_produto,data_instalacao)
VALUES
(1,1,'2026-03-01'),
(1,2,'2026-03-01'),
(2,3,'2026-03-01'),

(3,4,'2026-03-01'),
(4,5,'2026-03-01'),

(5,6,'2026-03-01'),
(5,7,'2026-03-01');

INSERT INTO interacao (id_sensor,tempo_inicio,tempo_fim)
VALUES
(1,'2026-03-30 14:02:10','2026-03-30 14:02:18'),
(1,'2026-03-30 14:05:20','2026-03-30 14:05:27'),
(2,'2026-03-30 14:10:10','2026-03-30 14:10:20'),
(3,'2026-03-30 14:12:30','2026-03-30 14:12:42'),

(4,'2026-03-30 15:02:10','2026-03-30 15:02:22'),
(4,'2026-03-30 15:05:20','2026-03-30 15:05:35'),
(5,'2026-03-30 15:07:30','2026-03-30 15:07:40'),

(6,'2026-03-30 16:10:15','2026-03-30 16:10:28'),
(7,'2026-03-30 16:12:00','2026-03-30 16:12:10'),

(1,'2026-03-30 16:20:10','2026-03-30 16:20:18'),
(2,'2026-03-30 16:21:05','2026-03-30 16:21:14'),
(3,'2026-03-30 16:22:30','2026-03-30 16:22:40'),
(1,'2026-03-30 16:23:12','2026-03-30 16:23:21'),
(2,'2026-03-30 16:24:45','2026-03-30 16:24:55'),

(4,'2026-03-30 16:25:10','2026-03-30 16:25:22'),
(5,'2026-03-30 16:26:18','2026-03-30 16:26:29'),
(4,'2026-03-30 16:27:05','2026-03-30 16:27:17'),
(5,'2026-03-30 16:28:44','2026-03-30 16:28:53'),
(4,'2026-03-30 16:29:30','2026-03-30 16:29:40'),

(6,'2026-03-30 16:30:15','2026-03-30 16:30:25'),
(7,'2026-03-30 16:31:10','2026-03-30 16:31:20'),
(6,'2026-03-30 16:32:05','2026-03-30 16:32:16'),
(7,'2026-03-30 16:33:30','2026-03-30 16:33:42'),
(6,'2026-03-30 16:34:12','2026-03-30 16:34:23'),

(1,'2026-03-30 17:01:15','2026-03-30 17:01:24'),
(2,'2026-03-30 17:02:10','2026-03-30 17:02:20'),
(3,'2026-03-30 17:03:40','2026-03-30 17:03:50'),
(1,'2026-03-30 17:04:30','2026-03-30 17:04:39'),
(2,'2026-03-30 17:05:18','2026-03-30 17:05:30'),

(4,'2026-03-30 17:06:45','2026-03-30 17:06:56'),
(5,'2026-03-30 17:07:25','2026-03-30 17:07:36'),
(4,'2026-03-30 17:08:12','2026-03-30 17:08:22'),
(5,'2026-03-30 17:09:03','2026-03-30 17:09:15'),

(6,'2026-03-30 17:10:11','2026-03-30 17:10:23'),
(7,'2026-03-30 17:11:40','2026-03-30 17:11:52'),
(6,'2026-03-30 17:12:05','2026-03-30 17:12:16'),
(7,'2026-03-30 17:13:30','2026-03-30 17:13:42'),
(6,'2026-03-30 17:14:50','2026-03-30 17:15:01'),
(7,'2026-03-30 17:15:25','2026-03-30 17:15:36');


-- SELECT COMPLETO 
SELECT 
l.id_loja,
l.nome_loja,
sa.nome_setor,
p.nome AS produto,
p.marca,
s.id_sensor,
i.id_interacao,
i.tempo_inicio,
i.tempo_fim,
TIMESTAMPDIFF(SECOND, i.tempo_inicio, i.tempo_fim) AS tempo_interacao_segundos
FROM interacao i
JOIN sensor s 
ON i.id_sensor = s.id_sensor
JOIN produto p 
ON s.id_produto = p.id_produto
JOIN setor_amostra sa 
ON s.id_setor = sa.id_setor
JOIN loja l 
ON sa.id_loja = l.id_loja
ORDER BY i.tempo_inicio;

-- Interações por Produto
SELECT 
p.nome AS produto,
COUNT(i.id_interacao) AS total_interacoes
FROM interacao i
JOIN sensor s ON i.id_sensor = s.id_sensor
JOIN produto p ON s.id_produto = p.id_produto
WHERE p.id_loja = 1
GROUP BY p.nome
ORDER BY total_interacoes DESC;

-- Setores e suas Interações
SELECT 
sa.nome_setor,
COUNT(i.id_interacao) AS total_interacoes
FROM interacao i
JOIN sensor s ON i.id_sensor = s.id_sensor
JOIN setor_amostra sa ON s.id_setor = sa.id_setor
WHERE sa.id_loja = 1
GROUP BY sa.nome_setor
ORDER BY total_interacoes DESC;

-- Interações por Hora
SELECT 
HOUR(i.tempo_inicio) AS hora,
COUNT(i.id_interacao) AS total_interacoes
FROM interacao i
JOIN sensor s ON i.id_sensor = s.id_sensor
JOIN produto p ON s.id_produto = p.id_produto
WHERE p.id_loja = 1
GROUP BY hora
ORDER BY hora;

-- Tempo Médio de Retenção por Produto
SELECT 
p.nome AS produto,
AVG(TIMESTAMPDIFF(SECOND,i.tempo_inicio,i.tempo_fim)) AS tempo_medio_segundos
FROM interacao i
JOIN sensor s ON i.id_sensor = s.id_sensor
JOIN produto p ON s.id_produto = p.id_produto
WHERE p.id_loja = 1
GROUP BY p.nome
ORDER BY tempo_medio_segundos DESC;