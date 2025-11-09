CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cidade VARCHAR(50)
);

CREATE TABLE Produtos (
    IdProduto INT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10,2)
);

CREATE TABLE Vendas (
    IdVenda INT PRIMARY KEY,
    IdCliente INT,
    IdProduto INT,
    Quantidade INT,
    DataVenda DATE,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdProduto) REFERENCES Produtos(IdProduto)
);

INSERT INTO Clientes VALUES
(1, 'Ana Souza', 'São Paulo'),
(2, 'Carlos Lima', 'Rio de Janeiro'),
(3, 'Beatriz Ramos', 'São Paulo');

INSERT INTO Produtos VALUES
(1, 'Notebook', 3500.00),
(2, 'Mouse', 80.00),
(3, 'Teclado', 150.00);

INSERT INTO Vendas VALUES
(1, 1, 1, 1, '2025-11-01'),
(2, 1, 2, 2, '2025-11-01'),
(3, 2, 3, 1, '2025-11-02'),
(4, 3, 1, 1, '2025-11-02'),
(5, 3, 2, 1, '2025-11-03');