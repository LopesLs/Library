-------------------------- Criação ------------------------------

-- Criação da tabela leitor
CREATE TABLE Leitor (CPF PRIMARY KEY VARCHAR(11), nome VARCHAR(20), telefone VARCHAR(14), endereco VARCHAR(20));

-- Criação da tabela Livro
CREATE TABLE Livro (titulo PRIMARY KEY VARCHAR(20), autor VARCHAR(20), genero VARCHAR(15), quantidade INT, editora VARCHAR(20), dataLancamento DATE);

-- Criação da tabela LivroAlugado
CREATE TABLE LivroAlugado (CPFLeitor VARCHAR(11) REFERENCES Leitor(CPF), tituloLivro VARCHAR(20) REFERENCES Livro(titulo));

-------------------------- Inserção ------------------------------

-- Inserção de dados na tabela Leitor
INSERT INTO Leitor (CPF, nome, telefone, endereco)
VALUES ('12345678901', 'João Silva', '11 99999-9999', 'Rua A, 123');

INSERT INTO Leitor (CPF, nome, telefone, endereco)
VALUES ('10987654321', 'Maria Rodriguez', '11 88888-8888', 'Rua B, 456');

-- Inserção de dados na tabela Livro
INSERT INTO Livro (titulo, autor, genero, quantidade, editora, dataLancamento)
VALUES ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Infanto-juvenil', 10, 'Editora X', '1943-04-06');

INSERT INTO Livro (titulo, autor, genero, quantidade, editora, dataLancamento)
VALUES ('O Morro dos Ventos Uivantes', 'Emily Bronte', 'Romance', 5, 'Editora Y', '1847-12-18');

-- Inserção de dados na tabela LivroAlugado
INSERT INTO LivroAlugado (CPFLeitor, tituloLivro)
VALUES ('12345678901', 'O Pequeno Príncipe');


INSERT INTO LivroAlugado (CPFLeitor, tituloLivro)
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
UPDATE Leitor SET nome = 'Novo Nome', telefone = 'Novo Telefone', endereco = 'Novo Endereco' WHERE CPF = '12345678901';

-- Atualização de dados na tabela Livro
UPDATE Livro SET autor = 'Novo Autor', genero = 'Novo Gênero', quantidade = 5, editora = 'Nova Editora', dataLancamento = '2023-01-01' WHERE titulo = 'Livro 1';

-- Atualização de dados na tabela LivroAlugados
UPDATE LivroAlugados SET CPFLeitor = '10987654321' WHERE tituloLivro = 'Livro 1';
