create database db_projeto_usinagem_teste_inserts;

use db_projeto_usinagem_teste_inserts;


show tables;

# TBL_MATERIA
create table tbl_materia(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    carga_horaria int not null,
    sigla varchar(5) not null,
    descricao varchar(500) not null
);

# TBL_CURSO
create table tbl_curso (
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    carga_horaria int not null,
    descricao varchar(500) not null,
    sigla varchar(5) not null,
    foto varchar(2000) not null
);

# TBL_ALUNO
create table tbl_aluno(
	id int not null auto_increment primary key,
    nome varchar(50) not null,
    cpf varchar(15),
    data_nascimento date,
    email varchar(255) not null
);

# TBL_STATUS_MATRICULA
create table tbl_status_matricula(
	id int not null auto_increment primary key,
    nome varchar(50) not null
);

# TBL_STATUS_USUARIO
create table tbl_status_usuario(
	id int not null auto_increment primary key,
    nivel varchar(20) not null
);

# TBL_TIPO_TAREFA
create table tbl_tipo_tarefa(
	id int not null auto_increment primary key,
    nome varchar(45) not null
);

# TBL_TURMA
create table tbl_turma (
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    data_inicio date not null,
    data_conclusao date not null,
    descricao varchar(300) not null,
    semestre int not null,
    id_curso int not null,
    
    constraint FK_Curso_Turma
    foreign key (id_curso)
    references tbl_curso(id),

    unique index (id)
);

# TBL_USUARIO
create table tbl_usuario(
	id int not null auto_increment primary key,
    email varchar(255) not null,
    senha varchar(150) not null,
    id_status_usuario int not null,
    
    constraint FK_Status_Usuario_Usuario
    foreign key (id_status_usuario)
    references tbl_status_usuario(id),
    
    unique index (id)
);

# TBL_PROFESSOR
create table tbl_professor(
	id int not null auto_increment primary key,
    nome varchar(50) not null,
    nif varchar(15) not null,
    telefone varchar(45) not null,
    email varchar(255) not null,
    id_usuario int not null,
    
    constraint FK_Usuario_Professor
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index (id)
);

# TBL_CURSO_MATERIA
create table tbl_curso_materia(
	id int not null auto_increment primary key,
    id_materia int not null,
    id_curso int not null,
    
    constraint FK_Curso_Materia_Materia
    foreign key (id_materia)
    references tbl_materia(id),
    
    constraint FK_Curso_Materia_Curso
    foreign key (id_curso)
    references tbl_curso(id),
    
    unique index (id)
);

# TBL_TAREFA
create table tbl_tarefa(
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    tempo_previsto time not null,
    numero float not null,
    foto_peca varchar(255) not null,
    id_tipo_tarefa int not null,
    id_curso_materia int not null,
    
    constraint FK_Tipo_Tarefa_Tarefa
    foreign key (id_tipo_tarefa)
    references tbl_tipo_tarefa(id),
    
    constraint FK_Tipo_Tarefa_Materia
    foreign key (id_curso_materia)
    references tbl_curso_materia(id),
    
    unique index (id)
);

# TBL_REGISTRO_TEMPO
create table tbl_registro_tempo(
	id int not null auto_increment primary key,
    data date not null,
    duracao_inicio time not null,
    duracao_termino time not null,
    desconto time not null,
    liquido time,
    tempo_geral time,
    id_tarefa int not null,
    id_matricula int not null,
    
    constraint FK_Tarefa_Registro_Tempo
    foreign key (id_tarefa)
    references tbl_tarefa(id),
    
    constraint FK_Matricula_Registro_Tempo
    foreign key (id_matricula)
    references tbl_matricula(id),
    
    unique index (id)
);
desc tbl_registro_tempo;

# TBL_CRITERIO
create table tbl_criterio(
	id int not null auto_increment primary key,
    descricao varchar(300) not null,
    observacao bit not null,
    tipo_critico bit not null,
    resultado_desejado varchar(15),
    id_tarefa int not null,
    
    constraint FK_Tarefa_Criterio
    foreign key (id_tarefa)
    references tbl_tarefa(id),
    
    unique index (id)
);

# TBL_MARGEM_ERRO
create table tbl_margem_erro(
	id int not null auto_increment primary key,
    minimo varchar(15),
    maximo varchar(15),
    id_criterio int not null,
    
    constraint FK_Criterio_Margem_Erro
    foreign key (id_criterio)
    references tbl_criterio(id),
    
    unique index (id)
);
desc tbl_margem_erro;

# TBL_AVALIACAO_ALUNO
create table tbl_avaliacao_aluno(
	id int not null auto_increment primary key,
    nota bit not null,
    valor_obtido varchar(10),
    id_criterio int not null,
    id_matricula int not null,
    
    constraint FK_Criterio_Avaliacao_Aluno
    foreign key (id_criterio)
    references tbl_criterio(id),
    
    constraint FK_Matricula_Avaliacao_Aluno
    foreign key (id_matricula)
    references tbl_matricula(id),
    
    unique index(id)
);

# TBL_AVALIAÇÃO_PROFESSOR
create table tbl_avaliacao_professor(
	id int not null auto_increment primary key,
    valor varchar(5) not null,
    id_professor int not null,
    id_avaliacao_aluno int not null,
    
    constraint FK_Professor_Avaliacao_Professor
    foreign key (id_professor)
    references tbl_professor(id),
    
    constraint FK_Avaliacao_Aluno_Avaliacao_Professor
    foreign key (id_avaliacao_aluno)
    references tbl_avaliacao_aluno(id),
    
    unique index(id)
);


#TBL_MATRICULA
create table tbl_matricula(
	id int not null primary key auto_increment,
	numero int not null,
    id_status_matricula int not null,
    id_aluno int not null,
    id_usuario int not null,
    
    constraint FK_Status_Matricula_Matricula
    foreign key (id_status_matricula)
    references tbl_status_matricula(id),
    
    constraint FK_Aluno_Matricula
    foreign key (id_aluno)
    references tbl_aluno(id),
    
    constraint FK_Usuario_Matricula
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index(id)
);

# TBL_TURMA_MATRICULA
create table tbl_turma_matricula(
	id int not null primary key auto_increment,
    id_matricula int not null,
    id_turma int not null,
    
    constraint FK_Matricula_Turma_Matricula
    foreign key (id_matricula)
    references tbl_matricula(id),
    
    constraint FK_Turma_Turma_Matricula
    foreign key (id_turma)
    references tbl_turma(id),
    
    unique index(id)
);

# TBL_TURMA_CURSO_MATERIA
create table tbl_turma_curso_materia(
	id int not null primary key auto_increment,
    id_turma int not null,
    id_curso_materia int not null,
    
    constraint FK_Turma_Turma_Curso_Materia
    foreign key (id_turma)
    references tbl_turma(id),
    
    constraint FK_Curso_Materia_Turma_Curso_Materia
    foreign key (id_curso_materia)
    references tbl_curso_materia(id),
    
    unique index(id)
);

# TBL_PROFESSOR_TURMA_MATERIA_CURSO
create table tbl_professor_turma_materia_curso(
	id int not null auto_increment primary key,
    id_professor int not null,
    id_turma_curso_materia int not null,
    
    constraint FK_Professor_Professor_Turma_Materia_Curso
    foreign key (id_professor)
    references tbl_professor(id),
    
    constraint FK_Turma_Curso_Materia_Professor_Turma_Materia_Curso
    foreign key (id_turma_curso_materia)
    references tbl_turma_curso_materia(id),
    
    unique index(id)
    
);

show tables;




alter table tbl_curso
	add column nome varchar(100) not null;

desc tbl_curso;

alter table tbl_curso
	change descricao descricao varchar(500) not null;

alter table tbl_status_usuario
	change nome nivel varchar(20) not null;

alter table tbl_aluno
	add column nome varchar(50) not null;


alter table tbl_registro_tempo
	change data data_inicio date not null;


alter table tbl_margem_erro
	change minimo minimo varchar(15);

alter table tbl_curso
	change foto foto varchar(2000) not null;

desc tbl_curso;























#TABELA: STATUS USUARIO
create table tbL_status_usuario(
	id int not null auto_increment primary key,
    nivel varchar(20) not null,
    unique index (id)
);

#TABELA: USUARIO
create table tbL_usuario(
	id int not null auto_increment primary key,
    email varchar(255) not null,
    senha varchar(150) not null,
    id_status_usuario int not null,
    
    constraint FK_StatusUsuario_Usuario
    foreign key (id_status_usuario) 
    references tbL_status_usuario (id),
    
    unique index (id)
);

#TABELA: PROFESSOR
create table tbl_professor(
	id int not null auto_increment primary key,
    nome varchar(50) not null,
    nif varchar(15) not null,
    telefone varchar(45),
    email varchar(255) not null,
    id_usuario int not null,
    
    constraint FK_Usuario_Professor
    foreign key (id_usuario)
    references tbl_usuario (id),
    
    unique index (id)
);

#TABELA: CURSO
create table tbl_curso(
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    carga_horaria int not null,
	descricao text not null,
    sigla varchar(5) not null,
    foto varchar(150) not null,
    
    unique index (id)
);

#TABELA: SEMESTRE 
create table tbl_semestre(
	id int not null auto_increment primary key,
    numero int not null,
    
    unique index (id)
);

#TABELA: MATERIA
create table tbl_materia(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    carga_horaria int not null,
    sigla varchar(5) not null,
    descricao text not null,
    id_curso int not null,
    
    constraint FK_Curso_Materia
    foreign key (id_curso)
    references tbl_curso(id),
    
    unique index(id)
);

#TABELA: MATERIA_SEMESTRE
create table tbl_materia_semestre(
	id int not null auto_increment primary key,
    id_materia int not null,
    id_semestre int not null,
    
    constraint FK_Materia_MateriaSemestre
    foreign key (id_materia)
    references tbl_materia(id),
    
    constraint FK_Semestre_MateriaSemestre
    foreign key (id_semestre)
    references tbl_semestre(id),
    
    unique index (id)
);

#TABELA: PROFESSOR_MATERIA
create table tbl_professor_materia(
	id int not null auto_increment primary key,
    id_materia int not null,
    id_professor int not null,
    
    constraint FK_Professor_MateriaProfessor
    foreign key (id_professor)
    references tbl_professor(id),
    
    constraint FK_Materia_MateriaProfessor
    foreign key (id_materia)
    references tbl_materia(id),
    
    unique index (id)
);

#TABELA: TURMA
create table tbl_turma(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    data_inicio date not null,
    data_conclusao date not null,
    descricao text not null,
    sigla varchar(8) not null,
    id_semestre int not null,
    id_curso int not null,
    
    constraint FK_Semestre_Turma
    foreign key (id_semestre)
    references tbl_semestre(id),
    
    constraint FK_Curso_Turma
    foreign key (id_curso)
    references tbl_curso(id),
    
    unique index (id)
);

#TABELA: ALUNO
create table tbl_aluno(
	id int not null auto_increment primary key,
    nome varchar(50) not null,
    matricula int,
    cpf varchar(15),
    data_nascimento date,
    email varchar(255) not null,
    id_usuario int not null, 
    id_turma int not null, 
    
    constraint FK_Usuario_Aluno
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    constraint FK_Turma_Aluno
    foreign key (id_turma)
    references tbl_turma(id),
    
    unique index (id)
);

#TABELA: TIPO_TAREFA
create table tbl_tipo_tarefa(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    
    unique index(id)
);

#TABELA: TAREFA
create table tbl_tarefa(
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    tempo_previsto time not null,
    numero float not null,
    foto_peca varchar(150) not null,
    id_tipo_tarefa int not null,
    id_professor int not null,
    id_materia int not null,
    
    constraint FK_TipoTarefa_Tarefa
    foreign key (id_tipo_tarefa)
    references tbl_tipo_tarefa(id),
    
	constraint FK_Professor_Tarefa
    foreign key (id_professor)
    references tbl_professor(id),
    
    constraint FK_Materia_Tarefa
    foreign key (id_materia)
    references tbl_materia(id),
    
    unique index (id)
);

#TABELA: CRITERIO
create table tbl_criterio(
	id int not null auto_increment primary key,
    descricao varchar(350) not null,
    nota_valida bit not null,
    margem_erro varchar(5),
    tipo_critico bit not null,
	id_tarefa int not null,
	
    constraint FK_Tarefa_Criterio
    foreign key (id_tarefa)
    references tbl_tarefa(id),
    
    unique index (id)
);

create table tbl_resultado_desejado(
	id int not null auto_increment primary key,
    descricao varchar(15) not null,
    id_criterio int not null,
	
    constraint FK_Criterio_ResultadoDesejado
    foreign key (id_criterio)
    references tbl_criterio(id),
    
    unique index (id)
);

#TABELA: AVALIACAO_ALUNO
create table tbl_avaliacao_aluno(
	id int not null auto_increment primary key,
	nota bit not null,
    valor_obtido varchar(10),
    id_criterio int not null, 
    id_aluno int not null,
    
    constraint FK_Criterio_AvaliacaoAluno
    foreign key (id_criterio)
    references tbl_criterio(id),
    
    constraint FK_Aluno_AvaliacaoAluno
    foreign key (id_aluno)
    references tbl_aluno(id),
    
    unique index (id)
);

#TABELA: REGISTRO_TEMPO
create table tbl_registro_tempo(
	id int not null auto_increment primary key,
    data date not null,
    duracao_inicio time not null,
    duracao_termino time not null,
    desconto time not null,
    id_tarefa int not null,
    id_aluno int not null,
    
    constraint FK_Tarefa_RegistroTempo
    foreign key (id_tarefa)
    references tbl_tarefa(id),
    
    constraint FK_Aluno_RegistroTempo
    foreign key (id_aluno)
    references tbl_aluno(id),
    
    unique index (id)
);

#TABELA: AVALIACAO_PROFESSOR
create table tbl_avaliacao_professor(
	id int not null auto_increment primary key,
    nota bit not null,
    id_avaliacao_aluno int not null, 
    id_professor int not null,
    
	constraint FK_AvaliacaoAluno_AvaliacaoProfessor
    foreign key (id_avaliacao_aluno)
    references tbl_avaliacao_aluno(id),
    
    constraint FK_Professor_AvaliacaoProfessor
    foreign key (id_professor)
    references tbl_professor(id),
    
    unique index (id)
);

