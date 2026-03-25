# 📚 Sistema de Empréstimo de Livros - Banco de Dados

## 👥 Integrantes do Grupo

* Caique Simões de Araújo
* Juliano Coelho
* Rayla Martins
* Leonardo de Mattos Veiga
* Emily Neves da Silva

## 📌 Descrição do Projeto

Este projeto tem como objetivo o desenvolvimento de um banco de dados para gerenciar o empréstimo de livros.

O sistema permite:

* Cadastro de autores e seus respectivos livros
* Cadastro de usuários
* Controle de empréstimos de livros
* Relacionamento entre autores, livros e usuários

## 🧠 Regras de Negócio

* Um **autor pode ter vários livros**
* Um **livro pertence a apenas um autor**
* Um **usuário pode pegar vários livros emprestados**
* Um **livro pode ser emprestado várias vezes**

### 🔐 Integridade Referencial

* Ao excluir um **autor**, todos os seus **livros serão excluídos automaticamente**
* Não é permitido atualizar o `id_autor` caso existam livros vinculados a ele

## 🗂️ Modelagem do Banco de Dados

### 📊 Modelo Conceitual

### 🧩 Modelo Lógico

### 🏗️ Modelo Físico

## 💾 Inserção de Dados

