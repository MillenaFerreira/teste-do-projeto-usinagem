use db_projeto_usinagem_teste_inserts;

insert into tbL_status_usuario(nivel)values('Administrador'), ('Aluno'), ('Professor');
select * from tbL_status_usuario;

insert into tbl_usuario(email,senha,id_status_usuario) values ('root','123456',1);
insert into tbl_usuario(email,senha,id_status_usuario) values ('aluno1@senai.teste.com', '12345678', 2);
insert into tbl_usuario(email,senha,id_status_usuario) values ('aluno2@senai.teste.com', '12345678', 2);
insert into tbl_usuario(email,senha,id_status_usuario) values ('aluno3@senai.teste.com', '12345678', 2);
insert into tbl_usuario(email,senha,id_status_usuario) values ('aluno4@senai.teste.com', '12345678', 2);
insert into tbl_usuario(email,senha,id_status_usuario) values ('professor1@senai.teste.com', '12345678', 3);
insert into tbl_usuario(email,senha,id_status_usuario) values ('professor2@senai.teste.com', '12345678', 3);
select * from tbl_usuario;
select * from tbl_materia;

select usuario.id, usuario.email, usuario.senha, status.nivel from tbl_usuario as usuario inner join tbl_status_usuario as status on usuario.id_status_usuario = status.id order by id asc;
select usuario.id, usuario.email, usuario.senha, status.nivel from tbl_usuario as usuario inner join tbl_status_usuario as status on usuario.id_status_usuario = status.id where usuario.id = 1;
select usuario.id, usuario.email, usuario.senha, status.nivel from tbl_usuario as usuario inner join tbl_status_usuario as status on usuario.id_status_usuario = status.id where usuario.email = 'root' and usuario.senha = '123456';
select usuario.id, usuario.email, usuario.senha, status.nivel from tbl_usuario as usuario inner join tbl_status_usuario as status on usuario.id_status_usuario = status.id where status.nivel = 'Aluno';

insert into tbl_professor(nome, nif, telefone, email, id_usuario) values ('Marcel Teixeira', '1234567', '11940028922', 'marcelteste@gmail.com', 4);
insert into tbl_professor(nome, nif, telefone, email, id_usuario) values ('Fernando Leonid', '7654321', '11989224002', 'leonidteste@gmail.com', 5);
select * from tbl_professor;
select professor.id, professor.nome, professor.nif, professor.telefone, professor.email as email_pessoal, usuario.email as email_institucional, usuario.senha, status.nivel from 
tbl_professor as professor inner join tbl_usuario as usuario on usuario.id = professor.id_usuario inner join tbl_status_usuario as status on usuario.id_status_usuario = status.id;

insert into tbl_curso(nome, carga_horaria, descricao, sigla, foto)
values 
('Desenvolvimento de Sistemas', 1600, 'Aprende a programar', 'DS', 'https://images7.memedroid.com/images/UPLOADED980/5ed0854c7421f.jpeg'),
('Bolinha1', '1500', 'Aprende bolinha', 'BL', 'https://img.freepik.com/vetores-premium/bola-azul-ilustracao_177761-152.jpg'),
('Homem Araha', '1200', 'Aprende teia e piada', 'HA','https://cdn.dicionariopopular.com/imagens/homem-aranha-meme-apontando-2.jpg'),
('Batman', '20000', 'Aprende a ficar rico', 'BAT', 'https://i.pinimg.com/736x/6b/fd/ff/6bfdff0e8ddd4526c97f0ca38fb0b297.jpg'),
('Desenvolvimento de Sistemas', 1600, 'Aprende a programar', 'DS', 'https://images7.memedroid.com/images/UPLOADED980/5ed0854c7421f.jpeg'),
('Bolinha2','1500', 'Aprende bolinha', 'BL', 'https://img.freepik.com/vetores-premium/bola-azul-ilustracao_177761-152.jpg');

insert into tbl_semestre(numero) values (1);
insert into tbl_semestre(numero) values (2);
insert into tbl_semestre(numero) values (3);

select * from tbl_semestre;

insert into tbl_materia(nome, carga_horaria, descricao, sigla, id_curso)values('Programação Web FrontEnd', 120, 'Aprender a programar front', 'PWFE', 1);
insert into tbl_materia(nome, carga_horaria, descricao, sigla, id_curso)values('Programação Web BackEnd', 120, 'Aprender a programar back', 'PWBE', 1);

select * from tbl_materia;
insert into tbl_materia_semestre(id_materia, id_semestre) values (1, 1);
select materia.nome, materia.carga_horaria, materia.descricao, materia.sigla, curso.nome as nome_curso, curso.sigla as sigla_curso, semestre.numero as numero_semestre from
tbl_materia as materia inner join tbl_curso as curso on materia.id_curso = curso.id inner join tbl_materia_semestre on tbl_materia_semestre.id_materia = materia.id
inner join tbl_semestre as semestre on semestre.id = tbl_materia_semestre.id_semestre;

select * from tbl_usuario;

desc tbl_curso;
select * from tbl_curso;
update tbl_usuario 
set email = 'testeUpdate',
	senha = 'senhaUpdate',
    id_status_usuario = 2
    where id = 3;


update tbl_status_usuario
set nivel = 'adm' where id = 1;


desc tbl_curso;

alter table tbl_curso
    change carga_horaria carga_horaria varchar(10) not null;

alter table tbl_curso
    change foto foto varchar(2000) not null;
    
desc tbl_curso;    
show tables;
