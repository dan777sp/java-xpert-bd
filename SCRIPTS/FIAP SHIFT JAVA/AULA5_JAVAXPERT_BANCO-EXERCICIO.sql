-- AULA 5 - EXERCICIO

SELECT
	*
FROM
	EMPLOYEES;

-- EX1
SELECT
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM
	EMPLOYEES;

-- EX2
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY,
	SALARY + (SALARY * 0.05) AS AUMENTO_5,
	SALARY + (SALARY * 0.08) AS AUMENTO_8
FROM
	EMPLOYEES;

-- EX 3 - SELECIONAR TODOS OS NOMES DA TABELA CONTRIES QUE CONTENHAM A LETRA I 
SELECT
	COUNTRY_NAME
FROM
	COUNTRIES
WHERE
	UPPER(COUNTRY_NAME) LIKE UPPER('%i%');
	
-- PARTE 2 - SELECCAO COM CONDICOES
-- EX 1 - SELECIONAR NOME E SOBRENOME DOS FUNCIONARIOS DO DEPARTAMENTO COM ID = 90
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 90;

-- EX 2 - SELECIONAR TUDO DA TABELA DE JOBS ONDE O SALARIO MAXIMO ESTEJA ENTRE 5000 E 10000
SELECT * FROM JOBS WHERE MAX_SALARY BETWEEN 5000 AND 10000;

-- EX 3 - SELECIONAR TUDO DE TODOS OS FUNCIONARIOS QUE POSSUEM SALARIO MAIOR OU IGUAL A 4000
SELECT * FROM EMPLOYEES WHERE SALARY >= 4000;

-- EX 4 - SELECIONAR PRIMEIRO NOME E ANO DE CONTRATACAO DE TODOS OS FUNCIONARIOS NOS QUAIS O ANO DE CONTRATAÇÃO SEJA MAIOR OU IGUAL A 1995
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(HIRE_DATE, 'YYYY') FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') >= 1995;
SELECT FIRST_NAME, LAST_NAME, EXTRACT (YEAR FROM HIRE_DATE) FROM EMPLOYEES WHERE EXTRACT (YEAR FROM HIRE_DATE) >= 1995;


-- DISTINCT
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES ORDER BY 1;

-- UNIQUE
SELECT UNIQUE DEPARTMENT_ID FROM EMPLOYEES ORDER BY 1;

-- TO_CHAR E TO_DATE
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 1995;

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE TO_DATE(HIRE_DATE, 'DD-MM-YYYY') BETWEEN '01-01-1995' AND '31-12-1999';