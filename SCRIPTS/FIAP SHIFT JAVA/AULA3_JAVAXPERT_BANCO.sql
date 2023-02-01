/* AULA 3 - EXEMPLOS*/

-- USER_CONSTRAINTS

SELECT 
    CONSTRAINT_NAME,
    TABLE_NAME,
    CONSTRAINT_TYPE,
    SEARCH_CONDITION
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'ITEM_PRODUTO';
   
-- SELECIONA TODOS AS COLUNAS DA TABELA USER_CONSTRAINTS    
SELECT * FROM USER_CONSTRAINTS;

-- ADICIONANDO COLUNAS COM ALTER

DROP TABLE ALUNOS CASCADE CONSTRAINTS;
DROP TABLE FILIACOES CASCADE CONSTRAINTS;

-- CRIAR TABELA ALUNOS
CREATE TABLE ALUNOS (
    RM NUMBER(5),
    NOME VARCHAR2(25) CONSTRAINT NN_ALUNOS_NOME NOT NULL,
    SOBRENOME VARCHAR2(25) CONSTRAINT NN_ALUNOS_SOBRENOME NOT NULL
    );
   
-- ADICIONANDO APENAS 1 COLUNA    
ALTER TABLE ALUNOS
    ADD DT_NASCIMENTO DATE;

-- ADICIONANDO VARIAS COLUNAS DE UMA SO VEZ
ALTER TABLE ALUNOS
    ADD (
        GENERO CHAR(1) CONSTRAINT NN_ALUNOS_GENERO NOT NULL,
        COD_FILIACAO NUMBER(5)
        );

-- REMOVENDO UMA COLUNA DE CADA VEZ
ALTER TABLE ALUNOS
    DROP COLUMN DT_NASCIMENTO;
    
-- ADICIONANDO CONSTRAINT NOMEADA - PRIMARY KEY
ALTER TABLE ALUNOS
    ADD CONSTRAINT PK_ALUNOS PRIMARY KEY (RM);
    
-- CRIA TABELA FILIACOES COM PK NIVEL COLUNA
CREATE TABLE FILIACOES (
    COD_FILIACAO NUMBER(5) CONSTRAINT PK_FILIACOES PRIMARY KEY,
    NOME_MAE VARCHAR2(100),
    NOME_PAI VARCHAR2(100)
    );
    
-- ALTERA A TABELA ALUNOS E INSERE UMA FK
ALTER TABLE ALUNOS
    ADD
    CONSTRAINT FK_ALUNOS_FILIACOES 
    FOREIGN KEY (COD_FILIACAO)
    REFERENCES FILIACOES;
    
-- REMOVENDO UMA CONSTRAINT
ALTER TABLE ALUNOS
    DROP CONSTRAINT NN_ALUNOS_NOME;
    
-- REMOVENDO CONSTRAINTS EM MASSA
ALTER TABLE ALUNOS
    DROP CONSTRAINT NN_ALUNOS_GENERO
    DROP CONSTRAINT NN_ALUNOS_SOBRENOME;

-- DESABILITANDO UMA CONSTRAINT
ALTER TABLE ALUNOS
    DISABLE CONSTRAINT FK_ALUNOS_FILIACOES;
    
-- HABILITANDO UMA CONSTRAINT
ALTER TABLE ALUNOS
    ENABLE CONSTRAINT FK_ALUNOS_FILIACOES;
    
-- ALTER COM MODIFY
-- O COMANDO DESCRIBE EXIBE A ESTRUTURA DA TABELA
DESCRIBE ALUNOS;

-- MODIFICAR O TAMANHO DE UMA COLUNA
ALTER TABLE ALUNOS
    MODIFY NOME VARCHAR2(50);

--VERIFICAR SE A ALTERA��O FOI REALIZADA
DESC ALUNOS;

-- MODIFICANDO O TAMANHO DE VARIAS COLUNAS
ALTER TABLE ALUNOS
    MODIFY NOME VARCHAR2(100)
    MODIFY SOBRENOME VARCHAR2(100);

-- COMANDO DROP TABLE

DROP TABLE FILIACOES;
DROP TABLE FILIACOES CASCADE CONSTRAINTS;

--  ME ARREPENDI DE TER EXCLUIDO COM DROP
-- USAR O COMANDO FLASHBACK PARA REVERTER 

FLASHBACK TABLE FILIACOES TO BEFORE DROP;

/* QUANDO REVERTEMOS A EXCLUSAO DE UMA TABELA, AS CONSTRAINTS DA TABELA FILHA
S�O EXCLUIDAS E DEVEM SER REFEITAS
*/

DESC FILIACOES;

SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'ALUNOS';

-- ADICIONANDO NOVAMENTE A FOREIGN KEY EM ALUNOS

ALTER TABLE ALUNOS
    ADD
        CONSTRAINT FK_ALUNOS_FILIACOES
        FOREIGN KEY (COD_FILIACAO)
        REFERENCES FILIACOES;
        
-- DROPA DEFINITIVAMENTE A TABELA 
DROP TABLE FILIACOES PURGE;
DROP TABLE FILIACOES CASCADE CONSTRAINTS PURGE;

-- LIMPANDO A LIXEIRA COMPLETAMENTE ****CUIDADO****

PURGE RECYCLEBIN;

-- COMANDO ALTER E RENAME
--RENOMEANDO A TABELA ALUNOS
ALTER TABLE ALUNOS
    RENAME TO ALUNOS_SHIFT;
    
SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'ALUNOS_SHIFT';  
    
-- TAMBEM CONSEGUIMOS ALTERAR APENAS COM O COMANDO RENAME
RENAME ALUNOS_SHIFT TO ALUNOS;

-- O TRUNCATE ELIMINA TODAS AS LINHAS DE UMA TABELA
drop table produtos purge;
    
    create table produtos
    (cod_produto number(5),
    nome varchar(100),
    valor number(7,2));

    begin
       for i in 1..10000 loop
           insert into produtos
           values (i,'Produto 1',10+1);
        end loop;
    end;
    /
-- MOSTRANDO QUANTAS LINHAS ESSA TABELA TEM
SELECT COUNT(*) FROM PRODUTOS;

--ESVAZIA A TABELA
TRUNCATE TABLE PRODUTOS;

--CRIANDO UMA SEQUENCE
CREATE TABLE CLIENTE (
	CODIGO NUMBER (3) PRIMARY KEY,
	NOME VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE SEQ_CLIENTE;

INSERT INTO CLIENTE (CODIGO, NOME)
VALUES (SEQ_CLIENTE.NEXTVAL, 'DANILO');
INSERT INTO CLIENTE (CODIGO, NOME)
VALUES (SEQ_CLIENTE.NEXTVAL, 'NATY');

SELECT * FROM CLIENTE;




