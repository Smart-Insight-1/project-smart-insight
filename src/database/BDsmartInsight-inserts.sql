
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
        
INSERT INTO empresa (razao_social, cnpj)
VALUES
('Natura Cosméticos S.A.', '11111111000111'),
('O Boticário Franchising Ltda.', '22222222000122');

INSERT INTO loja (id_empresa, nome_loja,cnpj)
VALUES
(1, 'Natura BH Shopping',12345678910112),
(2, 'O Boticário BH Shopping', 12345678910113);

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





INSERT INTO empresa (razao_social, cnpj) VALUES
('Natura Cosméticos S.A.', '11111111111111'),
('O Boticário Produtos de Beleza Ltda.', '22222222222222'),
('Avon Cosméticos Ltda.', '33333333333333');

INSERT INTO usuario
(id_empresa, nome, email, senha, tipo_usuario)
VALUES
(1, 'Marcos Silva', 'marcos@natura.com', '123456', 'gestor'),
(2, 'Ana Souza', 'ana@boticario.com', '123456', 'gestor'),
(3, 'Carlos Lima', 'carlos@avon.com', '123456', 'gestor');

INSERT INTO loja (id_empresa, nome_loja, cnpj) VALUES
(1, 'Natura Shopping Morumbi', '11111111111112'),
(1, 'Natura Ibirapuera', '11111111111113'),

(2, 'O Boticário Paulista', '22222222222223'),
(2, 'O Boticário Tatuapé', '22222222222224'),

(3, 'Avon Center Norte', '33333333333334'),
(3, 'Avon Anália Franco', '33333333333335');

INSERT INTO endereco
(id_loja, rua, numero, bairro, cidade, uf, cep)
VALUES
(1,'Av. Roque Petroni Jr','1089','Morumbi','São Paulo','SP','04707000'),
(2,'Av. Ibirapuera','3103','Moema','São Paulo','SP','04029020'),

(3,'Av. Paulista','1578','Bela Vista','São Paulo','SP','01310100'),
(4,'Rua Tuiuti','2757','Tatuapé','São Paulo','SP','03307005'),

(5,'Travessa Casalbuono','120','Vila Guilherme','São Paulo','SP','02047050'),
(6,'Av. Regente Feijó','1739','Tatuapé','São Paulo','SP','03342000');


INSERT INTO setor_amostra
(id_loja, nome_setor, descricao)
VALUES
(1,'Perfumaria Masculina','Perfumes masculinos'),
(1,'Perfumaria Feminina','Perfumes femininos'),

(3,'Perfumaria Masculina','Perfumes masculinos'),
(3,'Perfumaria Feminina','Perfumes femininos'),

(5,'Perfumaria Masculina','Perfumes masculinos'),
(5,'Perfumaria Feminina','Perfumes femininos');

INSERT INTO produto
(id_loja, nome, tipo_produto, cod_produto, marca)
VALUES

-- Natura
(1,'Essencial Oud','Perfume','7891000000011','Natura'),
(1,'Kaiak Clássico','Perfume','7891000000012','Natura'),
(1,'Luna Absoluta','Perfume','7891000000013','Natura'),
(1,'Una Artisan','Perfume','7891000000014','Natura'),

-- Boticário
(3,'Malbec Gold','Perfume','7892000000011','O Boticário'),
(3,'Egeo Dolce','Perfume','7892000000012','O Boticário'),
(3,'Floratta Red','Perfume','7892000000013','O Boticário'),
(3,'Coffee Woman Seduction','Perfume','7892000000014','O Boticário'),

-- Avon
(5,'Far Away','Perfume','7893000000011','Avon'),
(5,'Attraction','Perfume','7893000000012','Avon'),
(5,'Segno','Perfume','7893000000013','Avon'),
(5,'Pur Blanca','Perfume','7893000000014','Avon');

INSERT INTO sensor
(id_setor, id_produto, situacao, data_instalacao)
VALUES
(1,1,'Ativo','2026-01-10'),
(1,2,'Ativo','2026-01-10'),
(2,3,'Ativo','2026-01-10'),
(2,4,'Ativo','2026-01-10'),

(3,5,'Ativo','2026-01-10'),
(3,6,'Ativo','2026-01-10'),
(4,7,'Ativo','2026-01-10'),
(4,8,'Ativo','2026-01-10'),

(5,9,'Ativo','2026-01-10'),
(5,10,'Ativo','2026-01-10'),
(6,11,'Ativo','2026-01-10'),
(6,12,'Ativo','2026-01-10');

INSERT INTO interacao (id_sensor, horario, duracao) VALUES

-- 08/05
(1,'2026-05-08 10:15:00',18),
(2,'2026-05-08 11:20:00',22),
(5,'2026-05-08 14:05:00',15),
(9,'2026-05-08 16:40:00',28),

-- 09/05
(1,'2026-05-09 10:12:00',21),
(3,'2026-05-09 12:05:00',25),
(6,'2026-05-09 14:50:00',19),
(10,'2026-05-09 17:10:00',31),

-- 10/05
(2,'2026-05-10 10:40:00',17),
(4,'2026-05-10 13:15:00',24),
(7,'2026-05-10 15:35:00',26),
(11,'2026-05-10 18:05:00',29),

-- 11/05
(1,'2026-05-11 10:20:00',23),
(5,'2026-05-11 12:40:00',18),
(8,'2026-05-11 15:10:00',21),
(12,'2026-05-11 17:50:00',34),

-- 12/05
(2,'2026-05-12 10:10:00',20),
(3,'2026-05-12 11:55:00',27),
(6,'2026-05-12 14:20:00',24),
(10,'2026-05-12 17:00:00',32),

-- 13/05
(1,'2026-05-13 09:50:00',19),
(4,'2026-05-13 12:30:00',22),
(8,'2026-05-13 15:40:00',28),
(11,'2026-05-13 18:10:00',30),

-- 14/05
(2,'2026-05-14 10:30:00',25),
(5,'2026-05-14 13:00:00',20),
(7,'2026-05-14 15:45:00',27),
(12,'2026-05-14 17:55:00',35),

-- 15/05
(1,'2026-05-15 10:05:00',24),
(3,'2026-05-15 12:15:00',29),
(6,'2026-05-15 14:55:00',23),
(9,'2026-05-15 17:20:00',33),

-- 16/05
(2,'2026-05-16 10:25:00',22),
(4,'2026-05-16 12:45:00',26),
(8,'2026-05-16 15:15:00',31),
(10,'2026-05-16 18:00:00',37),

-- 17/05
(1,'2026-05-17 10:15:00',28),
(5,'2026-05-17 12:50:00',24),
(7,'2026-05-17 15:30:00',33),
(11,'2026-05-17 18:15:00',38),

-- 18/05
(1,'2026-05-18 09:55:00',32),
(2,'2026-05-18 10:40:00',29),
(3,'2026-05-18 11:25:00',31),
(4,'2026-05-18 12:10:00',28),
(5,'2026-05-18 13:30:00',34),
(6,'2026-05-18 14:20:00',30),

-- 19/05
(7,'2026-05-19 10:15:00',36),
(8,'2026-05-19 11:40:00',32),
(9,'2026-05-19 13:10:00',35),
(10,'2026-05-19 15:20:00',38),
(11,'2026-05-19 16:45:00',33),
(12,'2026-05-19 18:05:00',41),

-- 20/05
(1,'2026-05-20 10:05:00',34),
(3,'2026-05-20 11:35:00',29),
(5,'2026-05-20 13:50:00',37),
(7,'2026-05-20 15:25:00',35),
(9,'2026-05-20 17:15:00',39),
(11,'2026-05-20 18:20:00',42),

-- 21/05
(2,'2026-05-21 10:10:00',31),
(4,'2026-05-21 12:00:00',33),
(6,'2026-05-21 14:05:00',35),
(8,'2026-05-21 15:50:00',37),
(10,'2026-05-21 17:40:00',41),
(12,'2026-05-21 18:30:00',45);

INSERT INTO interacao (id_sensor, horario, duracao) VALUES

-- 22/05
(1,'2026-05-22 10:15:00',33),
(5,'2026-05-22 11:40:00',28),
(8,'2026-05-22 14:20:00',35),
(10,'2026-05-22 16:10:00',39),
(12,'2026-05-22 18:00:00',42),

-- 23/05
(2,'2026-05-23 10:05:00',31),
(4,'2026-05-23 11:55:00',30),
(7,'2026-05-23 14:35:00',37),
(9,'2026-05-23 16:50:00',41),
(11,'2026-05-23 18:15:00',44),

-- 24/05
(1,'2026-05-24 10:20:00',35),
(3,'2026-05-24 12:00:00',29),
(6,'2026-05-24 14:10:00',38),
(10,'2026-05-24 16:30:00',40),
(12,'2026-05-24 18:25:00',46),

-- 25/05
(2,'2026-05-25 10:10:00',34),
(5,'2026-05-25 12:20:00',32),
(8,'2026-05-25 14:40:00',39),
(9,'2026-05-25 16:15:00',42),
(11,'2026-05-25 18:05:00',45),

-- 26/05
(1,'2026-05-26 10:00:00',36),
(4,'2026-05-26 11:45:00',31),
(7,'2026-05-26 14:25:00',40),
(10,'2026-05-26 16:45:00',43),
(12,'2026-05-26 18:20:00',48),

-- 27/05
(2,'2026-05-27 10:30:00',35),
(3,'2026-05-27 12:05:00',33),
(6,'2026-05-27 14:50:00',41),
(9,'2026-05-27 16:40:00',44),
(11,'2026-05-27 18:10:00',47),

-- 28/05
(1,'2026-05-28 10:25:00',38),
(5,'2026-05-28 12:15:00',35),
(8,'2026-05-28 14:30:00',42),
(10,'2026-05-28 16:20:00',46),
(12,'2026-05-28 18:30:00',50),

-- 29/05
(2,'2026-05-29 10:15:00',37),
(4,'2026-05-29 11:50:00',34),
(7,'2026-05-29 14:20:00',43),
(9,'2026-05-29 16:10:00',45),
(11,'2026-05-29 18:00:00',49),

-- 30/05
(1,'2026-05-30 10:05:00',40),
(3,'2026-05-30 12:10:00',36),
(6,'2026-05-30 14:45:00',44),
(10,'2026-05-30 16:35:00',47),
(12,'2026-05-30 18:25:00',52),

-- 31/05
(2,'2026-05-31 10:20:00',39),
(5,'2026-05-31 12:00:00',37),
(8,'2026-05-31 14:15:00',45),
(9,'2026-05-31 16:25:00',48),
(11,'2026-05-31 18:15:00',51),

-- 01/06
(1,'2026-06-01 10:00:00',42),
(4,'2026-06-01 11:40:00',38),
(7,'2026-06-01 14:35:00',46),
(10,'2026-06-01 16:20:00',50),
(12,'2026-06-01 18:10:00',54),

-- 02/06
(2,'2026-06-02 10:15:00',41),
(3,'2026-06-02 12:05:00',39),
(6,'2026-06-02 14:20:00',47),
(9,'2026-06-02 16:40:00',49),
(11,'2026-06-02 18:00:00',53),

-- 03/06
(1,'2026-06-03 10:10:00',43),
(5,'2026-06-03 11:55:00',40),
(8,'2026-06-03 14:15:00',48),
(10,'2026-06-03 16:30:00',52),
(12,'2026-06-03 18:20:00',56),

-- 04/06
(2,'2026-06-04 10:05:00',44),
(4,'2026-06-04 12:10:00',41),
(7,'2026-06-04 14:45:00',49),
(9,'2026-06-04 16:15:00',53),
(11,'2026-06-04 18:05:00',57),

-- 05/06
(1,'2026-06-05 10:20:00',45),
(3,'2026-06-05 11:50:00',42),
(6,'2026-06-05 14:25:00',50),
(10,'2026-06-05 16:35:00',54),
(12,'2026-06-05 18:25:00',58),

-- 06/06
(2,'2026-06-06 10:15:00',46),
(5,'2026-06-06 12:00:00',43),
(8,'2026-06-06 14:30:00',52),
(9,'2026-06-06 16:20:00',55),
(11,'2026-06-06 18:10:00',59),

-- 07/06
(1,'2026-06-07 10:10:00',48),
(4,'2026-06-07 11:45:00',44),
(7,'2026-06-07 14:15:00',53),
(10,'2026-06-07 16:30:00',57),
(12,'2026-06-07 18:20:00',60);