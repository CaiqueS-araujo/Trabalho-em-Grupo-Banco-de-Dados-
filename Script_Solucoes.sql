/*
 * Script com soluções das questões
 */

-- Outros Requisitos:
-- Arquivo com modelo conceitual: Hospital_Conceitual.brM3
-- Arquivo com modelo Logico: Hospital_logico.brM3
-- Arquivo com comandos SQL:
--	• SQL de criação das tabelas (DDL) - Arquivo: Script-Create.sql
--	• SQL de inserção de dados nas tabelas (pelo menos dez registros em cada uma)(DML) - Arquivo:Script-Insert.sql
--  • Usar ENUM quando achar necessário - Arquivo: Script-Create.sql

-- Soluções para as questões
--  • Um comando SQL de atualização em algum registro em uma tabela (DML)
-- Resultado de select na tabela exame_laudo a data de resultado no id 3 era null, por isso executamos um update para atualizar a data.
select * from  exame_laudo;

--Update realizado para alterar a data de resultado, onde no arquivo seria selecionado o upload do pdf
update exame_laudo 
set data_resultado = '2026-05-20 10:50:04.798'
where id=3;

-- ==============================================================================
--  • Um comando SQL de exclusão de algum registro em uma tabela (DML)
-- Efetuamos um select para buscar os registros, escolhemos o de id = 4
select * from fatura;
--Exclui a fatura do id 4 já que os status foi cancelado
delete from fatura
where id=4;

-- ==============================================================================
/* Médicos e Especialidades
	Quais são os nomes e telefones de todos os médicos da especialidade “Cardiologia”?
*/
-- Select conforme solicitado
select
    nome as medico,
    telefone
from medico
where especialidade = 'CARDIOLOGISTA';

-- ==============================================================================
/* Pacientes e Planos de Saúde
	Liste o nome e o CPF de todos os pacientes que possuem o plano de saúde “Unimed”.
*/
select
    p.nome,
    ps.nome as plano_saude,
    p.cpf
from paciente p
join plano_saude ps 
on p.id_plano_saude = ps.id
where ps.nome = 'Unimed';

-- Selects para conferencia retorna todos os pacientes e planos de saude
select * from paciente;
select * from plano_saude;

-- ==============================================================================
/* Exames Pendentes
	Quais exames ainda não têm resultado (data_resultado IS NULL) e foram solicitados no
	mês atual?
 */
select
    id,
    tipo,
    data_solicitacao
from exame_laudo
where data_resultado is null
and extract (month from data_solicitacao) = extract (month from CURRENT_DATE)
and extract (year from  data_solicitacao) = extract (year from CURRENT_DATE);

-- Quantidade de exames por laboratório.
select 
	l.tipo as Tipo,
	count(e.id) as quantidade_exames
from
	laboratorio l
left join
	exame_laudo e on l.id = e.id_laboratorio
group by
	l.id, l.tipo
	
-- Select para verificação de todos os registros
select * from exame_laudo;

-- ==============================================================================
/* Internações Ativas
	Liste o nome do paciente, o número do leito e a data de entrada para todas as
	internações ativas (data_saida IS NULL).
*/
select * from internacao

select 
    p.nome as nome_paciente, 
    l.numero as numero_leito, 
    i.data_entrada
from
    internacao i
inner join
    paciente p on i.id_paciente = p.id
inner join
    leito l on i.id_leito = l.id
where 
    i.data_saida is null

-- ==============================================================================
/* Atendimentos por Médico
	Quantos atendimentos cada médico realizou no último mês? Apresente o nome do
	médico e a quantidade.
*/

select m.nome, count(a.id_medico) as quantidade
from medico m
inner join atendimento a
on a.id_medico = m.id
where 
a.data_hora >= (
select max(a.data_hora) from atendimento a)- interval '1 month'
group by 
  m.nome

  -- Qual médico com maior número de atendimentos?
  
 select m.nome, count(a.id_medico) as quantidade
from medico m
inner join atendimento a
on a.id_medico = m.id
where 
a.data_hora >= (
select max(a.data_hora) from atendimento a)- interval '1 month'
group by 
  m.nome
order by 
  quantidade desc
limit 1  

-- ==============================================================================    
/* Ocupação de Leitos por Ala
	Qual a porcentagem de leitos ocupados em cada ala? Apresente o nome da ala e a
	porcentagem.

	Ocupação de Leitos por Ala
	Qual a porcentagem de leitos ocupados em cada ala? Apresente o nome da ala e a porcentagem. 
	para cada ala:
   	 	conta todos os leitos
   	 	conta só os ocupados
   	 	divide um pelo outro
   	 	multiplica por 100
   		Foi feito um código antes sem o round, depois foi colocado o round.
**/
select 
    a.tipo,
    round(
        (count (case when l.status = 'OCUPADO' then 1 end) * 100.0) 
        / count(*), 2 ) as porcentagem
from ala a
join leito l on a.id = l.id_ala
group by a.tipo;

-- ==============================================================================
/* Faturamento por Plano de Saúde
	Qual o valor total faturado para cada plano de saúde no ano de 2026? Apresente o nome
	do plano e o valor total.
*/
-- Select para consulta de verificação dos registros 
select * from ala;
select * from leito;


select
    ps.nome as plano,
    sum(f.valor) as total_faturado
from fatura f
inner join plano_saude ps 
    on f.id_plano_saude = ps.id
where extract(year from f.data_emissao) = 2026
group by ps.nome
order by total_faturado desc; 


-- ==============================================================================
 /* Prescrições de Medicamentos
		Quais são os dois medicamentos mais prescritos no hospital? Apresente o nome do
		medicamento e a quantidade de prescrições.
 */ 
-- Seleciona todos os medicamento_prescricao, agrupando e "contando", para pegar os mais vendidos
-- ordenei em ordem decrescente liminando a dois registros.
select  
    m.nome AS medicamento, 
    COUNT(mp.id_medicamento) AS total_prescricoes
from
    medicamento m
inner join  
    medicamento_prescricao mp ON m.id = mp.id_medicamento 
group by 
    m.id, m.nome
order by  
    total_prescricoes desc
limit 2;
    
-- ==============================================================================
/* Médicos e Pacientes por Especialidade
	Liste o nome do médico, a especialidade e a quantidade de pacientes atendidos por
	cada médico.
*/

select m.nome,m.especialidade,count(a.id_paciente) as quantidade_pacientes 
from  medico m
inner join atendimento a
on a.id_medico = m.id
group by m.nome,m.especialidade;


-- ==============================================================================
/* Leitos com Internações Prolongadas
	Quais leitos estão ocupados há mais de 15 dias? Apresente o número do leito, o nome
	do paciente e a data de entrada.
*/

select l.numero,p.nome, i.data_entrada
from internacao i
inner join leito l
on i.id_leito = l.id 
inner join paciente p
on i.id_paciente= p.id
where l.status = 'OCUPADO' and i.data_entrada <= current_timestamp - interval '15 day' 
group by l.numero , p.nome, i.data_entrada ;



-- ==============================================================================
/* Faturamento por Tipo de Atendimento
	Qual o valor total faturado por tipo de atendimento (consulta, exame, internação)
*/	

select 
    a.tipo,
    sum(f.valor) as total_faturado
from atendimento a
inner join fatura f 
on a.id = f.id_atendimento
group by a.tipo;



-- Select para verificação dos  registros
select * from fatura;

-- ==============================================================================
/* Faturamento por Plano de Saúde---
	Qual o valor total faturado por por um determinado plano de saúde.
*/
select
    ps.nome as plano,
    sum(f.valor) as total_faturado
from fatura f
left join plano_saude ps 
    on f.id_plano_saude = ps.id
where ps.nome = 'Amil'
group by ps.nome
order by total_faturado desc;









    
