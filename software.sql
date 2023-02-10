-------------------------- Criação ------------------------------

-- Criação da tabela leitor
CREATE TABLE Leitor (cpf VARCHAR(11), nome VARCHAR(20),
telefone VARCHAR(14), endereco VARCHAR(20),
PRIMARY KEY(CPF));

-- Criação da tabela Livro
CREATE TABLE Livro (titulo VARCHAR(30), autor VARCHAR(20),
genero VARCHAR(30), quantidade INT, editora VARCHAR(20),
dataLancamento DATE,
PRIMARY KEY (titulo));

-- Criação da tabela LivroAlugado
CREATE TABLE LivroAlugado (cpfLeitor VARCHAR(11), tituloLivro VARCHAR(30), prazoEntrega DATETIME,
FOREIGN KEY (CPFLeitor) REFERENCES Leitor(cpf) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (tituloLivro) REFERENCES Livro(titulo) ON DELETE CASCADE ON UPDATE CASCADE);

-------------------------- Trigger ---------------------------

-- Trigger que define o prazoEntrega na tabela Leitor sempre que houver uma inserção na tabela LivroAlugado
DELIMITER $

CREATE TRIGGER trPrazoEntrega
BEFORE INSERT ON LivroAlugado
FOR EACH ROW
BEGIN
    SET NEW.prazoEntrega = DATE_ADD(NOW(), INTERVAL 15 DAY);
END$

-------------------------- Inserção ------------------------------

-- Inserção de dados na tabela Leitor
INSERT INTO Leitor (cpf, nome, telefone, endereco)
VALUES ('12345678901', 'Carlos Lopes', '11 99999-9999', 'Rua A, 123');

INSERT INTO Leitor (cpf, nome, telefone, endereco)
VALUES ('10987654321', 'Karollis', '11 88888-8888', 'Rua B, 456');

-- Inserção de dados na tabela Livro
INSERT INTO Livro (titulo, autor, genero, quantidade, editora, dataLancamento)
VALUES ('O Pequeno Príncipe', 'Antoine', 'Literatura Infantil', 10, 'Editora X', '1943-04-06');

INSERT INTO Livro (titulo, autor, genero, quantidade, editora, dataLancamento)
VALUES ('O Morro dos Ventos Uivantes', 'Emily Bronte', 'Romance', 5, 'Editora Y', '1847-12-18');

-- Inserção de dados na tabela LivroAlugado
INSERT INTO LivroAlugado (cpfLeitor, tituloLivro)
VALUES ('12345678901', 'O Pequeno Príncipe');

INSERT INTO LivroAlugado (cpfLeitor, tituloLivro)
VALUES ('10987654321', 'O Morro dos Ventos Uivantes');

-------------------------- Remoção ------------------------------

-- Removendo da tabela leitor pelo identificador cpf
DELETE FROM Leitor WHERE CPF = 'Mycpf' IF EXISTS;

-- Removendo da tabela livro pelo identificador Livro
DELETE FROM Livro WHERE titulo = 'mytitle' IF EXISTS;

-- Removendo da tabela LivroAlugado
DELETE FROM LivroAlugado WHERE cpf = 'Mycpf' IF EXISTS;

-------------------------- Atualização ---------------------------

-- Atualização de dados na tabela Leitor
UPDATE Leitor SET nome = 'Novo Nome', telefone = 'Novo Telefone', endereco = 'Novo Endereco' WHERE cpf = '12345678901';

-- Atualização de dados na tabela Livro
UPDATE Livro SET autor = 'Novo Autor', genero = 'Novo Gênero', quantidade = 5, editora = 'Nova Editora', dataLancamento = '2023-01-01' WHERE titulo = 'Livro 1';

-- Atualização de dados na tabela LivroAlugados
UPDATE LivroAlugados SET cpfLeitor = '10987654321' WHERE tituloLivro = 'Livro 1';

-------------------------- Inner Join ---------------------------

-- Selecionando nome de quem alugou o livro e titulo do alugado
SELECT Leitor.nome, Livro.titulo
FROM Leitor
INNER JOIN LivroAlugado
ON Leitor.cpf = LivroAlugado.cpfLeitor
INNER JOIN Livro
ON LivroAlugado.tituloLivro = Livro.titulo;
