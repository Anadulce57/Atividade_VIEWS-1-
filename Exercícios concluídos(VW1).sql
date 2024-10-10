use db_atividade_view;
/*
1. Exibir lista de alunos e seus cursos
Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.
*/
CREATE OR REPLACE VIEW VW_ALUNOS_DISCIPLINAS AS
SELECT aluno.nome nume_aluno, disciplina.nome nome_disciplina, curso.nome nome_curso
FROM aluno
INNER JOIN matricula ON matricula.id_aluno = aluno.id_aluno
INNER JOIN disciplina ON disciplina.id_disciplina = matricula.id_disciplina 
INNER JOIN curso ON curso.id_curso = disciplina.id_curso;

SELECT* FROM VW_ALUNOS_DISCIPLINAS;
/*
2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.
*/
CREATE VIEW VW_disciplinas_alunos_matriculados AS
SELECT d.nome AS nome_disciplina, COUNT(m.id_aluno) AS total_alunos  -- Conta o número de alunos matriculados na disciplina
FROM disciplina d                       
JOIN matricula m ON d.id_disciplina = m.id_disciplina  
GROUP BY d.id_disciplina;                  


SELECT* FROM VW_nome_quant;
/*
3. Exibir alunos e status das suas matrículas
Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).
*/
CREATE OR REPLACE VIEW VWadm AS
SELECT aluno.nome nome_aluno , matricula.status status_matricula , disciplina.nome nome_disciplina
FROM aluno
INNER JOIN matricula ON  matricula.id_aluno  = aluno.id_aluno
INNER JOIN disciplina ON disciplina.id_disciplina = matricula.id_disciplina;

SELECT* FROM VWadm;
/*
4. Exibir professores e suas turmas
Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.
*/
CREATE OR REPLACE VIEW 	VWpdt AS
SELECT professor.nome nome_professor, turma.horario horario_turma, disciplina.nome nome_disciplina 
FROM professor
JOIN turma ON turma.id_professor  = professor.id_professor 
JOIN disciplina ON disciplina.id_disciplina = turma.id_disciplina;

SELECT* FROM VWpdt;
/*
5. Exibir alunos maiores de 20 anos
Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.
*/
CREATE OR REPLACE VIEW VW_NOME_IDADE AS 
SELECT nome, data_nascimento 
FROM aluno 
WHERE data_nascimento <= 2004;

SELECT* FROM VW_NOME_IDADE;
/*
6. Exibir disciplinas e carga horária total por curso
Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.
*/
CREATE OR REPLACE VIEW VW_CURSO_DISC AS 
SELECT cursos.nome, curso.carga_horaria, id_disciplina 
FROM curso
JOIN disciplina ON disciplina.id_curso = curso.id_curso; 

SELECT* FROM VW_CURSO_DISC;
/*
7. Exibir professores e suas especialidades
Crie uma view que exiba o nome dos professores e suas especialidades.
*/
CREATE OR REPLACE VIEW VW_PROFESSOR_ESPCLD AS 
SELECT nome, especialidade
FROM professor;

SELECT* FROM VW_PROFESSOR_ESPCLD;
/*
8. Exibir alunos matriculados em mais de uma disciplina
Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.
*/
CREATE VIEW VW_alunos_multidisciplina AS
SELECT a.nome AS nome_aluno, COUNT(m.id_disciplina) AS total_disciplinas -- Conta as disciplinas nas quais o aluno está matriculado
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.id_aluno
HAVING COUNT(m.id_disciplina) > 1;

SELECT* FROM VW_alunos_multidisciplina;

/*
9. Exibir alunos e o número de disciplinas que concluíram. Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.
*/
CREATE VIEW VW_alunos_concluinte AS
SELECT a.nome AS nome_aluno, COUNT(m.id_disciplina) AS disciplinas_concluidas
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Concluído'
GROUP BY a.id_aluno;

SELECT* FROM VW_alunos_concluinte;

/*
10. Exibir todas as turmas de um semestre específico
Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).
*/
-- OBS ao professor: Não consegui realizar essa questão, fiz algumas pesquisas mas não pude resolver essa questão 
/*
11. Exibir alunos com matrículas trancadas
Crie uma view que exiba o nome dos alunos que têm matrículas no status "Trancado".
*/
CREATE VIEW alunos_trancados AS
SELECT a.nome AS nome_aluno
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Trancado';

SELECT* FROM alunos_trancados;
/*
12. Exibir disciplinas que não têm alunos matriculados
Crie uma view que exiba as disciplinas que não possuem alunos matriculados.
*/
CREATE OR REPLACE VIEW VW_disciplina_matricula AS 
SELECT d.nome AS nome_disciplina 
FROM disciplina d
LEFT JOIN matricula m ON m.id_disciplina = d.id_disciplina
WHERE m.id_matricula IS NULL;

SELECT* FROM VW_disciplina_matricula; 
/*
13. Exibir a quantidade de alunos por status de matrícula
Crie uma view que exiba a quantidade de alunos para cada status de matrícula (Ativo, Concluído, Trancado).
*/
CREATE VIEW VW_alunos_status AS
SELECT m.status AS status_matricula, COUNT(m.id_aluno) AS quantidade_aluno
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.id_aluno;

SELECT* FROM VW_alunos_status; 
/*
14. Exibir o total de professores por especialidade
Crie uma view que exiba a quantidade de professores por especialidade (ex.: Engenharia de Software, Ciência da Computação).
*/
CREATE VIEW VW_alunos_multidisciplina AS
SELECT p.especialidade AS especialidade_professor , COUNT(p.id_professor) AS quantidade_professor 
FROM professor p
GROUP BY p.id_professor;

SELECT* FROM VW_alunos_multidisciplina;
/*
15. Exibir lista de alunos e suas idades
Crie uma view que exiba o nome dos alunos e suas idades com base na data de nascimento.
*/
CREATE VIEW VW_alunos_idades AS
SELECT nome, YEAR(CURDATE()) - YEAR(data_nascimento) AS idade  -- Calcular a idade com base no ano atual e no ano de nascimento - atributo pesquisado pelo 	W3Schools 
FROM aluno;

SELECT* FROM VW_alunos_idade;
/*
16. Exibir alunos e suas últimas matrículas
Crie uma view que exiba o nome dos alunos e a data de suas últimas matrículas.
*/
CREATE VIEW VW_alunos_ultimas_matriculas AS
SELECT a.nome, MAX(m.data_matricula) AS ultima_matricula  -- Selecionar a última data de matrícula com a data máxima 
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno 
GROUP BY a.id_aluno;

SELECT* FROM VW_alunos_ultimas_matriculas;
/*
17. Exibir todas as disciplinas de um curso específico
Crie uma view que exiba todas as disciplinas pertencentes a um curso específico, como "Engenharia de Software".
*/
CREATE VIEW VW_disciplinas_por_curso AS
SELECT d.nome AS nome_disciplina, c.nome AS nome_curso
FROM disciplina d
JOIN curso c ON d.id_curso = c.id_curso  
WHERE c.nome = 'Engenharia de Software';  -- Obs: Consegui fazer com um nome específico ao curso

SELECT* FROM VW_disciplinas_por_curso;
/*
18. Exibir os professores que não têm turmas
Crie uma view que exiba os professores que não estão lecionando em nenhuma turma.
*/
CREATE VIEW VW_professores_sem_turmas AS
SELECT p.nome AS nome_professor
FROM professor p
LEFT JOIN turma t ON p.id_professor = t.id_professor
WHERE t.id_turma IS NULL;

SELECT* FROM VW_professores_sem_turmas;
/*
19. Exibir lista de alunos com CPF e email
Crie uma view que exiba o nome dos alunos, CPF e email.
*/
CREATE OR REPLACE VIEW VW_aluno_CPFeemail AS 
SELECT nome, CPF, email
FROM aluno;

SELECT* FROM VW_aluno_CPFeemail;
/*
20. Exibir o total de disciplinas por professor
Crie uma view que exiba o nome dos professores e o número de disciplinas que cada um leciona.
*/
CREATE VIEW VW_total_disciplinas_professor AS
SELECT p.nome AS nome_professor, COUNT(t.id_disciplina) AS total_disciplinas  -- Contar as disciplinas que o professor leciona
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor  
GROUP BY p.id_professor;  -- Agrupar por professor para contar as disciplinas

SELECT* FROM VW_total_disciplinas_professor;
