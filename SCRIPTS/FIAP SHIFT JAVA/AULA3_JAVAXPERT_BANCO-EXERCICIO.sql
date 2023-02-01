-- EXERCICIOS AULA 3

--EX 1
ALTER TABLE ITEM_PRODUTO
ADD TIPO_MEDIDA VARCHAR2(30);

--EX 2
ALTER TABLE ITEM_PRODUTO
ADD CONSTRAINT CK_ITEM_PRODUTO CHECK (TIPO_MEDIDA IN ('LITRO', 'KILO', 'UNIDADE'));

--EX 3
ALTER TABLE ITEM_PRODUTO
DROP CONSTRAINT UK_MATERIA_PRIMA;

--EX 4
SELECT
	TABLE_NAME,
	CONSTRAINT_TYPE,
	CONSTRAINT_NAME,
	SEARCH_CONDITION
FROM
	USER_CONSTRAINTS
WHERE
	TABLE_NAME IN ('CATEGORIA', 'PRODUTO', 'ITEM_PRODUTO', 'MATERIA_PRIMA')
ORDER BY
	1,
	2,
	3;
	
-- PARTE 2
-- EX 1
-- CRIAR A SEQUENCIA
CREATE SEQUENCE SEQ_CATEGORIA;

-- EX 2
-- POPULANDO A TABELA
INSERT INTO CATEGORIA VALUES (10, 'DOCE');

INSERT INTO CATEGORIA VALUES (SEQ_CATEGORIA.NEXTVAL, 'BEBIDA');

INSERT INTO CATEGORIA VALUES (SEQ_CATEGORIA.NEXTVAL, 'CONGELADO');

SELECT * FROM CATEGORIA;