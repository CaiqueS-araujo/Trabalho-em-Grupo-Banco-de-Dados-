/* Inserts gerados pos IA conforme acordade
 * 	• SQL de inserção de dados nas tabelas (pelo menos dez registros em cada uma)(DML) - Arquivo:Script-Insert.sql
 * 	
 * 	NOTA: 	Estão em ordem de forma que não causem conflitos em função das chaves estrangeiras
 * 			No final tem um script de UPDADE que ajuste no valor dos campos da tabela exame_laudo
 */
-- 1. Tabelas de Base (Independentes) ---------------------------------------------------------------
-- CEP
INSERT INTO cep (rua, bairro, cidade, uf) VALUES
('Av. Brasil', 'Centro', 'Rio de Janeiro', 'RJ'), ('Rua das Flores', 'Jardins', 'São Paulo', 'SP'),
('Rua XV', 'Batel', 'Curitiba', 'PR'), ('Av. Getúlio', 'Savassi', 'Belo Horizonte', 'MG'),
('Rua Sol', 'Olinda', 'Recife', 'PE'), ('Av. Mar', 'Meireles', 'Fortaleza', 'CE'),
('Rua Sul', 'Moinhos', 'Porto Alegre', 'RS'), ('Av. Cerrado', 'Setor Oeste', 'Goiânia', 'GO'),
('Rua Norte', 'Adrianópolis', 'Manaus', 'AM'), ('Av. Paz', 'Asa Sul', 'Brasília', 'DF');

-- MEDICAMENTO
INSERT INTO medicamento (nome) VALUES 
('Dipirona'), ('Paracetamol'), ('Amoxicilina'), ('Morfina'), ('Insulina'), 
('Losartana'), ('Omeprazol'), ('Atenolol'), ('Ibuprofeno'), ('Azitromicina');

-- LABORATORIO
INSERT INTO laboratorio (tipo) VALUES 
('INTERNO'), ('EXTERNO'), ('INTERNO'), ('EXTERNO'), ('INTERNO'), 
('EXTERNO'), ('INTERNO'), ('EXTERNO'), ('INTERNO'), ('EXTERNO');

-- PESQUISA DE SATISFACAO
INSERT INTO pesquisa_satisfacao (data_resposta, nota_geral, comentario, recomendaria, tempo_espera_avaliacao) VALUES
('2026-03-01', 5, 'Excelente', true, 5), ('2026-03-02', 2, 'Demorado', false, 1),
('2026-03-03', 4, 'Bom', true, 4), ('2026-03-04', 3, 'Médio', true, 3),
('2026-03-05', 5, 'Ótimo', true, 5), ('2026-03-06', 1, 'Péssimo', false, 1),
('2026-03-07', 4, 'Satisfeito', true, 4), ('2026-03-08', 5, 'Recomendo', true, 5),
('2026-03-09', 3, 'Pode melhorar', true, 2), ('2026-03-10', 4, 'Ok', true, 4);

-- 2. Infraestrutura e Profissionais ----------------------------------------------------------------

-- ENDERECO
INSERT INTO endereco (cep, numero, complemento, id_cep) VALUES
('20000001', '10', 'Apto 1', 1), ('01000002', '20', 'Casa', 2),
('80000003', '30', 'Bloco B', 3), ('30000004', '40', NULL, 4),
('50000005', '50', 'Fundos', 5), ('60000006', '60', 'Sala 2', 6),
('90000007', '70', NULL, 7), ('70000008', '80', 'Anexo', 8),
('60000009', '90', 'Lote 5', 9), ('70000010', '100', 'Cobertura', 10);

-- HOSPITAL
INSERT INTO hospital (nome, cnpj, telefone, telefone_fixo, id_endereco) VALUES
('Hospital Santa Luzia', '12345678000101', '11988887777', '1133334444', 1),
('Clínica São José', '23456789000102', '21977776666', '2122223333', 2),
('Centro Médico Horizonte', '34567890000103', '31966665555', '3144445555', 3),
('Hospital do Ceará', '45678901000104', '85955554444', '8533332222', 4),
('Unidade Central DF', '56789012000105', '61944443333', '6133330000', 5),
('Hospital das Nações', '67890123000106', '41933332222', '4132323232', 6),
('Pronto Socorro Sul', '78901234000107', '51922221111', '5130303030', 7),
('Hospital Bahia Geral', '89012345000108', '71911110000', '7136363636', 8),
('Hospital de São Luís', '90123456000109', '98900009999', '9832321111', 9),
('Recife Medical Center', '01234567000110', '81999998888', '8134345555', 10);

-- PLANO DE SAUDE
INSERT INTO plano_saude (nome, cobertura, id_endereco, telefone, telefone_fixo) VALUES
('Amil Assistência', 'NACIONAL', 1, '11912341234', '1130031000'),
('Unimed Central', 'ESTADUAL', 2, '21988887777', '2140040001'),
('Bradesco Saúde', 'NACIONAL', 3, '31977776666', '3132223333'),
('SulAmérica Saúde', 'NACIONAL', 4, '85966665555', '8534005000'),
('Hapvida Assistência', 'REGIONAL', 5, '61955554444', '6140028922'),
('Porto Seguro Saúde', 'ESTADUAL', 6, '41944443333', '4133332222'),
('Golden Cross', 'NACIONAL', 7, '51933332222', '5132114455'),
('Intermédica Notredame', 'REGIONAL', 8, '71922221111', '7130302020'),
('Samed Saúde', 'ESTADUAL', 9, '98911110000', '9832219090'),
('Care Plus', 'NACIONAL', 10, '81900009999', '8134218877');

-- MEDICO
INSERT INTO medico (nome, especialidade, crm, id_endereco, telefone, telefone_fixo) VALUES
('Dr. Ricardo Arantes', 'CARDIOLOGIA', 'CRM/SP 123456', 1, '11911112222', '1133334444'),
('Dra. Helena Souza', 'PEDIATRIA', 'CRM/RJ 234567', 2, '21922223333', '2122223333'),
('Dr. Carlos Magno', 'ORTOPEDIA', 'CRM/MG 345678', 3, '31933334444', '3144445555'),
('Dra. Beatriz Luz', 'DERMATOLOGIA', 'CRM/CE 456789', 4, '85944445555', '8533332222'),
('Dr. André Volpi', 'GINECOLOGIA', 'CRM/DF 567890', 5, '61955556666', '6133330000'),
('Dra. Mariana Rios', 'NEUROLOGIA', 'CRM/PR 678901', 6, '41966667777', '4132323232'),
('Dr. Roberto Freire', 'PSIQUIATRIA', 'CRM/RS 789012', 7, '51977778888', '5130303030'),
('Dra. Luciana Melo', 'OFTALMOLOGIA', 'CRM/BA 890123', 8, '71988889999', '7136363636'),
('Dr. Fernando Costa', 'UROLOGIA', 'CRM/MA 901234', 9, '98999990000', '9832321111'),
('Dra. Patrícia Silva', 'CLINICA_GERAL', 'CRM/PE 012345', 10, '81912345678', '8134345555');

-- 3. Pacientes e Unidades Internas -------------------------------------------------------

-- PACIENTE (Alguns com plano, outros sem)
INSERT INTO paciente (nome, cpf, id_endereco, id_plano_saude, telefone, telefone_fixo) VALUES
('João da Silva Santos', '12345678901', 1, 1, '11912345678', '1133221100'),
('Maria Oliveira Souza', '23456789012', 2, 2, '21987654321', '2122334455'),
('Antônio Ferreira Lima', '34567890123', 3, 3, '31991112222', '3134445555'),
('Francisca das Chagas', '45678901234', 4, 4, '85988887777', '8532324040'),
('Paulo Roberto Gomes', '56789012345', 5, 5, '61977776666', '6133332211'),
('Ana Paula Ribeiro', '67890123456', 6, 6, '41966665555', '4132320011'),
('Luiz Fernando Costa', '78901234567', 7, 7, '51955554444', '5130309090'),
('Tereza Cristina Melo', '89012345678', 8, 8, '71944443333', '7136368080'),
('Sebastião José Alencar', '90123456789', 9, 9, '98933332222', '9832214040'),
('Cláudia Raia Pontes', '01234567890', 10, 10, '81922221111', '8134215050');


-- ALA
INSERT INTO ala (tipo, id_hospital) VALUES 
('UTI', 1), ('CTI', 1), ('ENFERMARIA', 2), ('PEDIATRIA', 2), ('CARDIOLOGIA', 3),
('CLINICO GERAL', 3), ('UTI', 4), ('PEDIATRIA', 5), ('ENFERMARIA', 6), ('CTI', 7);

-- LEITO
INSERT INTO leito (numero, status, id_ala) VALUES 
(101, 'OCUPADO', 1), (102, 'LIVRE', 1), (201, 'MANUTENCAO', 3), (202, 'OCUPADO', 3),
(301, 'LIVRE', 5), (302, 'OCUPADO', 5), (401, 'LIVRE', 7), (501, 'OCUPADO', 8),
(601, 'MANUTENCAO', 9), (701, 'LIVRE', 10);

-- ENFERMEIRA (Com hierarquia de chefia)
INSERT INTO enfermeira (nome, cre, turno, id_chefe, id_ala, id_endereco) VALUES
('Enf1', 'C1', 'MANHA', NULL, 1, 1), ('Enf2', 'C2', 'TARDE', 1, 1, 2),
('Enf3', 'C3', 'NOITE', 1, 2, 3), ('Enf4', 'C4', 'MANHA', 2, 3, 4),
('Enf5', 'C5', 'TARDE', 2, 4, 5), ('Enf6', 'C6', 'NOITE', 3, 5, 6),
('Enf7', 'C7', 'MANHA', 3, 6, 7), ('Enf8', 'C8', 'TARDE', 4, 7, 8),
('Enf9', 'C9', 'NOITE', 4, 8, 9), ('Enf10', 'C10', 'MANHA', 5, 9, 10);

-- 4. Operação (Atendimentos, Exames e Faturas) -----------------------------------------
-- EXAME LAUDO
INSERT INTO exame_laudo (tipo, custo, descricao, resultado, id_laboratorio) VALUES
('SANGUE', 50, 'Glicose', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 0)),
('IMAGEM', 200, 'RX Torax', 'ALTERADO', (SELECT id FROM laboratorio LIMIT 1 OFFSET 1)),
('SANGUE', 60, 'Hemograma', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 2)),
('IMAGEM', 500, 'RM Crânio', 'CRITICO', (SELECT id FROM laboratorio LIMIT 1 OFFSET 3)),
('SANGUE', 40, 'Ureia', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 4)),
('IMAGEM', 150, 'USG Abdomen', 'ALTERADO', (SELECT id FROM laboratorio LIMIT 1 OFFSET 5)),
('SANGUE', 80, 'Lipidograma', 'CRITICO', (SELECT id FROM laboratorio LIMIT 1 OFFSET 6)),
('IMAGEM', 300, 'TC Coluna', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 7)),
('SANGUE', 55, 'Creatinina', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 8)),
('IMAGEM', 180, 'RX Mao', 'NORMAL', (SELECT id FROM laboratorio LIMIT 1 OFFSET 9));

-- PRESCRICAO =======
INSERT INTO prescricao (quantidade, data, id_medicamento) VALUES
(1, '2026-03-01', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 0)),
(2, '2026-03-02', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 1)),
(1, '2026-03-03', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 2)),
(3, '2026-03-04', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 3)),
(1, '2026-03-05', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 4)),
(2, '2026-03-06', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 5)),
(1, '2026-03-07', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 6)),
(1, '2026-03-08', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 7)),
(2, '2026-03-09', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 8)),
(1, '2026-03-10', (SELECT id FROM medicamento ORDER BY id LIMIT 1 OFFSET 9));

-- ATENDIMENTO

INSERT INTO atendimento 
(data_hora, tipo, status, id_paciente, id_medico, id_exame_laudo, id_prescricao, id_pesquisa_satisfacao) 
VALUES
-- Médico 1 (3 atendimentos)
(NOW() - INTERVAL '1 day', 'CONSULTA',   'REALIZADO', 1, 1, 1, 1, 1),
(NOW() - INTERVAL '2 days', 'REVISAO',    'REALIZADO', 2, 1, 2, 2, 2),
(NOW() - INTERVAL '3 days', 'CONSULTA',   'REALIZADO', 3, 1, 3, 3, 3),

-- Médico 5 (4 atendimentos - O vencedor)
(NOW() - INTERVAL '1 hour', 'EMERGENCIA', 'REALIZADO', 4, 5, 4, 4, 4),
(NOW() - INTERVAL '2 hours','CONSULTA',   'REALIZADO', 5, 5, 5, 5, 5),
(NOW() - INTERVAL '5 days', 'REVISAO',    'REALIZADO', 6, 5, 6, 6, 6),
(NOW() - INTERVAL '6 days', 'CONSULTA',   'REALIZADO', 1, 5, 7, 7, 7),

-- Outros médicos
(NOW() - INTERVAL '10 days', 'EMERGENCIA', 'CANCELADO', 8, 3, 8, 8, 8),
(NOW() - INTERVAL '12 days', 'CONSULTA',   'AGENDADO',  9, 4, 9, 9, 9),
(NOW() - INTERVAL '15 days', 'REVISAO',    'REALIZADO', 10, 2, 10, 10, 10);


-- INTERNACAO (Usando IDs de 1 a 10 que existem na tabela leito)
INSERT INTO internacao (id_paciente, id_leito, data_entrada, data_saida) VALUES 
(1, 1, '2026-01-01', '2026-01-05'), 
(2, 2, '2026-01-10', '2026-01-15'), 
(3, 3, '2026-02-01', '2026-02-10'), 
(4, 4, '2026-02-15', '2026-02-20'), 
(5, 5, '2026-03-01', '2026-03-05'), 
(6, 6, '2026-03-10', NULL),         
(7, 1, '2026-03-15', NULL),     
(8, 2, '2026-03-20', NULL),         
(9, 3, '2026-03-22', NULL),         
(10, 4, '2026-03-25', NULL);        


-- FATURA
INSERT INTO fatura (
    valor, status, forma_pagamento, data_emissao, data_vencimento,id_paciente, id_atendimento, id_plano_saude) VALUES 

(250.00, 'PAGO', 'PIX', '2026-03-01', '2026-03-05', 1, 1, 1),   
(1200.00, 'PENDENTE', 'BOLETO', '2026-03-05', '2026-03-20', 2, 2, 2), 
(85.50, 'PAGO', 'CREDITO', '2026-03-10', '2026-03-10', 3, 3, 1),  
(300.00, 'PAGO', 'DEBITO', '2026-03-12', '2026-03-12', 4, 4, 3),   
(1500.00, 'EM ANALISE', 'BOLETO', '2026-03-15', '2026-03-30', 5, 5, 2), 
(45.00, 'PAGO', 'PIX', '2026-03-18', '2026-03-18', 6, 6, 1),    

(500.00, 'PAGO', 'DINHEIRO', '2026-03-20', '2026-03-20', 7, 7, NULL),
(850.00, 'PENDENTE', 'BOLETO', '2026-03-22', '2026-04-05', 8, 8, NULL),
(120.00, 'PAGO', 'CREDITO', '2026-03-25', '2026-03-25', 9, 9, NULL),
(2000.00, 'PAGO', 'PIX', '2026-03-28', '2026-03-28', 10, 10, NULL);


INSERT INTO medicamento_prescricao (dosagem, observacao, id_medicamento, id_prescricao) VALUES
(500, 'Tomar após as refeições', 1, 1),  -- Dipirona na Prescrição 1
(750, 'Gotejamento lento', 2, 1),       -- Paracetamol também na Prescrição 1 (Repetição de Prescrição)
(500, 'A cada 8 horas', 3, 2),          -- Amoxicilina na Prescrição 2
(10, 'Uso restrito hospitalar', 4, 3), 
(20, 'Aplicar via subcutânea', 5, 4),
(50, 'Pela manhã em jejum', 6, 5),
(20, 'Antes do café da manhã', 7, 6),
(25, 'Monitorar pressão', 8, 7),
(400, 'Se houver dor forte', 9, 8),
(500, 'Ciclo de 5 dias', 10, 9),
(500, 'Dose de reforço', 1, 10),        -- Repetição de Medicamento (Dipirona)
(750, 'Sintomático', 2, 10),            -- Repetição de Medicamento (Paracetamol)
(500, 'Manter hidratação', 1, 2),       -- Repetição de Medicamento e Prescrição
(20, 'Uso contínuo', 7, 2),             -- Omeprazol na Prescrição 2
(3, 'Dose única', 4, 4),                -- Morfina na Prescrição 4
(10, 'Verificar glicemia', 5, 5),       -- Insulina na Prescrição 5
(50, 'Não suspender sem aviso', 6, 6),
(25, 'Dose noturna', 8, 8),
(600, 'Composto anti-inflamatório', 9, 9),
(500, 'Observar reações', 10, 1);       -- Azitromicina na Prescrição 1

/*
 *  Update para ajuste no valor dos campos da tabela 
 */

UPDATE exame_laudo
SET 
    -- Gera uma data aleatória nos últimos 30 dias
    data_solicitacao = NOW() - (random() * INTERVAL '30 days'),
    -- Em alguns (50% de chance), define o resultado como 3 dias após a solicitação
    -- Nos outros, define como NULL (exame ainda sem resultado)
    data_resultado = CASE 
        WHEN random() > 0.5 THEN (NOW() - (random() * INTERVAL '30 days')) + INTERVAL '3 days'
        ELSE NULL 
    END
WHERE id BETWEEN 1 AND 10;


/*-- TELEFONE
INSERT INTO telefone (numero, tipo, principal, id_paciente, id_medico) VALUES
('1199000111', 'CELULAR', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 0), NULL),
('1133002222', 'FIXO', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 1), NULL),
('1198888333', 'WHATSAPP', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 2), NULL),
('2199000444', 'CELULAR', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 3), NULL),
('2133005555', 'COMERCIAL', true, NULL, (SELECT id FROM medico ORDER BY id LIMIT 1 OFFSET 0)),
('3199000666', 'CELULAR', true, NULL, (SELECT id FROM medico ORDER BY id LIMIT 1 OFFSET 1)),
('3133007777', 'FIXO', true, NULL, (SELECT id FROM medico ORDER BY id LIMIT 1 OFFSET 2)),
('4199000888', 'CELULAR', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 4), NULL),
('5199000999', 'WHATSAPP', true, NULL, (SELECT id FROM medico ORDER BY id LIMIT 1 OFFSET 3)),
('6199000000', 'CELULAR', true, (SELECT id FROM paciente ORDER BY id LIMIT 1 OFFSET 5), NULL);*/
