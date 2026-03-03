/* logico_02: */

CREATE TABLE Cliente (
    Cod_Ciente INTEGER PRIMARY KEY,
    Sobrenome VARCHAR,
    Nome VARCHAR,
    Inicial VARCHAR,
    DDD VARCHAR,
    Telefone VARCHAR,
    Saldo TIME
);

CREATE TABLE Fatura (
    Num_Fatura INTEGER PRIMARY KEY,
    Data_Fatura TIMESTAMP,
    fk_Cliente_Cod_Ciente INTEGER
);

CREATE TABLE Linha (
    Num_Linha INTEGER PRIMARY KEY,
    Unidade VARCHAR,
    Valor REAL,
    fk_Fatura_Num_Fatura INTEGER,
    fk_Produto_Cod_Produto INTEGER
);

CREATE TABLE Produto (
    Cod_Produto INTEGER PRIMARY KEY,
    Descricao VARCHAR,
    Data_Compra TIMESTAMP,
    Quantidade REAL,
    Valor REAL,
    fk_Fornecedor_Cod_Fornecedor INTEGER
);

CREATE TABLE Fornecedor (
    Cod_Fornecedor INTEGER PRIMARY KEY,
    Nome VARCHAR,
    Contato VARCHAR,
    DDD VARCHAR,
    Telefone VARCHAR,
    Entrada TIME
);
 
ALTER TABLE Fatura ADD CONSTRAINT FK_Fatura_2
    FOREIGN KEY (fk_Cliente_Cod_Ciente)
    REFERENCES Cliente (Cod_Ciente)
    ON DELETE CASCADE;
 
ALTER TABLE Linha ADD CONSTRAINT FK_Linha_2
    FOREIGN KEY (fk_Fatura_Num_Fatura)
    REFERENCES Fatura (Num_Fatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Linha ADD CONSTRAINT FK_Linha_3
    FOREIGN KEY (fk_Produto_Cod_Produto)
    REFERENCES Produto (Cod_Produto)
    ON DELETE CASCADE;
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (fk_Fornecedor_Cod_Fornecedor)
    REFERENCES Fornecedor (Cod_Fornecedor)
    ON DELETE CASCADE;