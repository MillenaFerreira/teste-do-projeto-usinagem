#Stored Procedures - Procedimento armazenado
# implementa estrutura de lógica
# proc - procedure
#
#
#

# Definir um delimitador
# Permite definir um delimitador de termino da procedore
DELIMITER $$
#Permite criar uma procedure
### na passagem de parametros existem 3 tipos de parametros (IN, OUT, INOUT)
## IN 		-  significa que a procedure recebe um parametro de entrada (tem que receber um paramentro)
## OUT 		-  significa que a procedure devolve um parametro de saida 	(ela vai devolver um parametro)
## INOUT 	-  significa que a procedure devolve um parametro de saida 	()
## obrigatorio selecionar o delimiter
create procedure procUsinagem (IN idMateria int)
#BEGIN - abertura de chaves (start)
#END - fechada da chave (end)
BEGIN 
	select materia.nome, materia.carga_horaria, materia.descricao, materia.sigla, curso.nome as nome_curso, 
			curso.sigla as sigla_curso, semestre.numero as numero_semestre 
    from
	tbl_materia as materia 
		inner join tbl_curso as curso 
			on materia.id_curso = curso.id 
		inner join tbl_materia_semestre 
			on tbl_materia_semestre.id_materia = materia.id
		inner join tbl_semestre as semestre 
			on semestre.id = tbl_materia_semestre.id_semestre;
	#where materia.id = idMateria;

END $$

#Listar todas as procedures do BD
show procedure status;

# Executa uma procedure no BD
call procUsinagem(1);
