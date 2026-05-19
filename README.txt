
# 🗄️ Projeto Banco de Dados

![MySQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)

![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=database&logoColor=white)

![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

Projeto desenvolvido com o objetivo de praticar conceitos de **Banco de Dados Relacional**, utilizando comandos SQL para criação, manipulação e gerenciamento de dados.

O projeto simula operações em banco de dados aplicando conceitos fundamentais de modelagem e consultas SQL.

---

# 🚀 Tecnologias Utilizadas

- MySQL
- SQL
- Git e GitHub
- Modelagem de Banco de Dados
- VS Code / MySQL Workbench

---

# 📚 Conceitos Aplicados

- Modelagem Relacional
- Criação de Tabelas
- Relacionamentos
- Chaves Primárias
- Chaves Estrangeiras
- Constraints
- Consultas SQL
- INSERT
- UPDATE
- DELETE
- SELECT
- JOIN
- Normalização de Dados

---

# ✅ Funcionalidades

- [x] Criação de banco de dados
- [x] Criação de tabelas
- [x] Inserção de dados
- [x] Atualização de registros
- [x] Exclusão de dados
- [x] Consultas SQL
- [x] Relacionamento entre tabelas
- [x] Manipulação de dados

---

# 📁 Estrutura do Projeto

```bash
📦 projeto-banco-de-dados
 ┣ 📂 scripts
 ┃ ┣ 📄 create.sql
 ┃ ┣ 📄 insert.sql
 ┃ ┣ 📄 select.sql
 ┃ ┗ 📄 update.sql
 ┣ 📄 README.md
 ┗ 📄 .gitignore
```

---

# ▶️ Como Executar o Projeto

## 1️⃣ Clonar o repositório

```bash
git clone https://github.com/CaiqueS-araujo/projeto-banco-de-dados.git
```

---

## 2️⃣ Abrir no MySQL Workbench

Abra os arquivos `.sql` utilizando:

- MySQL Workbench
- DBeaver
- VS Code
- Outro gerenciador SQL

---

## 3️⃣ Executar os Scripts

Execute os scripts SQL na ordem desejada para criar e manipular o banco de dados.

---

# 💻 Exemplos de Comandos SQL

## Criação de tabela

```sql
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);
```

---

## Inserção de dados

```sql
INSERT INTO clientes(nome, email)
VALUES ('Caique', 'caique@email.com');
```

---

## Consulta de dados

```sql
SELECT * FROM clientes;
```

---

# 🎯 Objetivo do Projeto

Este projeto foi desenvolvido para praticar os principais conceitos de banco de dados relacionais, consultas SQL e modelagem de dados, além de reforçar a lógica de manipulação de informações em sistemas.

---

# 👨‍💻 Desenvolvedor

* Caique Simões de Araújo
* Juliano Coelho
* Rayla Martins
* Leonardo de Mattos Veiga
* Emily Neves da Silva

---

# 📄 Licença

Projeto desenvolvido para fins educacionais.

### 🏗️ Modelo Físico

## 💾 Inserção de Dados

