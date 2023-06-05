# INSERTS DAS TABELAS

# MATERIA
insert into tbl_materia(
						nome,
                        carga_horaria,
                        sigla,
                        descricao
						)values(
						"Banco de Dados",
                        75,
                        "BD",
                        "Guardião digital de informações vitais para empresas e organizações."
                        );

select * from tbl_materia;                        

# CURSO
insert into tbl_curso(
						nome,
                        carga_horaria,
                        descricao,
                        sigla,
                        foto
						)values(
						"Desenvolvimento de Sistemas",
                        1200,
                        "Curso de Desenvolvimento de Sistemas: Construa soluções inovadoras e transforme ideias em realidade tecnológica.",
                        "DS",
                        "https://www.tuiuti.edu.br/hubfs/analise%20e%20desenvolvimento%20de%20sistemas%20utp.jpg"
                        );
                        
select * from tbl_curso;

# TURMA
insert into tbl_turma(
						nome,
                        data_inicio,
                        data_conclusao,
                        descricao,
                        semestre,
                        id_curso
					)values(
                    "DS1T",
                    "2022-07-21",
                    "2022-12-15",
                    "turma de desenvolvimento de sistemas, no primeiro semestre",
                    1,
                    1
                    );  

select * from tbl_turma;                    
select tbl_turma.nome as nome_turma, tbl_turma.data_inicio, tbl_turma.data_conclusao, tbl_turma.descricao, tbl_turma.semestre,
	   tbl_curso.nome as nome_curso
from tbl_turma
			inner join tbl_curso
				on tbl_curso.id = tbl_turma.id_curso;    
                
# CURSO_MATERIA                
insert into tbl_curso_materia(id_materia,id_curso)values(1, 1);

select * from tbl_curso_materia;

select tbl_curso.nome as nome_curso,
	   tbl_materia.nome as nome_materia
from tbl_materia
		inner join tbl_curso_materia
			on tbl_materia.id = tbl_curso_materia.id_materia
		inner join tbl_curso
			on tbl_curso.id = tbl_curso_materia.id_curso;

# TURMA_CURSO_MATERIA
insert into tbl_turma_curso_materia(id_turma, id_curso_materia)values(1,1);		

select * from tbl_turma_curso_materia;

select turma_curso_materia.id as id_turma_curso_materia, 
	   turma.id as id_turma, turma.nome as nome_turma, 
       materia.nome as nome_materia, 
	   curso.nome as nome_curso 
from tbl_turma_curso_materia as turma_curso_materia
        inner join tbl_turma as turma 
            on turma.id = turma_curso_materia.id_turma
        inner join tbl_curso_materia as curso_materia 
            on curso_materia.id = turma_curso_materia.id_curso_materia
        inner join tbl_materia as materia
            on materia.id = curso_materia.id_materia
        inner join tbl_curso as curso 
            on curso.id = curso_materia.id_curso;

# STATUS_USUARIO
insert into tbl_status_usuario(nivel)values("Administrador"),
								           ("Aluno"),
                                           ("Professor");
select * from tbl_status_usuario;

# USUARIO
insert into tbl_usuario(email, senha, id_status_usuario)values("adm@gmail.com", "bcd127", 1);
insert into tbl_usuario(email, senha, id_status_usuario)values("aluno@gmail.com", "123456", 2);
insert into tbl_usuario(email, senha, id_status_usuario)values("professor@gmail.com", "123456", 3);
insert into tbl_usuario(email, senha, id_status_usuario)values("professor_marcel@gmail.com", "123456", 3);
insert into tbl_usuario(email, senha, id_status_usuario)values("professor_leleo@gmail.com", "123456", 3);
                
select * from tbl_usuario;                

select tbl_usuario.email, tbl_usuario.senha,
	   tbl_status_usuario.nivel
from tbl_usuario
		inner join tbl_status_usuario
			on tbl_usuario.id = tbl_status_usuario.id;

# ALUNO
insert into tbl_aluno(nome, cpf, data_nascimento, email)values("Muryllo Siqueira", "36548905420", "2005-02-15", "muryllo@gmail.com");                
insert into tbl_aluno(nome, cpf, data_nascimento, email)values("Carol Portela", "36456905420", "2003-08-24", "carol@gmail.com");                
insert into tbl_aluno(nome, cpf, data_nascimento, email)values("Luiz Gustavo", "36548915820", "2005-02-15", "luiz@gmail.com");                

select * from tbl_aluno;   

# STATUS_MATRICULA
insert into tbl_status_matricula(nome)values("Ativo"),
											("Inativo");

select * from tbl_status_matricula;

# MATRICULA
insert into tbl_matricula(numero, id_status_matricula, id_aluno, id_usuario)values(22282224, 1, 1, 2);
insert into tbl_matricula(numero, id_status_matricula, id_aluno, id_usuario)values(22282244, 1, 2, 2);
insert into tbl_matricula(numero, id_status_matricula, id_aluno, id_usuario)values(22282255, 1, 3, 2);

select * from tbl_matricula;      

select tbl_matricula.numero as numero_matricula,
	   tbl_status_matricula.nome as status_matricula,
       tbl_aluno.nome as nome_aluno, tbl_aluno.cpf, tbl_aluno.email as email_pessoal,
       tbl_usuario.email, tbl_usuario.senha, tbl_usuario.id_status_usuario
from tbl_matricula
	inner join tbl_aluno
		on tbl_aluno.id = tbl_matricula.id_aluno
	inner join tbl_usuario
		on tbl_usuario.id = tbl_matricula.id_usuario
	inner join tbl_status_usuario
		on tbl_status_usuario.id = tbl_usuario.id_status_usuario
	inner join tbl_status_matricula
		on tbl_status_matricula.id = tbl_matricula.id_status_matricula;

# PROFESSOR
insert into tbl_professor(nome, nif, telefone, email, id_usuario)values("Marcel Teixeira", "1155997", "11966857401", "marcel@gmail.com", 4);
insert into tbl_professor(nome, nif, telefone, email, id_usuario)values("Fernando Leonid", "1155577", "11966347402", "leleo@gmail.com", 5);

select * from tbl_professor;

select tbl_professor.nome, tbl_professor.nif, tbl_professor.telefone, tbl_professor.email as email_pessoal,
	   tbl_usuario.email as email_institucional
from tbl_professor
		inner join tbl_usuario
			on tbl_usuario.id = tbl_professor.id_usuario;


# PROFESSOR_TURMA_MATERIA_CURSO
insert into tbl_professor_turma_materia_curso(id_professor, id_turma_curso_materia)values(1, 1);    
insert into tbl_professor_turma_materia_curso(id_professor, id_turma_curso_materia)values(2, 1);    
  
select * from tbl_professor_turma_materia_curso;

select turma_curso_materia.id as id_turma_curso_materia, 
turma.id as id_turma, turma.nome as nome_turma, 
materia.nome as nome_materia, 
curso.nome as nome_curso 
    from tbl_turma_curso_materia as turma_curso_materia
        inner join tbl_turma as turma 
            on turma.id = turma_curso_materia.id_turma
        inner join tbl_curso_materia as curso_materia 
            on curso_materia.id = turma_curso_materia.id_curso_materia
        inner join tbl_materia as materia
            on materia.id = curso_materia.id_materia
        inner join tbl_curso as curso 
            on curso.id = curso_materia.id_curso;

# TBL_TURMA_MATRICULA
insert into tbl_turma_matricula(id_matricula, id_turma)values(1, 1);
insert into tbl_turma_matricula(id_matricula, id_turma)values(2, 1);
insert into tbl_turma_matricula(id_matricula, id_turma)values(3, 1);

select * from tbl_turma_matricula;

select tbl_turma.nome,
	   tbl_matricula.numero
from tbl_turma
		inner join tbl_turma_matricula
			on tbl_turma.id = tbl_turma_matricula.id_turma
        inner join tbl_matricula
			on tbl_matricula.id = tbl_turma_matricula.id_matricula;
 
# TIPO_TAREFA
insert into tbl_tipo_tarefa(nome)values("Formativa"),
									   ("Somativa"); 

select * from tbl_tipo_tarefa; 
 
# TAREFA
insert into tbl_tarefa(nome, tempo_previsto, numero, foto_peca, id_tipo_tarefa, id_curso_materia)values("T1", "5:00:00", 1, "https://www.gnatus.com.br/wp-content/uploads/2018/05/RX1.png", 1, 1);       
insert into tbl_tarefa(nome, tempo_previsto, numero, foto_peca, id_tipo_tarefa, id_curso_materia)values("T2", "5:00:00", 2, "https://www.gnatus.com.br/wp-content/uploads/2018/05/RX1.png", 2, 1);

select * from tbl_tarefa;    

# REGISTRO_TEMPO
insert into tbl_registro_tempo(data_inicio, duracao_inicio, duracao_termino, desconto, liquido, tempo_geral, id_tarefa, id_matricula)values("2022-06-04", "13:00:00", "16:00:00", "00:15:00", "3:45:00", "3:45:00", 1, 1);
insert into tbl_registro_tempo(data_inicio, duracao_inicio, duracao_termino, desconto, liquido, tempo_geral, id_tarefa, id_matricula)values("2022-06-05", "13:00:00", "16:00:00", "00:15:00", "3:45:00", "7:00:00", 1, 1);

select * from tbl_registro_tempo;

select tbl_registro_tempo.id, tbl_registro_tempo.data_inicio, tbl_registro_tempo.duracao_inicio, tbl_registro_tempo.duracao_termino, tbl_registro_tempo.desconto, tbl_registro_tempo.liquido, tbl_registro_tempo.tempo_geral,
	   tbl_tarefa.nome,
       tbl_matricula.numero,
       tbl_status_matricula.nome
from tbl_registro_tempo, tbl_tarefa, tbl_matricula, tbl_status_matricula;       

# TBL_CRITERIO
insert into tbl_criterio(
							descricao, 
                            observacao, 
                            tipo_critico,
                            resultado_desejado,
                            id_tarefa
                            )values(
                            "A peça usinada está isenta de marcas e deformações",
                            0, # Não importante
                            0, # Formativa
                            154,
                            1
                            );
insert into tbl_criterio(
							descricao, 
                            observacao, 
                            tipo_critico,
                            resultado_desejado,
                            id_tarefa
                            )values(
                            "A peça usinada está isenta de marcas e deformações",
                            0, # Não importante
                            0, # Formativa
                            "M12 x 1,75",
                            1
                            );
                            
insert into tbl_criterio(
							descricao, 
                            observacao, 
                            tipo_critico,
                            resultado_desejado,
                            id_tarefa
                            )values(
                            "A peça usinada está isenta de marcas e deformações",
                            0, # Não importante
                            0, # Formativa
                            "45",
                            1
                            );

select * from tbl_criterio;

select tbl_criterio.id, tbl_criterio.descricao, tbl_criterio.observacao, tbl_criterio.tipo_critico, tbl_criterio.resultado_desejado,
	   tbl_tarefa.nome as nome_tarefa
from tbl_criterio
		inner join tbl_tarefa
			on tbl_tarefa.id = tbl_criterio.id_tarefa;
            
# TBL_MARGEM_ERRO
insert into tbl_margem_erro(minimo, maximo, id_criterio)values("0,5", "0,8", 1);            
insert into tbl_margem_erro(minimo, maximo, id_criterio)values("0,3", "1,0", 3);


select * from tbl_margem_erro;

select tbl_margem_erro.id , tbl_margem_erro.minimo, tbl_margem_erro.maximo,
	   tbl_criterio.resultado_desejado
from tbl_margem_erro
		inner join tbl_criterio
			on tbl_criterio.id = tbl_margem_erro.id_criterio;
            
# TBL_AVALIACAO_ALUNO
insert into tbl_avaliacao_aluno(nota, valor_obtido, id_criterio, id_matricula)values(0, "154", 1, 1);            
insert into tbl_avaliacao_aluno(nota, valor_obtido, id_criterio, id_matricula)values(0, "M12", 2, 1);            
insert into tbl_avaliacao_aluno(nota, valor_obtido, id_criterio, id_matricula)values(0, "45,2", 3, 1);

select * from tbl_avaliacao_aluno;

# TBL_AVALIACAO_PROFESSOR
insert into tbl_avaliacao_professor(valor, id_professor, id_avaliacao_aluno)values(0, 1, 1);
insert into tbl_avaliacao_professor(valor, id_professor, id_avaliacao_aluno)values(0, 1, 2);
insert into tbl_avaliacao_professor(valor, id_professor, id_avaliacao_aluno)values(0, 1, 3);

select * from tbl_avaliacao_professor;            