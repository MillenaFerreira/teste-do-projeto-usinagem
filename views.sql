# Permite criar a view no banco de dados
# tabela virtual, ou seja, ela não possui linhas e colunas fisicas  etbm não tem atributos
# é considerada uma tabela
# vw = view
# view não pode ser utilizada em insert, update e delete é somente no select que ela funciona


# é importante lembrar de executar o select fora da view primeiro para saber se é o que realmente deseja

# create view - cria uma view 
# vwUsinagem - nome da view
# as - representada por esse script
create view vwUsinagem as
	select materia.nome, materia.carga_horaria, materia.descricao, materia.sigla, curso.nome as nome_curso, curso.sigla as sigla_curso, semestre.numero as numero_semestre from
tbl_materia as materia inner join tbl_curso as curso on materia.id_curso = curso.id inner join tbl_materia_semestre on tbl_materia_semestre.id_materia = materia.id
inner join tbl_semestre as semestre on semestre.id = tbl_materia_semestre.id_semestre;

# Para visualizar as tabelas e views existentes no BD
show tables;

# Executar uma view
select * from vwUsinagem;

# Permite alterar a view no BD
alter view vwUsinagem as 
	select materia.nome, materia.carga_horaria, materia.descricao, materia.sigla, curso.nome as nome_curso, curso.sigla as sigla_curso, semestre.numero as numero_semestre from
tbl_materia as materia inner join tbl_curso as curso on materia.id_curso = curso.id inner join tbl_materia_semestre on tbl_materia_semestre.id_materia = materia.id
inner join tbl_semestre as semestre on semestre.id = tbl_materia_semestre.id_semestre order by materia.nome;

# Permite deletar a view no BD
drop view vwUsinagem;