-- AULA 08

-- FUNCOES E AGRUPAMENTO

-- AVG (MEDIA)
SELECT ROUND(AVG(SALARY), 2) FUNG_AVG FROM EMPLOYEES;

-- TRAZER MEDIA SALARIAL DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	ROUND(AVG(E.SALARY), 2) AS MEDIAL_SALARIAL
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- COUNT - TRAZER QUANTIDADE DE FUNCIONARIOS DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	COUNT (E.EMPLOYEE_ID) AS QUANTIDADE_FUNCIONARIOS
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- MAX - MAIOR VALOR
SELECT
	MAX(SALARY) MAIOR_SALARIO
FROM EMPLOYEES;

-- QUAL O MAIOR SALARIO DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	MAX(E.SALARY) AS MAIOR_SALARIO
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- MIN - MENOR VALOR
SELECT
	MIN(SALARY) MENOR_SALARIO
FROM EMPLOYEES;

-- QUAL O MENOR SALARIO DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	MIN(E.SALARY) AS MENOR_SALARIO
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- SUM - SOMA OS VALORES
SELECT
	SUM(SALARY) SOMA_SALARIOS
FROM EMPLOYEES;

-- QUAL A SOMA DOS SALARIOS DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	SUM(E.SALARY) AS SOMA_SALARIOS
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- STDDEV - DESVIO PADRAO
SELECT
	STDDEV(SALARY) SOMA_SALARIOS
FROM EMPLOYEES;

-- TRAZER O DESVIO PADRAO DOS SALARIOS DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	ROUND(STDDEV(E.SALARY), 2) AS DESVIO_PADRAO
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;


-- VARIANCE - VARIANCIA
SELECT
	ROUND(VARIANCE(SALARY), 2) AS VARIANCIA
FROM EMPLOYEES;

-- TRAZER A VARIANCIA DOS SALARIOS DE CADA DEPARTAMENTO
SELECT
	D.DEPARTMENT_NAME,
	ROUND(VARIANCE(E.SALARY), 2) AS VARIANCIA
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 2;

-- TRAZER TODOS OS DE CIMA
SELECT
	D.DEPARTMENT_NAME,
	MAX(E.SALARY) AS MAIOR_SALARIO,
	MIN(E.SALARY) AS MENOR_SALARIO,
	ROUND(AVG(E.SALARY), 2) AS MEDIAL_SALARIAL,
	COUNT (E.EMPLOYEE_ID) AS QUANTIDADE_FUNCIONARIOS,
	SUM(E.SALARY) AS SOMA_SALARIOS,
	ROUND(STDDEV(E.SALARY), 2) AS DESVIO_PADRAO,
	ROUND(VARIANCE(E.SALARY), 2) AS VARIANCIA
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
ORDER BY 1;

-- CLAUSULA HAVING
SELECT
	D.DEPARTMENT_NAME,
	COUNT(E.EMPLOYEE_ID) QTD_FUNC
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT (E.EMPLOYEE_ID) >= 2
ORDER BY 2;

-- CASE
SELECT
	FIRST_NAME,
	CASE
		WHEN COMMISSION_PCT IS NULL THEN 'NÃO É VENDEDOR'
		ELSE 'VENDEDOR'
	END STATUS_COMISSAO
FROM EMPLOYEES;

-- EXERCICIOS AULA 08

-- EX 01 - TRAZER A QUANTIDADE DE FUNCIONÁRIOS ATIVOS
SELECT
	COUNT (*) AS QTD_FUNC
FROM
	EMPLOYEES;

-- EX 02 - TRAZER A QUANTIDADE DE FUNCIONÁRIOS ATIVOS POR NOME DE DEPARTAMENTO.
SELECT
	D.DEPARTMENT_NAME,
	COUNT(E.EMPLOYEE_ID) AS QTD_FUNC
FROM
	EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON
	E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY
	D.DEPARTMENT_NAME
ORDER BY
	2;

-- EX 03 - TRAZER A QUANTIDADE DE FUNCIONARIOS POR DEPARTAMENTO APENAS DO DEPARTAMENTO 50 EM DIANTE
SELECT
D.DEPARTMENT_ID,
D.DEPARTMENT_NAME,
COUNT(*) AS QTD_FUNC
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID >= 50
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
ORDER BY 1;

-- EX 04 - TRAZER A QUANTIDADE DE FUNCIONARIOS SUBORDINADOS A CADA GESTOR
SELECT
	E.MANAGER_ID,
	E2.FIRST_NAME,
	COUNT(E.EMPLOYEE_ID) AS QTD_FUNC_SUBORDINADOS
FROM EMPLOYEES E
INNER JOIN EMPLOYEES E2
ON E.MANAGER_ID = E2.EMPLOYEE_ID
GROUP BY E.MANAGER_ID, E2.FIRST_NAME
ORDER BY 1;

SELECT * FROM EMPLOYEES ;