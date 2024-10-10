DROP DATABASE IF EXISTS db_atividade_view;
CREATE DATABASE db_atividade_view;
use db_atividade_view;
    
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INT
);

CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    data_matricula DATE,
    status VARCHAR(20), -- Ativo, Trancado, Concluído
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    id_disciplina INT,
    semestre VARCHAR(10),
    horario VARCHAR(50),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);
INSERT INTO aluno (nome, data_nascimento, cpf, email, telefone, endereco) VALUES 
 ('Maria Fernanda Mendes', '2006-02-23', '081.576.394-84', 'mda-rocha@correia.com', '(041) 0029-5523', 'Trevo Francisco Dias, 32
Santa Isabel
31949694 da Conceição / RN'), 
 ('Brenda Moura', '2002-03-23', '019.823.456-24', 'jesusvalentina@da.br', '41 3052 5821', 'Rua Ana Julia da Mata
Vila Califórnia
87919-060 Almeida do Oeste / PA'), 
 ('Sr. Luiz Felipe Fogaça', '2005-04-28', '795.046.813-01', 'brunopeixoto@bol.com.br', '31 3889-5510', 'Trecho de Silva, 47
Vila Formosa
64282-097 da Conceição / AC'), 
 ('Sr. Augusto da Conceição', '2004-09-08', '895.014.736-00', 'mariane35@das.br', '0500-182-4118', 'Favela Souza, 1
Pantanal
44485524 Freitas / PI'), 
 ('Ana Beatriz Rocha', '2003-04-05', '024.961.783-87', 'qgomes@yahoo.com.br', '+55 31 6664-6906', 'Pátio de da Rosa, 68
Conjunto Jardim Filadélfia
61744-297 da Mota / ES'), 
 ('Enzo Farias', '2001-10-17', '817.062.539-40', 'da-luzagatha@santos.net', '11 8720-9312', 'Estrada Moura, 68
Dom Silverio
25781301 da Mata / MT'), 
 ('Giovanna Fogaça', '2005-12-26', '750.289.316-40', 'dsilva@hotmail.com', '61 8448 4829', 'Feira Helena Moraes
Vila Madre Gertrudes 4ª Seção
75319-701 Ferreira da Serra / SE'), 
 ('Mariana Ferreira', '2005-08-04', '598.436.120-51', 'baragao@pinto.com', '+55 31 5134 7046', 'Vila de Campos, 6
Caiçara - Adelaide
19017102 das Neves de Minas / AP'), 
 ('Arthur Caldeira', '2000-09-23', '728.915.360-02', 'alana58@sales.br', '51 7944 1087', 'Esplanada de Nascimento, 67
Flamengo
60507467 Nunes Verde / DF'), 
 ('Paulo Fogaça', '2000-01-13', '312.680.749-69', 'joao-gabriel74@hotmail.com', '+55 81 7627 6506', 'Largo Monteiro
Vila Nova Cachoeirinha 3ª Seção
94484263 Souza do Galho / RS'), 
 ('Felipe da Cruz', '2006-04-07', '970.135.264-52', 'caldeiraemanuella@moraes.br', '+55 21 5951 2490', 'Jardim de Cavalcanti, 77
Das Industrias I
82176-394 da Conceição do Amparo / SE'), 
 ('João Lucas Cardoso', '1994-02-14', '374.910.285-60', 'qrezende@hotmail.com', '+55 (061) 0865-1753', 'Lago Ribeiro, 14
Mala E Cuia
41623204 Melo dos Dourados / AM'), 
 ('Dr. Diogo das Neves', '1993-09-28', '780.539.462-83', 'ida-mata@gmail.com', '0300 036 6481', 'Morro Elisa Freitas, 68
Atila De Paiva
33784986 Martins / PE'), 
 ('Sarah Gonçalves', '2000-03-17', '582.401.367-53', 'marcela65@hotmail.com', '(071) 0047 0018', 'Distrito Porto, 68
Prado
13990-564 Alves de Correia / PA'), 
 ('Vitor Fernandes', '2000-10-30', '372.610.859-95', 'heloisa76@hotmail.com', '51 0715 2951', 'Via da Mata, 84
Vila Nova
76925-863 Moraes / AL'), 
 ('Yago Pereira', '1996-06-01', '928.607.345-38', 'pedro-lucas79@ribeiro.br', '(041) 8225-1296', 'Colônia de Santos, 5
Fazendinha
58391-916 da Conceição do Galho / PE'), 
 ('Sra. Gabriela Martins', '1997-04-20', '985.264.703-29', 'omoreira@uol.com.br', '(084) 8825 0641', 'Avenida Fernandes, 56
Alta Tensão 1ª Seção
64467136 Rocha de Martins / RN'), 
 ('Maria Eduarda Moraes', '2002-12-13', '374.056.928-00', 'clara36@gmail.com', '+55 (041) 2070-3297', 'Lagoa Eduarda da Cruz, 921
Vila Petropolis
83563-286 Cardoso / PR'), 
 ('Sr. Bernardo Cavalcanti', '2001-08-09', '123.075.684-17', 'almeidadavi-luiz@cunha.br', '71 8752-7233', 'Via de da Mata, 351
Nossa Senhora Da Aparecida
17978-064 Nogueira / BA'), 
 ('Rebeca Barbosa', '1997-06-27', '415.760.398-20', 'sophiecardoso@bol.com.br', '61 6540-7915', 'Esplanada de Barros, 7
Independência
07265-801 Monteiro / RN'), 
 ('João Miguel Ramos', '1994-02-05', '823.094.175-05', 'unovaes@barbosa.org', '(031) 7729 1808', 'Vale Lucas Monteiro, 65
Penha
60993743 Fernandes / PR'), 
 ('Juan Fernandes', '1994-05-14', '813.625.709-40', 'pedro-henriquefreitas@bol.com.br', '51 0707 9214', 'Vila Enrico Farias, 47
Independência
08008437 Fogaça / PB'), 
 ('Pedro Henrique Castro', '2004-10-17', '328.615.974-37', 'da-cunhadavi@bol.com.br', '41 1353-2946', 'Via Lima, 261
Vila Independencia 2ª Seção
72280803 Novaes / AL'), 
 ('Dra. Yasmin Souza', '1995-11-02', '471.396.028-40', 'carlos-eduardomoura@uol.com.br', '84 2605 4019', 'Passarela de Gomes, 41
Vila São Paulo
38892-893 da Luz / RN'), 
 ('Alana Barros', '2002-08-22', '768.521.940-94', 'oliveiravitor-gabriel@hotmail.com', '+55 (041) 5081-4296', 'Parque Teixeira, 15
Leticia
82392244 Moreira / SC'), 
 ('Manuela Fogaça', '2004-09-24', '164.238.750-90', 'castrobenicio@silveira.com', '71 6241 6687', 'Loteamento Maria Clara Aragão, 15
Caiçara - Adelaide
20540062 da Cunha da Mata / PI'), 
 ('Pedro Henrique Melo', '1997-12-01', '127.945.630-25', 'barrosmaria@lima.net', '81 3984 9067', 'Rua de Nogueira, 506
Floresta
18304335 da Paz do Campo / PA'), 
 ('Lavínia Ferreira', '1997-01-22', '856.430.971-84', 'jesusrafael@mendes.net', '+55 (084) 2140 6294', 'Largo de Porto, 48
Nova Gameleira
78594-510 das Neves do Norte / DF'), 
 ('Levi Barbosa', '2003-05-19', '563.920.418-42', 'mda-cruz@duarte.net', '+55 (021) 9930 0301', 'Rodovia Ferreira, 58
Vila Satélite
16157-935 Moraes de Goiás / SP'), 
 ('Arthur da Costa', '1999-04-20', '367.489.520-00', 'raquel62@silveira.com', '(061) 2014-3936', 'Aeroporto Barros, 6
Vila Da Ária
85232680 Dias do Amparo / PB'), 
 ('Alícia Rezende', '2003-12-24', '309.127.658-95', 'pedro-henriquemoraes@da.br', '+55 (061) 1659 2820', 'Morro de da Luz, 76
Parque São Pedro
65245-863 da Rocha / PA'), 
 ('Gustavo Henrique Castro', '2005-08-07', '583.401.729-05', 'alexandre80@melo.org', '+55 21 1627 6898', 'Viaduto Lorenzo Vieira, 7
Novo Santa Cecilia
83883-305 Pereira / RO'), 
 ('Diogo Santos', '1999-11-13', '463.172.089-13', 'lfreitas@fernandes.com', '+55 (031) 1406-5722', 'Viaduto Cunha, 3
Araguaia
45689-655 Rocha do Campo / RS'), 
 ('Henrique Pires', '2002-08-01', '432.508.769-92', 'ygoncalves@ig.com.br', '41 7772-7961', 'Rua Carolina Gomes, 60
Bela Vitoria
72468410 Nascimento / RN'), 
 ('Vitória Moreira', '1996-11-14', '890.514.623-60', 'ypires@da.net', '11 8379 8435', 'Rua Helena Duarte, 65
Vila Havaí
82795-288 Moraes / PB'), 
 ('Sra. Bárbara da Cunha', '1994-08-01', '153.074.962-06', 'afarias@hotmail.com', '0900 545 3502', 'Rodovia de Lopes, 14
Araguaia
15495284 Farias / DF'), 
 ('Laís Moreira', '1997-02-01', '721.356.094-80', 'bruna00@das.br', '31 1714-4704', 'Viaduto Natália da Rocha, 56
Vila Copacabana
22453642 Fernandes Grande / RN'), 
 ('Isadora Souza', '2003-12-11', '136.028.749-31', 'caldeirarenan@hotmail.com', '84 5007 3914', 'Feira de Almeida, 533
Tiradentes
50784-849 da Luz Paulista / RR'), 
 ('Olivia Pires', '2000-11-21', '258.469.073-00', 'fmonteiro@yahoo.com.br', '(061) 5895 1229', 'Rua Benjamin Teixeira, 75
Alto Barroca
89370104 da Rosa dos Dourados / AM'), 
 ('João Miguel Teixeira', '2002-03-16', '648.573.192-09', 'mariane27@castro.com', '+55 (051) 8316-1282', 'Viaduto Viana, 214
Conjunto Santa Maria
74413-888 Almeida de Porto / SP'), 
 ('Benjamin Aragão', '2000-05-14', '814.073.695-39', 'kaiquenunes@rodrigues.br', '(011) 7736-5083', 'Área de Campos, 596
Vila Da Paz
90487-702 Fernandes do Campo / RJ'), 
 ('Dr. Caio Almeida', '1996-05-04', '654.183.279-09', 'dbarros@uol.com.br', '(081) 8486 7561', 'Travessa de Almeida, 6
Paraíso
07898803 Araújo do Oeste / RR'), 
 ('Ana Vitória da Paz', '1996-10-20', '368.542.791-19', 'teixeiramaria-sophia@mendes.br', '+55 21 7959 9493', 'Estação Cardoso, 472
Vila Das Oliveiras
78512-217 Sales do Campo / CE'), 
 ('João Pedro da Mata', '1999-09-05', '608.417.592-94', 'vda-paz@uol.com.br', '+55 71 6132-1990', 'Lago de Barbosa, 148
Flamengo
94546-477 Rezende / RS'), 
 ('Dr. Marcelo Jesus', '1997-01-25', '869.145.307-93', 'luiz-miguel11@nascimento.com', '0800-419-3925', 'Travessa de Nunes, 3
Vila Nova Gameleira 3ª Seção
87903684 Souza da Prata / BA'), 
 ('Rafael Lima', '2003-10-09', '730.581.642-62', 'raquel09@bol.com.br', '11 9615 3273', 'Favela Gonçalves
São Luiz
53999506 Lopes das Flores / RO'), 
 ('Evelyn Costa', '1999-11-17', '925.648.710-11', 'pvieira@nascimento.com', '21 4612 2654', 'Recanto Moreira, 30
Vila Mangueiras
79445-118 Alves Paulista / AL'), 
 ('Bruno Duarte', '1996-05-19', '509.836.217-21', 'lopesalexandre@hotmail.com', '+55 81 9100 1952', 'Campo Gabriela Azevedo, 54
Jardim Felicidade
61628-001 Pires do Sul / AL'), 
 ('Nicole Martins', '2002-08-19', '681.039.425-70', 'xlima@da.org', '+55 (011) 4025 3521', 'Avenida de Rocha, 858
Vila Esplanada
09158238 Moreira do Campo / RO'), 
 ('Bianca Ramos', '1998-08-18', '190.238.476-87', 'das-nevespedro-lucas@hotmail.com', '(021) 6986 2507', 'Pátio Moraes, 85
Jatobá
14367429 Souza / MS');

INSERT INTO professor (nome, especialidade, email, telefone, endereco) VALUES
('Luiza Pinto', 'Engenheiro de Software', 'prof1@example.com', '11 99999-1111', 'Rua Exemplo, 123'),
('Vinícius Vieira', 'Cientista da Computação', 'prof2@example.com', '21 99999-2222', 'Avenida Exemplo, 456');

INSERT INTO curso (nome, descricao, carga_horaria) VALUES
('Engenharia de Software', 'Curso de Engenharia de Software com ênfase em desenvolvimento de sistemas.', 3600);

INSERT INTO disciplina (nome, descricao, id_curso) VALUES
('Algoritmos e Estruturas de Dados', 'Disciplina básica sobre algoritmos e estruturas de dados.', 1),
('Banco de Dados', 'Disciplina sobre modelagem e implementação de bancos de dados.', 1);

INSERT INTO turma (id_professor, id_disciplina, semestre, horario) VALUES
(1, 1, '2024.1', 'Segunda e Quarta - 08:00 às 10:00'),
(2, 2, '2024.1', 'Terça e Quinta - 10:00 às 12:00');

INSERT INTO matricula (id_aluno, id_disciplina, data_matricula, status) VALUES
(1, 1, '2024-06-29', 'Concluído'),
(1, 2, '2024-06-03', 'Trancado'),
(2, 2, '2024-01-17', 'Concluído'),
(2, 2, '2024-07-22', 'Trancado'),
(3, 1, '2024-03-28', 'Ativo'),
(3, 1, '2024-04-22', 'Ativo'),
(4, 2, '2024-05-20', 'Trancado'),
(4, 1, '2024-07-02', 'Concluído'),
(5, 1, '2024-04-05', 'Ativo'),
(5, 2, '2024-06-10', 'Concluído'),
(6, 2, '2024-04-03', 'Concluído'),
(6, 2, '2024-01-08', 'Trancado'),
(7, 2, '2024-06-09', 'Trancado'),
(7, 1, '2024-05-23', 'Trancado'),
(8, 2, '2024-09-18', 'Ativo'),
(8, 1, '2024-02-22', 'Ativo'),
(9, 2, '2024-04-19', 'Ativo'),
(9, 2, '2024-06-29', 'Ativo'),
(10, 1, '2024-03-22', 'Concluído'),
(10, 1, '2024-02-03', 'Trancado'),
(11, 2, '2024-04-06', 'Concluído'),
(11, 2, '2024-03-01', 'Ativo'),
(12, 1, '2024-07-21', 'Ativo'),
(12, 1, '2024-03-16', 'Concluído'),
(13, 2, '2024-09-18', 'Trancado'),
(13, 2, '2024-01-04', 'Concluído'),
(14, 1, '2024-01-08', 'Concluído'),
(14, 1, '2024-08-13', 'Ativo'),
(15, 2, '2024-04-07', 'Ativo'),
(15, 1, '2024-08-19', 'Trancado'),
(16, 2, '2024-03-21', 'Concluído'),
(16, 1, '2024-03-26', 'Concluído'),
(17, 1, '2024-07-07', 'Trancado'),
(17, 2, '2024-06-22', 'Trancado'),
(18, 1, '2024-03-06', 'Trancado'),
(18, 1, '2024-09-15', 'Ativo'),
(19, 1, '2024-07-26', 'Ativo'),
(19, 1, '2024-04-04', 'Ativo'),
(20, 2, '2024-07-27', 'Trancado'),
(20, 1, '2024-07-01', 'Concluído'),
(21, 1, '2024-03-23', 'Ativo'),
(21, 2, '2024-05-11', 'Trancado'),
(22, 1, '2024-05-03', 'Trancado'),
(22, 2, '2024-02-27', 'Concluído'),
(23, 1, '2024-04-29', 'Trancado'),
(23, 1, '2024-03-04', 'Trancado'),
(24, 1, '2024-01-04', 'Concluído'),
(24, 2, '2024-06-11', 'Concluído'),
(25, 2, '2024-03-15', 'Ativo'),
(25, 1, '2024-08-11', 'Concluído'),
(26, 1, '2024-04-14', 'Trancado'),
(26, 2, '2024-03-22', 'Trancado'),
(27, 2, '2024-05-01', 'Ativo'),
(27, 1, '2024-02-15', 'Concluído'),
(28, 2, '2024-01-28', 'Concluído'),
(28, 2, '2024-05-13', 'Concluído'),
(29, 1, '2024-08-18', 'Trancado'),
(29, 1, '2024-08-11', 'Ativo'),
(30, 2, '2024-07-07', 'Ativo'),
(30, 1, '2024-01-25', 'Ativo'),
(31, 1, '2024-03-25', 'Concluído'),
(31, 2, '2024-02-23', 'Trancado'),
(32, 2, '2024-02-20', 'Ativo'),
(32, 2, '2024-09-18', 'Ativo'),
(33, 2, '2024-04-14', 'Trancado'),
(33, 1, '2024-04-21', 'Ativo'),
(34, 2, '2024-08-09', 'Trancado'),
(34, 1, '2024-03-22', 'Trancado'),
(35, 1, '2024-07-22', 'Ativo'),
(35, 1, '2024-05-05', 'Ativo'),
(36, 2, '2024-02-11', 'Ativo'),
(36, 1, '2024-06-17', 'Trancado'),
(37, 2, '2024-09-16', 'Concluído'),
(37, 2, '2024-04-03', 'Concluído'),
(38, 2, '2024-03-08', 'Concluído'),
(38, 2, '2024-08-02', 'Ativo'),
(39, 2, '2024-05-24', 'Trancado'),
(39, 1, '2024-02-14', 'Concluído'),
(40, 1, '2024-01-03', 'Ativo'),
(40, 1, '2024-08-09', 'Concluído'),
(41, 1, '2024-06-24', 'Ativo'),
(41, 1, '2024-02-01', 'Concluído'),
(42, 2, '2024-06-18', 'Trancado'),
(42, 1, '2024-03-29', 'Ativo'),
(43, 1, '2024-05-21', 'Ativo'),
(43, 1, '2024-02-20', 'Concluído'),
(44, 1, '2024-05-14', 'Trancado'),
(44, 2, '2024-06-23', 'Concluído'),
(45, 1, '2024-05-21', 'Trancado'),
(45, 1, '2024-09-17', 'Concluído'),
(46, 2, '2024-01-25', 'Ativo'),
(46, 2, '2024-08-09', 'Concluído'),
(47, 2, '2024-04-09', 'Trancado'),
(47, 1, '2024-07-30', 'Concluído'),
(48, 1, '2024-08-19', 'Concluído'),
(48, 2, '2024-09-18', 'Trancado'),
(49, 1, '2024-07-31', 'Concluído'),
(49, 2, '2024-05-28', 'Trancado'),
(50, 2, '2024-08-22', 'Concluído'),
(50, 1, '2024-01-05', 'Trancado');