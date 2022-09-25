/* Recuperações simples com SELECT Statement */
/*Listar todos Clientes*/
SELECT 
	*
FROM 
	`Cliente`;

/*Filtros com WHERE Statement*/
/*Listar todos Clientes com filtro de casa*/
SELECT 
	*
FROM 
	`Cliente`
WHERE
	Nome LIKE '%Silva';

/*Crie expressões para gerar atributos derivados*/
/*Listar todos Clientes e carros*/
SELECT 
	Nome,
	Telefone,
	Modelo,
	Placa
FROM 
	Cliente AS c, 
	Carro As cr
WHERE 
	c.`idCliente`=cr.idCliente;

/*Defina ordenações dos dados com ORDER BY*/
/*Listar todos Clientes, carros e lista por order alfabetica*/
SELECT 
	Nome,
	Telefone,
	Modelo,
	Placa
FROM 
	Cliente AS c, 
	Carro As cr
WHERE 
	c.`idCliente`=cr.idCliente
ORDER BY 
	Nome 
ASC ;

/*Condições de filtros aos grupos – HAVING Statement*/
/*Total de carros por Modelo e listar o que tiver mais que 1*/
SELECT 
	COUNT(*) AS total,
	Modelo
FROM 
	Cliente AS c, 
	Carro As cr
WHERE 
	c.idCliente=cr.idCliente
GROUP BY 
	Modelo 
HAVING 
	total > 1;

/*Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados*/
/*Listar Nome, Telefone, Modelo, Placa, Status OS*/
SELECT 
	Nome,
	Telefone,
	Modelo,
	Placa,
	Status
FROM 
	Cliente AS a
INNER JOIN
	Carro AS b
ON 
	b.idCliente=a.idCliente
INNER JOIN
	OS AS c
ON 
	c.idEquipe=b.idEquipe
INNER JOIN
	Autorização AS d
ON 
	d.idAutorização=c.idAutorização
ORDER BY 
	Nome 
ASC ;

