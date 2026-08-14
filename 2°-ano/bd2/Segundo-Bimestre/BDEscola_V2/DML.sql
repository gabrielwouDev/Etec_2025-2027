INSERT INTO tbAluno (nomeAluno,dataNascimento,rgAluno,naturalidadeAluno)
VALUES
('Paulo Santos','2000-10-03 00:00:00','82.292.122-0','SP'),
('Maria da Gloria','1999-03-10 00:00:00','45.233.123-0','SP'),
('Perla Nogueira Silva','1998-04-04 00:00:00','23.533.211-9','SP'),
('Gilson Barros Silva','1995-09-09 00:00:00','34.221.111-x','PE'),
('Mariana Barbosa Santos','2001-10-10 00:00:00','54.222.122-9','RJ');


INSERT INTO tbCurso (nomeCurso,cargahorariaCurso,valorCurso)
VALUES

('Russo',5000,780.00),
('Japonês',6000,1000.00),
('libras',1000,56.00),
('inglês',2000,656.00),
('Alemão',3000,578.00);

select*from tbCurso

INSERT INTO tbTurma (nomeTurma,idCurso,horarioTurma)
VALUES
('1IA',1,'1900-01-01 12:00:00'),
('1IB',1,'1900-01-01 18:00:00'),
('1AA',2,'1900-01-01 19:00:00');


