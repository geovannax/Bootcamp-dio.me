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
	`idCliente Tipo`='1';

/*Crie expressões para gerar atributos derivados*/
/*Listar todos Clientes com endereço*/
SELECT 
	*
FROM 
	Cliente, 
	`Cliente Endereço` 
WHERE 
	`idCliente Endereço`=idCliente;

/*Defina ordenações dos dados com ORDER BY*/
/*Listar todos Clientes com endereço e lista por order alfabetica*/
SELECT 
	* 
FROM 
	Cliente,
	`Cliente Endereço` 
WHERE 
	`idCliente Endereço`=idCliente 
ORDER BY 
	Nome 
DESC;

/*Condições de filtros aos grupos – HAVING Statement*/
/*Listar o Total de clientes por tipo PF/PJ e listar o que tiver mais que 1*/
SELECT 
	COUNT(*) AS total, 
	`idCliente Tipo` 
FROM 
	`Cliente` 
GROUP BY 
	`idCliente Tipo` 
HAVING 
	total > 1;

/*Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados*/
/*Listar Nome, Tipo PF/PJ, CEP, Nº, Tipo Endereço*/
SELECT 
	a.Nome,
	c.Tipo,
	b.CEP,
	b.Número,
	d.Tipo AS "Tipo Endereço"
FROM 
	Cliente AS a
INNER JOIN
	`Cliente Endereço` AS b
ON
	b.`idCliente Endereço`=a.idCliente 
INNER JOIN
	`Cliente Tipo` AS c
ON
	c.`idCliente Tipo`=a.`idCliente Tipo`
LEFT JOIN
	`Tipo Endereço` AS d
ON
	d.`idTipo Endereço`=b.`idCliente Endereço`
ORDER BY 
	a.Nome 
DESC;

