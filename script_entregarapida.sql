
CREATE TABLE Cliente (
    codigo INTEGER PRIMARY KEY,
    nomeCompleto VARCHAR,
    endereco VARCHAR
);

CREATE TABLE Pedido (
    codigo INTEGER PRIMARY KEY,
    fk_Cliente_codigo INTEGER,
    data DATE,
    fk_Pagamento_codigo INTEGER,
    fk_Entrega_codigo INTEGER
);

CREATE TABLE Produto (
    descricao VARCHAR,
    quantidade INTEGER,
    preco FLOAT,
    codigo INTEGER PRIMARY KEY
);

CREATE TABLE Fornecedor (
    nomeFornecedor VARCHAR,
    codFornecedor INTEGER PRIMARY KEY
);

CREATE TABLE Atendente (
    salario FLOAT,
    nomeCompleto VARCHAR,
    matricula INTEGER PRIMARY KEY
);

CREATE TABLE Pedido_Produto (
    codProduto INTEGER,
    codPedido INTEGER,
    fk_Produto_codigo INTEGER,
    fk_Pedido_codigo INTEGER
);

CREATE TABLE Pagamento (
    codigo INTEGER PRIMARY KEY,
    descricao VARCHAR
);

CREATE TABLE Entrega (
    codigo INTEGER PRIMARY KEY,
    descricao VARCHAR,
    preco FLOAT
);

CREATE TABLE Fornecedor_Produto (
    fk_Fornecedor_codFornecedor INTEGER,
    fk_Produto_codigo INTEGER
);

CREATE TABLE Atendente_Comissao (
    fk_Atendente_matricula INTEGER,
    fk_Pedido_codigo INTEGER,
    comissao FLOAT
);

CREATE TABLE Encomenda_Fornecedor (
    fk_Atendente_matricula INTEGER,
    fk_Produto_codigo INTEGER,
    quantidade INTEGER
);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Cliente_codigo)
    REFERENCES Cliente (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3
    FOREIGN KEY (fk_Pagamento_codigo)
    REFERENCES Pagamento (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_4
    FOREIGN KEY (fk_Entrega_codigo)
    REFERENCES Entrega (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FK_Pedido_Produto_1
    FOREIGN KEY (fk_Produto_codigo)
    REFERENCES Produto (codigo);
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FK_Pedido_Produto_2
    FOREIGN KEY (fk_Pedido_codigo)
    REFERENCES Pedido (codigo);
 
ALTER TABLE Fornecedor_Produto ADD CONSTRAINT FK_Fornecedor_Produto_1
    FOREIGN KEY (fk_Fornecedor_codFornecedor)
    REFERENCES Fornecedor (codFornecedor)
    ON DELETE RESTRICT;
 
ALTER TABLE Fornecedor_Produto ADD CONSTRAINT FK_Fornecedor_Produto_2
    FOREIGN KEY (fk_Produto_codigo)
    REFERENCES Produto (codigo)
    ON DELETE SET NULL;
 
ALTER TABLE Atendente_Comissao ADD CONSTRAINT FK_Atendente_Comissao_1
    FOREIGN KEY (fk_Atendente_matricula)
    REFERENCES Atendente (matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE Atendente_Comissao ADD CONSTRAINT FK_Atendente_Comissao_2
    FOREIGN KEY (fk_Pedido_codigo)
    REFERENCES Pedido (codigo)
    ON DELETE SET NULL;
 
ALTER TABLE Encomenda_Fornecedor ADD CONSTRAINT FK_Encomenda_Fornecedor_1
    FOREIGN KEY (fk_Atendente_matricula)
    REFERENCES Atendente (matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Encomenda_Fornecedor ADD CONSTRAINT FK_Encomenda_Fornecedor_2
    FOREIGN KEY (fk_Produto_codigo)
    REFERENCES Produto (codigo)
    ON DELETE SET NULL;
    