/* Scripts para criação da base de dados
 * 
 * 1 - Parte Criado os enums
 * 2 - Parte Criado as tabelas
 *  
 * NOTA: Foram colocadas em ordem par evitar problemas com a chaves estrangeiras
 */


--CRIANDO ENUM TIPO ALA--

create type ala_tipo_enum as enum ('UTI', 'CTI', 'ENFERMARIA', 'PEDIATRIA', 'CARDIOLOGIA', 'CLINICO GERAL');

--CRIANDO ENUM TURNO--

create type turno_enum as enum ('MANHA', 'TARDE', 'NOITE');

--CRIANDO ENUM TIPO ATENDIMENTO--

create type atendimento_tipo_enum as enum ('CONSULTA','EMERGENCIA', 'REVISAO');

--CRIANDO ENUM ATENDIMENTO STATUS--

create type atendimento_status_enum as enum ('REALIZADO','CANCELADO', 'AGENDADO');

--CRIANDO ENUM COBERTURA--

create type cobertura_enum as enum ('REGIONAL','NACIONAL');

--CRIANDO ENUM LABORATORIO--

create type laboratorio_tipo_enum as enum ('INTERNO','EXTERNO');

--CRIANDO ENUM EXAME LAUDO--

create type exame_laudo_tipo_enum as enum ('SANGUE','IMAGEM');

--CRIANDO ENUM RESULTADO EXAME LAUDO--

create type exame_laudo_resultado_enum as enum ('NORMAL','ALTERADO','CRITICO');

--CRIANDO ENUM FATURA STATUS--

create type fatura_status_enum as enum ('PENDENTE','PAGO','CANCELADO','EM ANALISE');

--CRIANDO ENUM PAGAMENTO FATURA--

create type fatura_forma_pagamento_enum as enum ('PIX','CREDITO','DEBITO','BOLETO','DINHEIRO');

--CRIANDO ENUM STATUS LEITO--

create type leito_status_enum as enum ('OCUPADO','LIVRE','MANUTENCAO');

--CRIANDO ENUM TELEFONE--

create type tipo_telefone_enum as enum ('CELULAR','FIXO','COMERCIAL','WHATSAPP','RECADO');

--CRIANDO ENUM ESPECIALIDADE--

create type especialidade_medico_enum as enum ('CARDIOLOGISTA','DERMATOLOGISTA','NEUROLOGISTA');

 -- ===============================================================================
-- Criando Tabelas

--CRIANDO CEP--

create table cep (id serial primary key,
rua varchar (150),
bairro varchar(150),
cidade varchar(150),
uf char (2));

--CRIANDO LABORATORIO--

create table laboratorio (id serial primary key,
tipo laboratorio_tipo_enum);

--CRIANDO MEDICAMENTOS-- 

create table medicamento (id serial primary key, 
nome varchar (50));

--CRIANDO PRESCRICAO--

create table prescricao (id serial primary key,
quantidade int,
data date,
id_medicamento int,
foreign key (id_medicamento) references medicamento(id));


--CRIANDO MEDICAMENTO / PRESCRICAO--

create table medicamento_prescricao (id serial primary key, 
dosagem int,
observacao varchar(31),
id_medicamento int,
id_prescricao int,
foreign key (id_prescricao) references prescricao(id),
foreign key (id_medicamento) references medicamento(id));

--CRIANDO PESQUISA DE SATISFACAO--

create table pesquisa_satisfacao (id serial primary key,
data_resposta date,
nota_geral smallint not null check (nota_geral >=1 and nota_geral <= 5),
comentario text,
recomendaria boolean, 
tempo_espera_avaliacao smallint not null check (tempo_espera_avaliacao >=1 and tempo_espera_avaliacao <= 5));

--CRIANDO ENDEREÇO--

create table endereco (id serial primary key,
cep varchar(8) not null,
numero varchar(20),
complemento varchar(50),
id_cep int,
foreign key (id_cep) references cep(id));

--CRIANDO HOSPITAL--

create table hospital (id serial primary key,
nome varchar (100) not null,
cnpj varchar (14) unique, 
id_endereco int,
foreign key (id_endereco) references endereco(id));

--CRIANDO MEDICO--

create table medico (id serial primary key,
nome varchar (100) not null,
especialidade especialidade_medico_enum,
crm varchar(20) unique not null,
id_endereco int,
foreign key (id_endereco) references endereco(id));

--CRIANDO PLANO DE SAÚDE--

create table plano_saude (id serial primary key, 
nome varchar(100)unique,
cobertura cobertura_enum,
id_endereco int,
foreign key (id_endereco) references endereco(id));

--CRIANDO PACIENTE--

create table paciente (id serial primary key,
nome varchar (100) not null ,
cpf varchar (11) unique not null,
id_endereco int,
id_plano_saude int default null,
foreign key (id_endereco) references endereco(id),
foreign key (id_plano_saude) references plano_saude(id));


--CRIANDO ALA--

create table ala (id serial primary key,
tipo ala_tipo_enum, 
id_hospital int,
foreign key (id_hospital) references hospital(id));

--CRIANDO LEITO--

create table leito ( id serial primary key,
numero int unique,
status leito_status_enum,
id_ala int,
foreign key (id_ala) references ala(id));

--CRIANDO ENFERMEIRA--

create table enfermeira (id serial primary key,
nome varchar(100) not null,
cre varchar (20) unique not null,
turno turno_enum, 
id_chefe int,
id_ala int,
id_endereco int,
foreign key (id_chefe) references enfermeira(id),
foreign key (id_ala) references ala(id),
foreign key (id_endereco) references endereco(id));

--CRIANDO TELEFONE--

create table telefone (id serial primary key,
numero varchar(15)unique,
tipo tipo_telefone_enum,
principal boolean,
observacao varchar(100),
id_medico int,
id_hospital int,
id_plano_saude int,
id_paciente int,
foreign key (id_medico) references medico(id),
foreign key (id_hospital) references hospital(id),
foreign key (id_plano_saude) references plano_saude(id),
foreign key (id_paciente) references paciente(id));


--CRIANDO INTERNACAO--

create table internacao (id serial primary key, 
data_entrada date not null default current_date,
data_saida date  default null,
id_paciente int,
id_leito int,
constraint checa_periodo 
check (data_saida is null or data_saida > data_entrada),
foreign key (id_paciente) references paciente(id),
foreign key (id_leito) references leito(id));

--CRIANDO EXAME E LAUDOS--

create table exame_laudo (id serial primary key, 
tipo exame_laudo_tipo_enum,
custo numeric(10,2),
descricao text, 
resultado exame_laudo_resultado_enum,
data_solicitacao timestamp,
data_resultado timestamp,
id_laboratorio int,
foreign key (id_laboratorio) references laboratorio(id),
arquivo bytea);

--CRIANDO ATENDIMENTO--

create table atendimento (id serial primary key,
data_hora timestamp,
tipo atendimento_tipo_enum,
status atendimento_status_enum,
observacoes text, 
id_paciente int,
id_medico int,
id_exame_laudo int,
id_prescricao int,
id_pesquisa_satisfacao int,
foreign key (id_paciente) references paciente(id),
foreign key (id_medico) references medico(id),
foreign key (id_exame_laudo) references exame_laudo(id),
foreign key (id_prescricao) references prescricao(id),
foreign key (id_pesquisa_satisfacao) references pesquisa_satisfacao(id));

--CRIANDO FATURA--

create table fatura (id serial primary key, 
valor numeric(10,2),
status fatura_status_enum,
forma_pagamento fatura_forma_pagamento_enum,
data_emissao date,
data_vencimento date,
id_paciente int,
id_atendimento int,
id_plano_saude int,
id_exame_laudo int,
id_internacao int,
foreign key (id_paciente) references paciente(id),
foreign key (id_atendimento) references atendimento(id),
foreign key (id_plano_saude) references plano_saude(id),
foreign key (id_exame_laudo) references exame_laudo(id),
foreign key (id_internacao) references internacao(id));



--CRIANDO CREDENCIAMENTO--

create table credenciamento (id serial primary key,
data_credenciamento date,
id_hospital int,
id_plano_saude int,
foreign key (id_hospital) references hospital(id),
foreign key (id_plano_saude) references plano_saude(id));


