# 🏥 Sistema de Banco de Dados - Hospital

## 👥 Integrantes do Grupo

* Caique Simões de Araújo
* Juliano Coelho
* Rayla Martins
* Leonardo de Mattos Veiga
* Emily Neves da Silva

## 📌 Descrição do Projeto

Este projeto foi desenvolvido como trabalho final da disciplina de Banco de Dados.
O objetivo é modelar e implementar um banco de dados completo para um sistema hospitalar, incluindo desde o modelo conceitual até consultas SQL.

O sistema contempla o gerenciamento de:

* Pacientes
* Médicos e Enfermeiras
* Atendimentos
* Internações
* Exames e Laudos
* Medicamentos e Prescrições
* Planos de Saúde
* Faturamento
* Pesquisa de Satisfação

## 🧠 Modelagem do Banco

O projeto foi desenvolvido em três etapas:

* 📊 Modelo Conceitual (DER)
* 🧩 Modelo Lógico
* 💾 Modelo Físico (SQL)

## 🏗️ Tecnologias Utilizadas

* PostgreSQL
* DBeaver
* SQL (DDL e DML)

## 📂 Estrutura do Projeto

* `ddl.sql` → criação das tabelas
* `dml.sql` → inserção de dados
* `consultas.sql` → consultas do sistema
* `der.png` → diagrama entidade-relacionamento

## 🧾 Funcionalidades Implementadas

### 🏥 Gestão Hospitalar

* Cadastro de hospitais, alas e leitos
* Controle de ocupação de leitos

### 👨‍⚕️ Profissionais

* Cadastro de médicos e enfermeiras
* Controle de especialidades

### 🧑 Pacientes

* Cadastro de pacientes
* Associação com planos de saúde

### 📋 Atendimentos

* Registro de consultas, emergências e revisões
* Histórico de atendimentos

### 💊 Prescrições

* Prescrição de medicamentos por atendimento

### 🧪 Exames

* Solicitação e registro de exames
* Controle de resultados e laudos

### 🏥 Internações

* Controle de entrada e saída de pacientes
* Regra de uma internação ativa por paciente

### 💰 Faturamento

* Geração de faturas
* Controle de pagamento

### 📊 Pesquisa de Satisfação

* Avaliação de atendimentos
* Feedback dos pacientes

## ⚠️ Regras de Negócio

* Um paciente não pode possuir duas internações ativas simultaneamente
* A data de saída deve ser maior que a data de entrada
* O nome do plano de saúde é único
* Cada atendimento deve registrar médico e paciente

## 🔍 Consultas SQL Implementadas

* Médicos por especialidade
* Pacientes por plano de saúde
* Exames pendentes
* Internações ativas
* Atendimentos por médico
* Médico com maior número de atendimentos
* Ocupação de leitos por ala
* Faturamento por plano de saúde
* Medicamentos mais prescritos

## 📌 Observações

Este projeto tem fins acadêmicos e foi desenvolvido para prática de modelagem e manipulação de banco de dados.
