-- Beatriz Fon Ehnert de Santi RM551856
-- Mirelly Ribeiro Azevedo RM98672

set SERVEROUTPUT ON
set VERIFY OFF  


--drops table 
DROP TABLE movimento_estoque CASCADE CONSTRAINTS;
DROP TABLE produto_composto CASCADE CONSTRAINTS;
DROP TABLE historico_pedido CASCADE CONSTRAINTS;
DROP TABLE item_pedido CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE usuario CASCADE CONSTRAINTS;
DROP TABLE cliente_vendedor CASCADE CONSTRAINTS;
DROP TABLE vendedor CASCADE CONSTRAINTS;
DROP TABLE endereco_cliente CASCADE CONSTRAINTS;
DROP TABLE tipo_endereco CASCADE CONSTRAINTS;
DROP TABLE estoque_produto CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE estoque CASCADE CONSTRAINTS;
DROP TABLE cidade CASCADE CONSTRAINTS;
DROP TABLE estado CASCADE CONSTRAINTS;
DROP TABLE pais CASCADE CONSTRAINTS;
DROP TABLE tipo_movimento_estoque CASCADE CONSTRAINTS;


--Criando tabelas 

CREATE TABLE movimento_estoque (
       SEQ_MOVIMENTO_ESTOQUE NUMBER(15) NOT NULL,
       COD_PRODUTO          NUMBER(10) NULL,
       DAT_MOVIMENTO_ESTOQUE DATE NULL,
       QTD_MOVIMENTACAO_ESTOQUE INTEGER NULL,
       COD_TIPO_MOVIMENTO_ESTOQUE NUMBER(2) NULL
);

CREATE UNIQUE INDEX XPKmovimento_estoque ON movimento_estoque
(SEQ_MOVIMENTO_ESTOQUE   ASC);

CREATE INDEX XIF1movimento_estoque ON movimento_estoque
(
       COD_PRODUTO                    ASC
);

CREATE INDEX XIF2movimento_estoque ON movimento_estoque
(
       COD_TIPO_MOVIMENTO_ESTOQUE     ASC
);


ALTER TABLE movimento_estoque
       ADD CONSTRAINT XPKmovimento_estoque PRIMARY KEY (
              SEQ_MOVIMENTO_ESTOQUE);



CREATE TABLE produto_composto (
       COD_PRODUTO_RELACIONADO NUMBER(10) NOT NULL,
       COD_PRODUTO          NUMBER(10) NOT NULL,
       QTD_PRODUTO          NUMBER(6) NULL,
       QTD_PRODUTO_RELACIONADO NUMBER(6) NULL,
       STA_ATIVO            CHAR(1) NULL,
       DAT_CADASTRO         DATE NULL,
       DAT_CANCELAMENTO     DATE NULL
);

CREATE UNIQUE INDEX XPKproduto_composto ON produto_composto
(
       COD_PRODUTO_RELACIONADO        ASC,
       COD_PRODUTO                    ASC
);

CREATE INDEX XIF1produto_composto ON produto_composto
(
       COD_PRODUTO                    ASC
);

CREATE INDEX XIF2produto_composto ON produto_composto
(
       COD_PRODUTO_RELACIONADO        ASC
);


ALTER TABLE produto_composto
       ADD CONSTRAINT XPKproduto_composto PRIMARY KEY (
              COD_PRODUTO_RELACIONADO, COD_PRODUTO);


CREATE TABLE historico_pedido (
       SEQ_HISTORICO_PEDIDO INTEGER NOT NULL,
       COD_PEDIDO           NUMBER(10) NOT NULL,
       COD_CLIENTE          NUMBER(10) NULL,
       DAT_PEDIDO           DATE NULL,
       DAT_CANCELAMENTO     DATE NULL,
       DAT_ENTREGA          DATE NULL,
       VAL_TOTAL_PEDIDO     NUMBER(12,2) NULL,
       VAL_DESCONTO         NUMBER(12,2) NULL,
       SEQ_ENDERECO_CLIENTE NUMBER(10) NULL,
       COD_VENDEDOR         NUMBER(4) NULL
);

CREATE UNIQUE INDEX XPKhistorico_pedido ON historico_pedido
(
       SEQ_HISTORICO_PEDIDO           ASC
);

CREATE INDEX XIF1historico_pedido ON historico_pedido
(
       SEQ_ENDERECO_CLIENTE           ASC
);

CREATE INDEX XIF2historico_pedido ON historico_pedido
(
       COD_CLIENTE                    ASC
);

CREATE INDEX XIF4historico_pedido ON historico_pedido
(
       COD_PEDIDO                     ASC
);

CREATE INDEX XIF5historico_pedido ON historico_pedido
(
       COD_VENDEDOR                   ASC
);


ALTER TABLE historico_pedido
       ADD CONSTRAINT XPKhistorico_pedido PRIMARY KEY (
              SEQ_HISTORICO_PEDIDO);



CREATE TABLE item_pedido (
       COD_PEDIDO           NUMBER(10) NOT NULL,
       COD_ITEM_PEDIDO      INTEGER NOT NULL,
       COD_PRODUTO          NUMBER(10) NULL,
       QTD_ITEM             NUMBER(10) NULL,
       VAL_UNITARIO_ITEM    NUMBER(12,2) NULL,
       VAL_DESCONTO_ITEM    NUMBER(12,2) NULL
);

CREATE UNIQUE INDEX XPKitem_pedido ON item_pedido
(
       COD_PEDIDO                     ASC,
       COD_ITEM_PEDIDO                ASC
);

CREATE INDEX XIF1item_pedido ON item_pedido
(
       COD_PEDIDO                     ASC
);

CREATE INDEX XIF2item_pedido ON item_pedido
(
       COD_PRODUTO                    ASC
);


ALTER TABLE item_pedido
       ADD CONSTRAINT XPKitem_pedido PRIMARY KEY (COD_PEDIDO, 
              COD_ITEM_PEDIDO);



CREATE TABLE pedido (
       COD_PEDIDO           NUMBER(10) NOT NULL,
       COD_PEDIDO_RELACIONADO NUMBER(10) NULL,
       COD_CLIENTE          NUMBER(10) NULL,
       COD_USUARIO          NUMBER(5) NULL,
       COD_VENDEDOR         NUMBER(4) NULL,
       DAT_PEDIDO           DATE NULL,
       DAT_CANCELAMENTO     DATE NULL,
       DAT_ENTREGA          DATE NULL,
       VAL_TOTAL_PEDIDO     NUMBER(12,2) NULL,
       VAL_DESCONTO         NUMBER(12,2) NULL,
       SEQ_ENDERECO_CLIENTE NUMBER(10) NULL
);

CREATE UNIQUE INDEX XPKpedido ON pedido
(
       COD_PEDIDO                     ASC
);

CREATE INDEX XIF1pedido ON pedido
(
       COD_CLIENTE                    ASC
);

CREATE INDEX XIF2pedido ON pedido
(
       SEQ_ENDERECO_CLIENTE           ASC
);

CREATE INDEX XIF3pedido ON pedido
(
       COD_PEDIDO_RELACIONADO         ASC
);

CREATE INDEX XIF4pedido ON pedido
(
       COD_VENDEDOR                   ASC
);

CREATE INDEX XIF5pedido ON pedido
(
       COD_USUARIO                    ASC
);


ALTER TABLE pedido
       ADD CONSTRAINT XPKpedido PRIMARY KEY (COD_PEDIDO);



CREATE TABLE usuario (
       COD_USUARIO          NUMBER(5) NOT NULL,
       NOM_USUARIO          VARCHAR2(50) NULL,
       STA_ATIVO            CHAR(1) NULL
);

CREATE UNIQUE INDEX XPKusuario ON usuario
(
       COD_USUARIO                    ASC
);


ALTER TABLE usuario
       ADD CONSTRAINT XPKusuario PRIMARY KEY (COD_USUARIO);



CREATE TABLE cliente_vendedor (
       COD_CLIENTE          NUMBER(10) NOT NULL,
       COD_VENDEDOR         NUMBER(4) NOT NULL,
       DAT_INICIO           DATE NOT NULL,
       DAT_TERMINO          DATE NULL
);

CREATE UNIQUE INDEX XPKcliente_vendedor ON cliente_vendedor
(
       COD_CLIENTE                    ASC,
       COD_VENDEDOR                   ASC,
       DAT_INICIO                     ASC
);

CREATE INDEX XIF1cliente_vendedor ON cliente_vendedor
(
       COD_CLIENTE                    ASC
);

CREATE INDEX XIF2cliente_vendedor ON cliente_vendedor
(
       COD_VENDEDOR                   ASC
);


ALTER TABLE cliente_vendedor
       ADD CONSTRAINT XPKcliente_vendedor PRIMARY KEY (COD_CLIENTE, 
              COD_VENDEDOR, DAT_INICIO);



CREATE TABLE vendedor (
       COD_VENDEDOR         NUMBER(4) NOT NULL,
       NOM_VENDEDOR         VARCHAR2(50) NULL,
       STA_ATIVO            CHAR(1) NULL
);

CREATE UNIQUE INDEX XPKvendedor ON vendedor
(
       COD_VENDEDOR                   ASC
);


ALTER TABLE vendedor
       ADD CONSTRAINT XPKvendedor PRIMARY KEY (COD_VENDEDOR);



CREATE TABLE endereco_cliente (
       SEQ_ENDERECO_CLIENTE NUMBER(10) NOT NULL,
       COD_TIPO_ENDERECO    NUMBER(2) NULL,
       COD_CLIENTE          NUMBER(10) NULL,
       DES_ENDERECO         VARCHAR2(80) NULL,
       NUM_ENDERECO         VARCHAR2(10) NULL,
       DES_COMPLEMENTO      VARCHAR2(20) NULL,
       NUM_CEP              NUMBER(9) NULL,
       DES_BAIRRO           VARCHAR2(50) NULL,
       COD_CIDADE           NUMBER(6) NULL,
       STA_ATIVO            CHAR(1) NULL,
       DAT_CADASTRO         DATE NULL,
       DAT_CANCELAMENTO     VARCHAR2(20) NULL
);

CREATE UNIQUE INDEX XPKendereco_cliente ON endereco_cliente
(
       SEQ_ENDERECO_CLIENTE           ASC
);

CREATE INDEX XIF1endereco_cliente ON endereco_cliente
(
       COD_CLIENTE                    ASC
);

CREATE INDEX XIF2endereco_cliente ON endereco_cliente
(
       COD_TIPO_ENDERECO              ASC
);

CREATE INDEX XIF3endereco_cliente ON endereco_cliente
(
       COD_CIDADE                     ASC
);


ALTER TABLE endereco_cliente
       ADD CONSTRAINT XPKendereco_cliente PRIMARY KEY (
              SEQ_ENDERECO_CLIENTE);



CREATE TABLE tipo_endereco (
       COD_TIPO_ENDERECO    NUMBER(2) NOT NULL,
       DES_TIPO_ENDERECO    VARCHAR2(50) NULL
);

CREATE UNIQUE INDEX XPKtipo_endereco ON tipo_endereco
(
       COD_TIPO_ENDERECO              ASC
);


ALTER TABLE tipo_endereco
       ADD CONSTRAINT XPKtipo_endereco PRIMARY KEY (COD_TIPO_ENDERECO);



CREATE TABLE estoque_produto (
       COD_PRODUTO          NUMBER(10) NOT NULL,
       COD_ESTOQUE          NUMBER(4) NOT NULL,
       DAT_ESTOQUE          DATE NOT NULL,
       QTD_PRODUTO          NUMBER(10) NULL
);

CREATE UNIQUE INDEX XPKestoque_produto ON estoque_produto
(
       COD_PRODUTO                    ASC,
       COD_ESTOQUE                    ASC,
       DAT_ESTOQUE                    ASC
);

CREATE INDEX XIF1estoque_produto ON estoque_produto
(
       COD_PRODUTO                    ASC
);

CREATE INDEX XIF2estoque_produto ON estoque_produto
(
       COD_ESTOQUE                    ASC
);


ALTER TABLE estoque_produto
       ADD CONSTRAINT XPKestoque_produto PRIMARY KEY (COD_PRODUTO, 
              COD_ESTOQUE, DAT_ESTOQUE);



CREATE TABLE produto (
       COD_PRODUTO          NUMBER(10) NOT NULL,
       NOM_PRODUTO          VARCHAR2(20) NULL,
       COD_BARRA            VARCHAR2(20) NULL,
       STA_ATIVO            VARCHAR2(20) NULL,
       DAT_CADASTRO         DATE NULL,
       DAT_CANCELAMENTO     DATE NULL
);

CREATE UNIQUE INDEX XPKproduto ON produto
(
       COD_PRODUTO                    ASC
);


ALTER TABLE produto
       ADD CONSTRAINT XPKproduto PRIMARY KEY (COD_PRODUTO);



CREATE TABLE cliente (
       COD_CLIENTE          NUMBER(10) NOT NULL,
       NOM_CLIENTE          VARCHAR2(50) NULL,
       DES_RAZAO_SOCIAL     VARCHAR2(80) NULL,
       TIP_PESSOA           CHAR(1) NULL,
       NUM_CPF_CNPJ         NUMBER(15) NULL,
       DAT_CADASTRO         DATE NULL,
       DAT_CANCELAMENTO     DATE NULL,
       STA_ATIVO            CHAR(1) NULL
);

CREATE UNIQUE INDEX XPKcliente ON cliente
(
       COD_CLIENTE                    ASC
);


ALTER TABLE cliente
       ADD CONSTRAINT XPKcliente PRIMARY KEY (COD_CLIENTE);



CREATE TABLE estoque (
       COD_ESTOQUE          NUMBER(4) NOT NULL,
       NOM_ESTOQUE          VARCHAR2(50) NULL
);

CREATE UNIQUE INDEX XPKestoque ON estoque
(
       COD_ESTOQUE                    ASC
);


ALTER TABLE estoque
       ADD CONSTRAINT XPKestoque PRIMARY KEY (COD_ESTOQUE);



CREATE TABLE cidade (
       COD_CIDADE           NUMBER(6) NOT NULL,
       NOM_CIDADE           VARCHAR2(20) NULL,
       COD_ESTADO           CHAR(3) NULL
);

CREATE UNIQUE INDEX XPKcidade ON cidade
(
       COD_CIDADE                     ASC
);

CREATE INDEX XIF1cidade ON cidade
(
       COD_ESTADO                     ASC
);


ALTER TABLE cidade
       ADD CONSTRAINT XPKcidade PRIMARY KEY (COD_CIDADE);



CREATE TABLE estado (
       COD_ESTADO           CHAR(3) NOT NULL,
       NOM_ESTADO           VARCHAR2(50) NULL,
       COD_PAIS             NUMBER(3) NULL
);

CREATE UNIQUE INDEX XPKestado ON estado
(
       COD_ESTADO                     ASC
);

CREATE INDEX XIF1estado ON estado
(
       COD_PAIS                       ASC
);


ALTER TABLE estado
       ADD CONSTRAINT XPKestado PRIMARY KEY (COD_ESTADO);



CREATE TABLE pais (
       COD_PAIS             NUMBER(3) NOT NULL,
       NOM_PAIS             VARCHAR2(50) NULL
);

CREATE UNIQUE INDEX XPKpais ON pais
(
       COD_PAIS                       ASC
);


ALTER TABLE pais
       ADD CONSTRAINT XPKpais PRIMARY KEY (COD_PAIS);



CREATE TABLE tipo_movimento_estoque (
       COD_TIPO_MOVIMENTO_ESTOQUE NUMBER(2) NOT NULL,
       DES_TIPO_MOVIMENTO_ESTOQUE VARCHAR2(50) NULL,
       STA_SAIDA_ENTRADA    CHAR(1) NULL
);

CREATE UNIQUE INDEX XPKtipo_movimento_estoque ON tipo_movimento_estoque
(
       COD_TIPO_MOVIMENTO_ESTOQUE     ASC
);


ALTER TABLE tipo_movimento_estoque
       ADD CONSTRAINT XPKtipo_movimento_estoque PRIMARY KEY (
              COD_TIPO_MOVIMENTO_ESTOQUE);


ALTER TABLE movimento_estoque
       ADD CONSTRAINT R_24
              FOREIGN KEY (COD_TIPO_MOVIMENTO_ESTOQUE)
                             REFERENCES tipo_movimento_estoque  (
              COD_TIPO_MOVIMENTO_ESTOQUE);


ALTER TABLE movimento_estoque
       ADD CONSTRAINT R_17
              FOREIGN KEY (COD_PRODUTO)
                             REFERENCES produto  (COD_PRODUTO);


ALTER TABLE produto_composto
       ADD CONSTRAINT R_16
              FOREIGN KEY (COD_PRODUTO_RELACIONADO)
                             REFERENCES produto  (COD_PRODUTO);


ALTER TABLE produto_composto
       ADD CONSTRAINT R_15
              FOREIGN KEY (COD_PRODUTO)
                             REFERENCES produto  (COD_PRODUTO);


ALTER TABLE historico_pedido
       ADD CONSTRAINT R_25
              FOREIGN KEY (COD_VENDEDOR)
                             REFERENCES vendedor  (COD_VENDEDOR);


ALTER TABLE historico_pedido
       ADD CONSTRAINT R_19
              FOREIGN KEY (COD_PEDIDO)
                             REFERENCES pedido  (COD_PEDIDO);


ALTER TABLE historico_pedido
       ADD CONSTRAINT R_9
              FOREIGN KEY (COD_CLIENTE)
                             REFERENCES cliente  (COD_CLIENTE);


ALTER TABLE historico_pedido
       ADD CONSTRAINT R_8
              FOREIGN KEY (SEQ_ENDERECO_CLIENTE)
                             REFERENCES endereco_cliente  (
              SEQ_ENDERECO_CLIENTE);


ALTER TABLE item_pedido
       ADD CONSTRAINT R_3
              FOREIGN KEY (COD_PRODUTO)
                             REFERENCES produto  (COD_PRODUTO);


ALTER TABLE item_pedido
       ADD CONSTRAINT R_2
              FOREIGN KEY (COD_PEDIDO)
                             REFERENCES pedido  (COD_PEDIDO);


ALTER TABLE pedido
       ADD CONSTRAINT R_14
              FOREIGN KEY (COD_USUARIO)
                             REFERENCES usuario  (COD_USUARIO);


ALTER TABLE pedido
       ADD CONSTRAINT R_12
              FOREIGN KEY (COD_VENDEDOR)
                             REFERENCES vendedor  (COD_VENDEDOR);


ALTER TABLE pedido
       ADD CONSTRAINT R_7
              FOREIGN KEY (COD_PEDIDO_RELACIONADO)
                             REFERENCES pedido  (COD_PEDIDO);


ALTER TABLE pedido
       ADD CONSTRAINT R_6
              FOREIGN KEY (SEQ_ENDERECO_CLIENTE)
                             REFERENCES endereco_cliente  (
              SEQ_ENDERECO_CLIENTE);


ALTER TABLE pedido
       ADD CONSTRAINT R_1
              FOREIGN KEY (COD_CLIENTE)
                             REFERENCES cliente  (COD_CLIENTE);


ALTER TABLE cliente_vendedor
       ADD CONSTRAINT R_11
              FOREIGN KEY (COD_VENDEDOR)
                             REFERENCES vendedor  (COD_VENDEDOR);


ALTER TABLE cliente_vendedor
       ADD CONSTRAINT R_10
              FOREIGN KEY (COD_CLIENTE)
                             REFERENCES cliente  (COD_CLIENTE);


ALTER TABLE endereco_cliente
       ADD CONSTRAINT R_22
              FOREIGN KEY (COD_CIDADE)
                             REFERENCES cidade  (COD_CIDADE);


ALTER TABLE endereco_cliente
       ADD CONSTRAINT R_5
              FOREIGN KEY (COD_TIPO_ENDERECO)
                             REFERENCES tipo_endereco  (
              COD_TIPO_ENDERECO);


ALTER TABLE endereco_cliente
       ADD CONSTRAINT R_4
              FOREIGN KEY (COD_CLIENTE)
                             REFERENCES cliente  (COD_CLIENTE);


ALTER TABLE estoque_produto
       ADD CONSTRAINT R_20
              FOREIGN KEY (COD_ESTOQUE)
                             REFERENCES estoque  (COD_ESTOQUE);


ALTER TABLE estoque_produto
       ADD CONSTRAINT R_18
              FOREIGN KEY (COD_PRODUTO)
                             REFERENCES produto  (COD_PRODUTO);


ALTER TABLE cidade
       ADD CONSTRAINT R_21
              FOREIGN KEY (COD_ESTADO)
                             REFERENCES estado  (COD_ESTADO);


ALTER TABLE estado
       ADD CONSTRAINT R_23
              FOREIGN KEY (COD_PAIS)
                             REFERENCES pais  (COD_PAIS);



-- Insert tabela pais 
INSERT INTO pais (COD_PAIS, NOM_PAIS) VALUES (1, 'Brasil');
INSERT INTO pais (COD_PAIS, NOM_PAIS) VALUES (2, 'Estados Unidos');
INSERT INTO pais (COD_PAIS, NOM_PAIS) VALUES (3, 'Argentina');

SELECT * FROM pais;

-- Insert tabela estado 
INSERT INTO estado (COD_ESTADO, NOM_ESTADO, COD_PAIS) VALUES ('SP', 'São Paulo', 1);
INSERT INTO estado (COD_ESTADO, NOM_ESTADO, COD_PAIS) VALUES ('RJ', 'Rio de Janeiro', 1);
INSERT INTO estado (COD_ESTADO, NOM_ESTADO, COD_PAIS) VALUES ('MG', 'Minas Gerais', 1);

SELECT * FROM estado;


-- Insert tabela cidade 
INSERT INTO cidade (COD_CIDADE, NOM_CIDADE, COD_ESTADO) VALUES (1, 'São Paulo', 'SP');
INSERT INTO cidade (COD_CIDADE, NOM_CIDADE, COD_ESTADO) VALUES (2, 'Rio de Janeiro', 'RJ');
INSERT INTO cidade (COD_CIDADE, NOM_CIDADE, COD_ESTADO) VALUES (3, 'Belo Horizonte', 'MG');

SELECT * FROM cidade;

-- Insert tabela estoque 
INSERT INTO estoque (COD_ESTOQUE, NOM_ESTOQUE) VALUES (1, 'Estoque Central');
INSERT INTO estoque (COD_ESTOQUE, NOM_ESTOQUE) VALUES (2, 'Estoque Filial A');
INSERT INTO estoque (COD_ESTOQUE, NOM_ESTOQUE) VALUES (3, 'Estoque Filial B');

SELECT * FROM estoque;

-- Insert tabela tipo_endereco 
INSERT INTO tipo_endereco (COD_TIPO_ENDERECO, DES_TIPO_ENDERECO) VALUES (1, 'Residencial');
INSERT INTO tipo_endereco (COD_TIPO_ENDERECO, DES_TIPO_ENDERECO) VALUES (2, 'Comercial');
INSERT INTO tipo_endereco (COD_TIPO_ENDERECO, DES_TIPO_ENDERECO) VALUES (3, 'Entrega');

SELECT * FROM tipo_endereco;

-- Insert tabela tipo_movimento_estoque 
INSERT INTO tipo_movimento_estoque (COD_TIPO_MOVIMENTO_ESTOQUE, DES_TIPO_MOVIMENTO_ESTOQUE, STA_SAIDA_ENTRADA) VALUES (1, 'Entrada', 'E');
INSERT INTO tipo_movimento_estoque (COD_TIPO_MOVIMENTO_ESTOQUE, DES_TIPO_MOVIMENTO_ESTOQUE, STA_SAIDA_ENTRADA) VALUES (2, 'Saída', 'S');
INSERT INTO tipo_movimento_estoque (COD_TIPO_MOVIMENTO_ESTOQUE, DES_TIPO_MOVIMENTO_ESTOQUE, STA_SAIDA_ENTRADA) VALUES (3, 'Transferência', 'T');

SELECT * FROM tipo_movimento_estoque;

-- Insert tabela vendedor 
INSERT INTO vendedor (COD_VENDEDOR, NOM_VENDEDOR, STA_ATIVO) VALUES (1, 'João Silva', 'A');
INSERT INTO vendedor (COD_VENDEDOR, NOM_VENDEDOR, STA_ATIVO) VALUES (2, 'Maria Santos', 'A');
INSERT INTO vendedor (COD_VENDEDOR, NOM_VENDEDOR, STA_ATIVO) VALUES (3, 'Pedro Rodrigues', 'A');

SELECT * FROM vendedor;

-- Insert tabela usuario 
INSERT INTO usuario (COD_USUARIO, NOM_USUARIO, STA_ATIVO) VALUES (1, 'Administrador', 'A');
INSERT INTO usuario (COD_USUARIO, NOM_USUARIO, STA_ATIVO) VALUES (2, 'Operador', 'A');
INSERT INTO usuario (COD_USUARIO, NOM_USUARIO, STA_ATIVO) VALUES (3, 'Supervisor', 'A');

SELECT * FROM usuario;

-- Insert tabela produto 
INSERT INTO produto (COD_PRODUTO, NOM_PRODUTO, COD_BARRA, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (1, 'Camiseta', '7891234567890', 'A', DATE '2023-01-01', NULL);
INSERT INTO produto (COD_PRODUTO, NOM_PRODUTO, COD_BARRA, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (2, 'Calça Jeans', '1234567890123', 'A', DATE '2023-01-01', NULL);
INSERT INTO produto (COD_PRODUTO, NOM_PRODUTO, COD_BARRA, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (3, 'Blusa', '9876543210123', 'A', DATE '2023-01-01', NULL);

SELECT * FROM produto;

-- Insert tabela cliente 
INSERT INTO cliente (COD_CLIENTE, NOM_CLIENTE, DES_RAZAO_SOCIAL, TIP_PESSOA, NUM_CPF_CNPJ, DAT_CADASTRO, DAT_CANCELAMENTO, STA_ATIVO) VALUES (1, 'José da Silva', NULL, 'F', 12345678901, DATE '2023-01-01', NULL, 'A');
INSERT INTO cliente (COD_CLIENTE, NOM_CLIENTE, DES_RAZAO_SOCIAL, TIP_PESSOA, NUM_CPF_CNPJ, DAT_CADASTRO, DAT_CANCELAMENTO, STA_ATIVO) VALUES (2, 'Maria da Costa', NULL, 'F', 98765432101, DATE '2023-01-01', NULL, 'A');
INSERT INTO cliente (COD_CLIENTE, NOM_CLIENTE, DES_RAZAO_SOCIAL, TIP_PESSOA, NUM_CPF_CNPJ, DAT_CADASTRO, DAT_CANCELAMENTO, STA_ATIVO) VALUES (3, 'Empresa LTDA', 'Empresa LTDA', 'J', 12345678901234, DATE '2023-01-01', NULL, 'A');

SELECT * FROM cliente;

-- Insert tabela endereco_cliente 
INSERT INTO endereco_cliente (SEQ_ENDERECO_CLIENTE, COD_TIPO_ENDERECO, COD_CLIENTE, DES_ENDERECO, NUM_ENDERECO, DES_COMPLEMENTO, NUM_CEP, DES_BAIRRO, COD_CIDADE, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (1, 1, 1, 'Rua A', '123', 'Apto 101', 01234567, 'Centro', 1, 'A', DATE '2023-01-01', NULL);
INSERT INTO endereco_cliente (SEQ_ENDERECO_CLIENTE, COD_TIPO_ENDERECO, COD_CLIENTE, DES_ENDERECO, NUM_ENDERECO, DES_COMPLEMENTO, NUM_CEP, DES_BAIRRO, COD_CIDADE, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (2, 2, 2, 'Avenida B', '456', NULL, 01234567, 'Vila Nova', 1, 'A', DATE '2023-01-01', NULL);
INSERT INTO endereco_cliente (SEQ_ENDERECO_CLIENTE, COD_TIPO_ENDERECO, COD_CLIENTE, DES_ENDERECO, NUM_ENDERECO, DES_COMPLEMENTO, NUM_CEP, DES_BAIRRO, COD_CIDADE, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (3, 3, 3, 'Rua C', '789', NULL, 01234567, 'Jardim das Flores', 1, 'A', DATE '2023-01-01', NULL);

SELECT * FROM endereco_cliente;

-- Insert tabela pedido 
INSERT INTO pedido (COD_PEDIDO, COD_PEDIDO_RELACIONADO, COD_CLIENTE, COD_USUARIO, COD_VENDEDOR, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE) VALUES (1, NULL, 1, 1, 1, DATE '2023-01-01', NULL, DATE '2023-01-05', 100.00, 10.00, 1);
INSERT INTO pedido (COD_PEDIDO, COD_PEDIDO_RELACIONADO, COD_CLIENTE, COD_USUARIO, COD_VENDEDOR, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE) VALUES (2, NULL, 2, 2, 2, DATE '2023-01-02', NULL, DATE '2023-01-06', 200.00, 20.00, 2);
INSERT INTO pedido (COD_PEDIDO, COD_PEDIDO_RELACIONADO, COD_CLIENTE, COD_USUARIO, COD_VENDEDOR, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE) VALUES (3, NULL, 3, 3, 3, DATE '2023-01-03', NULL, DATE '2023-01-07', 300.00, 30.00, 3);

SELECT * FROM pedido;

-- Insert tabela item_pedido 
INSERT INTO item_pedido (COD_PEDIDO, COD_ITEM_PEDIDO, COD_PRODUTO, QTD_ITEM, VAL_UNITARIO_ITEM, VAL_DESCONTO_ITEM) VALUES (1, 1, 1, 2, 50.00, 5.00);
INSERT INTO item_pedido (COD_PEDIDO, COD_ITEM_PEDIDO, COD_PRODUTO, QTD_ITEM, VAL_UNITARIO_ITEM, VAL_DESCONTO_ITEM) VALUES (2, 1, 2, 1, 100.00, 10.00);
INSERT INTO item_pedido (COD_PEDIDO, COD_ITEM_PEDIDO, COD_PRODUTO, QTD_ITEM, VAL_UNITARIO_ITEM, VAL_DESCONTO_ITEM) VALUES (3, 1, 3, 3, 100.00, 15.00);

SELECT * FROM item_pedido;

-- Insert tabela historico_pedido 
INSERT INTO historico_pedido (SEQ_HISTORICO_PEDIDO, COD_PEDIDO, COD_CLIENTE, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE, COD_VENDEDOR) VALUES (1, 1, 1, DATE '2023-01-01', NULL, DATE '2023-01-05', 100.00, 10.00, 1, 1);
INSERT INTO historico_pedido (SEQ_HISTORICO_PEDIDO, COD_PEDIDO, COD_CLIENTE, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE, COD_VENDEDOR) VALUES (2, 2, 2, DATE '2023-01-02', NULL, DATE '2023-01-06', 200.00, 20.00, 2, 2);
INSERT INTO historico_pedido (SEQ_HISTORICO_PEDIDO, COD_PEDIDO, COD_CLIENTE, DAT_PEDIDO, DAT_CANCELAMENTO, DAT_ENTREGA, VAL_TOTAL_PEDIDO, VAL_DESCONTO, SEQ_ENDERECO_CLIENTE, COD_VENDEDOR) VALUES (3, 3, 3, DATE '2023-01-03', NULL, DATE '2023-01-07', 300.00, 30.00, 3, 3);

SELECT * FROM historico_pedido;

-- Insert tabela estoque_produto 
INSERT INTO estoque_produto (COD_PRODUTO, COD_ESTOQUE, DAT_ESTOQUE, QTD_PRODUTO) VALUES (1, 1, DATE '2023-01-01', 100);
INSERT INTO estoque_produto (COD_PRODUTO, COD_ESTOQUE, DAT_ESTOQUE, QTD_PRODUTO) VALUES (2, 2, DATE '2023-01-01', 50);
INSERT INTO estoque_produto (COD_PRODUTO, COD_ESTOQUE, DAT_ESTOQUE, QTD_PRODUTO) VALUES (3, 3, DATE '2023-01-01', 75);

SELECT * FROM estoque_produto;

-- Insert tabela produto_composto 
INSERT INTO produto_composto (COD_PRODUTO_RELACIONADO, COD_PRODUTO, QTD_PRODUTO, QTD_PRODUTO_RELACIONADO, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (1, 2, 2, 1, 'A', DATE '2023-01-01', NULL);
INSERT INTO produto_composto (COD_PRODUTO_RELACIONADO, COD_PRODUTO, QTD_PRODUTO, QTD_PRODUTO_RELACIONADO, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (2, 3, 3, 2, 'A', DATE '2023-01-01', NULL);
INSERT INTO produto_composto (COD_PRODUTO_RELACIONADO, COD_PRODUTO, QTD_PRODUTO, QTD_PRODUTO_RELACIONADO, STA_ATIVO, DAT_CADASTRO, DAT_CANCELAMENTO) VALUES (3, 1, 1, 4, 'A', DATE '2023-01-01', NULL);

SELECT * FROM produto_composto;

-- Insert tabela movimento_estoque 
INSERT INTO movimento_estoque (SEQ_MOVIMENTO_ESTOQUE, COD_PRODUTO, DAT_MOVIMENTO_ESTOQUE, QTD_MOVIMENTACAO_ESTOQUE, COD_TIPO_MOVIMENTO_ESTOQUE) VALUES (1, 1, DATE '2023-01-01', 100, 1);
INSERT INTO movimento_estoque (SEQ_MOVIMENTO_ESTOQUE, COD_PRODUTO, DAT_MOVIMENTO_ESTOQUE, QTD_MOVIMENTACAO_ESTOQUE, COD_TIPO_MOVIMENTO_ESTOQUE) VALUES (2, 2, DATE '2023-01-01', 50, 1);
INSERT INTO movimento_estoque (SEQ_MOVIMENTO_ESTOQUE, COD_PRODUTO, DAT_MOVIMENTO_ESTOQUE, QTD_MOVIMENTACAO_ESTOQUE, COD_TIPO_MOVIMENTO_ESTOQUE) VALUES (3, 3, DATE '2023-01-01', 75, 1);

SELECT * FROM movimento_estoque;

-- Insert tabela cliente_vendedor 
INSERT INTO cliente_vendedor (COD_CLIENTE, COD_VENDEDOR, DAT_INICIO, DAT_TERMINO) VALUES (1, 1, DATE '2023-01-01', NULL);
INSERT INTO cliente_vendedor (COD_CLIENTE, COD_VENDEDOR, DAT_INICIO, DAT_TERMINO) VALUES (2, 2, DATE '2023-01-01', NULL);
INSERT INTO cliente_vendedor (COD_CLIENTE, COD_VENDEDOR, DAT_INICIO, DAT_TERMINO) VALUES (3, 3, DATE '2023-01-01', NULL);

SELECT * FROM cliente_vendedor;


-- EXERCÍCIOS
/*
Exercício 01
crie um bloco anônimo que calcula o total de movimentações de estoque  para um
determinado produto
*/

declare 
    v_produto_id number;
    v_total_movimentacoes number;
begin
    v_produto_id := 1;
    select count(*)
    into v_total_movimentacoes
    from movimento_estoque
    where cod_produto = v_produto_id;
    
    dbms_output.put_line('Total de movimentações para o produto ' ||v_produto_id || ': ' || v_total_movimentacoes);
end;

/*
Exercício 02
Utilizando for crie um bloco anônimo que calcula a média de valores totais de 
pedidos para um cliente específico
*/
DECLARE
    v_cod_cliente NUMBER := 1; 
    v_soma_pedidos NUMBER := 0;
    v_qtd_pedidos NUMBER := 0;
    v_media_pedidos NUMBER;
BEGIN 
    FOR pedido_rec IN (SELECT VAL_TOTAL_PEDIDO FROM historico_pedido WHERE COD_CLIENTE = v_cod_cliente) LOOP
        v_soma_pedidos := v_soma_pedidos + pedido_rec.VAL_TOTAL_PEDIDO;
        v_qtd_pedidos := v_qtd_pedidos + 1;
    END LOOP;

    IF v_qtd_pedidos > 0 THEN
        v_media_pedidos := v_soma_pedidos / v_qtd_pedidos;
        DBMS_OUTPUT.PUT_LINE('Média de valores de pedidos para o cliente ' || v_cod_cliente || ': ' || v_media_pedidos);
    ELSE
        DBMS_OUTPUT.PUT_LINE('O cliente ' || v_cod_cliente || ' não possui pedidos.');
    END IF;
END;


/*
EXERCÍCIO 03
Crie um bloco anônimo que exiba os produtos compostos ativos
*/
BEGIN
  FOR prod_comp IN (SELECT COD_PRODUTO, COD_PRODUTO_RELACIONADO FROM PRODUTO_COMPOSTO WHERE STA_ATIVO = 'A') LOOP
    DBMS_OUTPUT.PUT_LINE('COD_PRODUTO: ' || prod_comp.COD_PRODUTO || ', COD_PRODUTO_RELACIONADO: ' || prod_comp.COD_PRODUTO_RELACIONADO);
  END LOOP;
END;


/*
EXERCÍCIOS 04
Crie um bloco anônimo para calcular o total de movimentações de estoque para
um determinado prooduto usando INNER JOIN com a tabela de tipo_movimento_estoque
*/

DECLARE
    v_cod_produto NUMBER(10) := 3;
    v_total_movimentacoes NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_total_movimentacoes
    FROM movimento_estoque me
    INNER JOIN tipo_movimento_estoque tme ON me.COD_TIPO_MOVIMENTO_ESTOQUE = tme.COD_TIPO_MOVIMENTO_ESTOQUE
    WHERE me.COD_PRODUTO = v_cod_produto;
    
    DBMS_OUTPUT.PUT_LINE('O total de movimentações para o produto ' || v_cod_produto || ' é: ' || v_total_movimentacoes);
END;




/*
EXERCÍCIO 05
Crie um bloco anônimo para exibir os produtos compostos e, se houver, suas 
informações de estoque usando LEFT JOIN, com a tabela estoque_produto
*/
BEGIN
  DBMS_OUTPUT.PUT_LINE('Produtos Compostos e Estoque:');
  FOR prod_comp IN (
    SELECT 
      pc.COD_PRODUTO, 
      pc.COD_PRODUTO_RELACIONADO,
      p.NOM_PRODUTO,
      p.COD_BARRA,
      NVL(TO_CHAR(ep.COD_ESTOQUE), 'Não encontrado') AS COD_ESTOQUE,
      NVL(TO_CHAR(ep.DAT_ESTOQUE, 'DD/MM/YYYY'), 'Não encontrado') AS DAT_ESTOQUE,
      NVL(TO_CHAR(ep.QTD_PRODUTO), 'Não encontrado') AS QTD_PRODUTO
    FROM 
      PRODUTO_COMPOSTO pc
    JOIN 
      PRODUTO p ON pc.COD_PRODUTO = p.COD_PRODUTO
    LEFT JOIN 
      ESTOQUE_PRODUTO ep ON pc.COD_PRODUTO = ep.COD_PRODUTO
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('COD_PRODUTO: ' || prod_comp.COD_PRODUTO || 
                        ', COD_PRODUTO_RELACIONADO: ' || prod_comp.COD_PRODUTO_RELACIONADO ||
                        ', NOM_PRODUTO: ' || prod_comp.NOM_PRODUTO ||
                        ', COD_BARRA: ' || prod_comp.COD_BARRA ||
                        ', COD_ESTOQUE: ' || prod_comp.COD_ESTOQUE ||
                        ', DAT_ESTOQUE: ' || prod_comp.DAT_ESTOQUE ||
                        ', QTD_PRODUTO: ' || prod_comp.QTD_PRODUTO);
  END LOOP;
END;





/*
EXERCÍCIO 06
crie um bloco que exiba as informações de pedidos e, se houver, as informações 
dos clientes relacionados usando RIGTH JOIB com a tabela cliente
*/


DECLARE
    v_cod_pedido NUMBER(10) := 1; 

    CURSOR pedido_cursor IS 
        SELECT p.COD_PEDIDO, p.DAT_PEDIDO, p.VAL_TOTAL_PEDIDO, c.NOM_CLIENTE, c.NUM_CPF_CNPJ
        FROM pedido p
        RIGHT JOIN cliente c ON p.COD_CLIENTE = c.COD_CLIENTE
        WHERE p.COD_PEDIDO = v_cod_pedido;

    v_pedido_row pedido_cursor%ROWTYPE;
BEGIN
    OPEN pedido_cursor;

    LOOP
        FETCH pedido_cursor INTO v_pedido_row;

        EXIT WHEN pedido_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Informações do Pedido:');
        DBMS_OUTPUT.PUT_LINE('Código do Pedido: ' || v_pedido_row.COD_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('Data do Pedido: ' || v_pedido_row.DAT_PEDIDO);
        DBMS_OUTPUT.PUT_LINE('Valor Total: ' || v_pedido_row.VAL_TOTAL_PEDIDO);

        IF v_pedido_row.NOM_CLIENTE IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Informações do Cliente:');
            DBMS_OUTPUT.PUT_LINE('Nome: ' || v_pedido_row.NOM_CLIENTE);
            DBMS_OUTPUT.PUT_LINE('CPF/CNPJ: ' || v_pedido_row.NUM_CPF_CNPJ);
        ELSE
            DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Cliente não encontrado para este pedido.');
        END IF;

        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    END LOOP;

    CLOSE pedido_cursor;
END;

/*
EXERCÍCIOS 07
Crie um bloco que calcule a média de valores totais de pedidos para um cliente
específico e exiba as informações do cliente usando INNER JOIN com a tabela cliente
*/

DECLARE
    v_cod_cliente NUMBER(10) := 1;
    v_media_pedidos NUMBER(12,2);
    v_nome_cliente VARCHAR2(50);
    v_cpf_cnpj NUMBER(15);
BEGIN
    SELECT AVG(p.VAL_TOTAL_PEDIDO), c.NOM_CLIENTE, c.NUM_CPF_CNPJ
    INTO v_media_pedidos, v_nome_cliente, v_cpf_cnpj
    FROM pedido p
    INNER JOIN cliente c ON p.COD_CLIENTE = c.COD_CLIENTE
    WHERE c.COD_CLIENTE = v_cod_cliente
    GROUP BY c.NOM_CLIENTE, c.NUM_CPF_CNPJ; 

    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Informações do Cliente:');
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome_cliente);
    DBMS_OUTPUT.PUT_LINE('CPF/CNPJ: ' || v_cpf_cnpj);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Média de Valores de Pedidos: ' || v_media_pedidos);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
END;