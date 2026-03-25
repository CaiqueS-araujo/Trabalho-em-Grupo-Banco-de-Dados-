 	
   	
 
-- Cria a Tabela autor  	
CREATE TABLE autor (
    id_autor serial PRIMARY KEY,
    nome varchar(40)

);

-- Cria a Tabela livro

CREATE TABLE livro (
    id_livro serial PRIMARY KEY,
    titulo varchar(20), 
    id_autor int, 
    foreign key (id_autor)
    references autor(id_autor)
    on delete cascade
    on update restrict
    
);

-- Cria Tabela usuario
CREATE TABLE usuario (
    id_usuario serial PRIMARY KEY,
    nome varchar(40),
    email varchar(40) UNIQUE
);

-- Cria Tabela Relacionamento Livro X usuario --> Empréstimo
CREATE TABLE Emprestimo_livro_usuario (
    id_emprestimo serial PRIMARY KEY, 
	data_emprestimo date,
    data_devolucao date,
    valor_emprestimo numeric,
    id_usuario int,
    foreign key (id_usuario)
    references usuario(id_usuario),
    id_livro int,
    foreign key (id_livro)
    references livro(id_livro)

);
 
-- Insere Autores
	
INSERT INTO autor (nome) VALUES 
('J.R.R. Tolkien'),
('George Orwell'),
('Isaac Asimov'),
('Agatha Christie'),
('H.P. Lovecraft'),
('Stephen King'),
('Neil Gaiman'),
('Frank Herbert'),
('Aldous Huxley'),
('Arthur C. Clarke');
INSERT INTO autor (nome) VALUES 
('Autor sem livro 1'),
('Autor sem livro 2'),
('Autor sem livro 3')

-- Insere Livros
INSERT INTO livro (titulo, id_autor) VALUES 
('O Hobbit', 1),
('1984', 2),
('Fundação', 3),
('Morte no Nilo', 4),
('O Chamado Cthulhu', 5),
('It: A Coisa', 6),
('Sandman', 7),
('Duna', 8),
('Admirável Mundo', 9),
('2001: Odisseia', 10);

INSERT INTO livro (titulo, id_autor) VALUES 
('PHP', 1),
('JAVA', 3),
('MYSQL', 8);

-- Insere Usuários

  	INSERT INTO usuario (nome, email) VALUES 
('Ana Silva', 'ana@email.com'),
('Bruno Costa', 'bruno@email.com'),
('Carla Souza', 'carla@email.com'),
('Diego Lima', 'diego@email.com'),
('Elena Rosa', 'elena@email.com'),
('Fabio Melo', 'fabio@email.com'),
('Gisele Luz', 'gisele@email.com'),
('Hugo Dias', 'hugo@email.com'),
('Iara Gomes', 'iara@email.com'),
('João Vaz', 'joao@email.com');


  	-- Insere Emprestimo
INSERT INTO Emprestimo_livro_usuario (data_emprestimo, data_devolucao, valor_emprestimo, id_usuario, id_livro) VALUES 
('2024-01-10', '2024-01-20', 5.50, 1, 1),
('2024-01-12', '2024-01-22', 4.00, 2, 2),
('2024-01-15', '2024-01-25', 6.00, 3, 3),
('2024-02-01', '2024-02-10', 3.50, 4, 4),
('2024-02-05', '2024-02-15', 5.00, 5, 5),
('2024-02-10', '2024-02-20', 7.20, 6, 6),
('2024-03-01', '2024-03-11', 4.50, 7, 7),
('2024-03-05', '2024-03-15', 8.00, 8, 8),
('2024-03-10', '2024-03-20', 5.00, 9, 9),
('2024-03-15', '2024-03-25', 6.50, 10, 10);

INSERT INTO Emprestimo_livro_usuario (data_emprestimo, data_devolucao, valor_emprestimo, id_usuario, id_livro) VALUES 
('2024-01-20', '2024-01-26', 10.00, 4, 8),
('2024-01-22', '2024-01-26', 14.00, 4, 8),
('2024-01-25', '2024-01-26', 10.00, 5, 8)


  	
-- 1) Retornar os livros emprestados.

   select l.titulo as "Livro", u.nome as "Usuário",
   e.data_emprestimo as "Data Saída",
   e.valor_emprestimo as "Valor"
   from 
   Emprestimo_livro_usuario e
   inner join 
   livro l on e.id_livro = l.id_livro
   inner join 
   usuario u on e.id_usuario = u.id_usuario
   
   
-- 2) Retornar os livros que não foram emprestados.
   
   select l.titulo as "Livro"
   from 
   Emprestimo_livro_usuario e
   right join 
   livro l on e.id_livro = l.id_livro
   where e.id_livro is null

-- 3) Contar quantos livros foram emprestados.
   
    select count(*) from Emprestimo_livro_usuario;

-- 4) A quantidade de livros que cada autor tem.
    
    select a.nome as "Autor",
    COUNT(l.id_livro) as "Quantidade"
    from autor a
    left join 
    livro l on a.id_autor = l.id_autor
    group by a.nome
 

-- 5) Exibir os livros do mais caro ao mais barato em ordem.

 select l.titulo as "Livro", e.valor_emprestimo as "Valor Emprestimo"
 from livro l 
 join Emprestimo_livro_usuario e ON l.id_livro = e.id_livro 
 order by e.valor_emprestimo desc;
    

-- 6) Apagar um autor consequentemente seu livro deverá automaticamente apagado.  	
/*Erro SQL [23503]: ERROR: update or delete on table "livro" violates foreign key constraint 
 * "emprestimo_livro_usuario_id_livro_fkey" on table "emprestimo_livro_usuario"
 * Detalhe: Key (id_livro)=(1) is still referenced from table "emprestimo_livro_usuario".
 * Posição do erro:
 * 
 * Tentamos executar a exclusão, mas por causa da restrição não foi possivel
 * Solução: 
 * Na tabela Emprestimo_livro_usuario incluir: ON DELETE CASCADE
 * 
 * Conforme pesquisa descobrimos que deveriamos ter colocado o ON DELETE CASCADE
 * na tabela (Emprestimo_livro_usuario) , optamos em tentar alterar a tabela 
 * Procedimento: remover restrições anteriores e incluir nova restrição
 * chegamos nos comandos abaixo.
 */
 -- Exclusão do autor de id 1
 delete from autor where id_autor = 1 ;

-- Remove as restrições anteriores 
alter table Emprestimo_livro_usuario 
drop constant emprestimo_livro_usuario_id_livro_fkey;
-- Inclui a nova restrição
alter table Emprestimo_livro_usuario 
add constraint id_livro 
foreign key (id_livro) references livro(id_livro)
on delete cascade;


-- 7) Mostra o total arrecado em empréstimo de um determinado livro
  	
select 
    l.titulo AS "Livro", 
    SUM(e.valor_emprestimo) AS "Total por Livro"
from 
    livro l
inner join 
    Emprestimo_livro_usuario e ON l.id_livro = e.id_livro 
GROUP BY 
    l.id_livro, l.titulo
    



