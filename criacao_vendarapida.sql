

--criacao do banco e das tabela venda rapida
--CREATE DATABASE vendarapida10;
--USE vendarapida10;

CREATE TABLE Cliente (
    codigo INTEGER IDENTITY NOT NULL PRIMARY KEY,
    nomeCompleto VARCHAR(255),
    endereco VARCHAR(255));

CREATE TABLE Pedido (
    codigo INTEGER IDENTITY NOT NULL PRIMARY KEY,
    fk_Cliente_codigo INTEGER,
    data DATE,
    fk_Pagamento_codigo INTEGER,
    fk_Entrega_codigo INTEGER
);

CREATE TABLE Produto (
    descricao VARCHAR(255),
    quantidade INTEGER,
    preco FLOAT,
    codigo INTEGER NOT NULL PRIMARY KEY,
);


CREATE TABLE Fornecedor (
    nomeFornecedor VARCHAR(255),
    codFornecedor INTEGER NOT NULL PRIMARY KEY,
);

CREATE TABLE Atendente (
    salario FLOAT,
    nomeCompleto VARCHAR(255),
    matricula INTEGER IDENTITY NOT NULL PRIMARY KEY,
);

CREATE TABLE Pedido_Produto (
     fk_Produto_codigo INTEGER,
     fk_Pedido_codigo INTEGER
);

CREATE TABLE Pagamento (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(255)
);


CREATE TABLE Entrega (
    codigo INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR(255),
    preco FLOAT
);


CREATE TABLE Fornecedor_Produto (
    fk_Fornecedor_codFornecedor INTEGER,
    fk_Produto_codigo INTEGER
);




CREATE TABLE Atendente_Comissao (
    fk_Atendente_matricula INTEGER,
    fk_Pedido_codigo INTEGER UNIQUE,
    comissao FLOAT
);

CREATE TABLE Encomenda_Fornecedor (
    fk_Atendente_matricula INTEGER,
    fk_Produto_codigo INTEGER,
    quantidade INTEGER
);
 
ALTER TABLE Pedido ADD CONSTRAINT FKConstraint_Cliente
    FOREIGN KEY (fk_Cliente_codigo)
    REFERENCES Cliente (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido ADD CONSTRAINT FKConstraint_Pagamento
    FOREIGN KEY (fk_Pagamento_codigo)
    REFERENCES Pagamento (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido ADD CONSTRAINT FKConstraint_Entrega
    FOREIGN KEY (fk_Entrega_codigo)
    REFERENCES Entrega (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FKConstraint_PedidoProduto_Produto
    FOREIGN KEY (fk_Produto_codigo)
    REFERENCES Produto (codigo);
 
ALTER TABLE Pedido_Produto ADD CONSTRAINT FKConstraint_PedidoProduto_Pedido
    FOREIGN KEY (fk_Pedido_codigo)
    REFERENCES Pedido (codigo);
 
ALTER TABLE Fornecedor_Produto ADD CONSTRAINT FKConstraint_FornProd_Forn
    FOREIGN KEY (fk_Fornecedor_codFornecedor)
    REFERENCES Fornecedor (codFornecedor)
    ON DELETE CASCADE;

 
ALTER TABLE Atendente_Comissao ADD CONSTRAINT FKConstraint_AtendComis_Matric
    FOREIGN KEY (fk_Atendente_matricula)
    REFERENCES Atendente (matricula)
    ON DELETE CASCADE;
 
ALTER TABLE Atendente_Comissao ADD CONSTRAINT FKConstraint_AtendComis_Ped
    FOREIGN KEY (fk_Pedido_codigo)
    REFERENCES Pedido (codigo)
    ON DELETE SET NULL;
 
ALTER TABLE Encomenda_Fornecedor ADD CONSTRAINT FKConstraint_EncomForn_Atend
    FOREIGN KEY (fk_Atendente_matricula)
    REFERENCES Atendente (matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Encomenda_Fornecedor ADD CONSTRAINT FKConstraint_EncomForn_Prod
    FOREIGN KEY (fk_Produto_codigo)
    REFERENCES Produto (codigo)
    ON DELETE SET NULL;

ALTER TABLE PRODUTO
ADD CODFORNECEDOR INTEGER

ALTER TABLE PRODUTO ADD CONSTRAINT FKCodidoFornecedor
 FOREIGN KEY (CODFORNECEDOR)
 REFERENCES FORNECEDOR (codFornecedor)



