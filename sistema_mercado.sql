CREATE DATABASE modelo_fisico;
USE modelo_fisico;

-- Criação da tabela de fornecedores
CREATE TABLE tbl_fornecedores (
    id int not null primary key auto_increment,
    nome VARCHAR(100) not null,
    contato VARCHAR(50) not null,
    telefone VARCHAR(20) not null,
    endereco VARCHAR(255) not null
);

-- Criação da tabela de produtos
CREATE TABLE tbl_produtos (
    id int not null primary key auto_increment,
    nome VARCHAR(100) not null,
    categoria VARCHAR(50) not null,
    preco DECIMAL(10, 2) not null,
    estoque INT not null,
    validade DATE not null,
    id_fornecedor INT not null,
    constraint FK_produtos_fornecedor foreign key (id_fornecedor) references tbl_fornecedores(id)
);

-- Criação da tabela de clientes
CREATE TABLE tbl_clientes (
    id int not null primary key auto_increment,
    nome VARCHAR(100) not null,
    cpf varchar(11) not null,
    data_nascimento DATE not null,
    endereco VARCHAR(255) not null,
    telefone VARCHAR(20) not null,
    email VARCHAR(100) not null
);

-- Criação da tabela de colaboradores
CREATE TABLE tbl_colaboradores (
    id int not null primary key auto_increment,
    nome VARCHAR(100) not null,
    cpf varchar(11) not null,
    cargo VARCHAR(50) not null,
    data_contratacao DATE not null,
    salario DECIMAL(10, 2) not null
);

-- Criação da tabela de pagamentos
CREATE TABLE tbl_pagamentos (
    id int not null primary key auto_increment,
    tipo_pagamento VARCHAR(50) not null,
    detalhes VARCHAR(100) not null
);

-- Criação da tabela de vendas
CREATE TABLE tbl_vendas (
    id int not null primary key auto_increment,
    data_venda DATE not null,
    id_clientes INT not null,
    id_colaboradores INT not null,
    id_pagamentos INT not null,
    constraint FK_vendas_cliente foreign key (id_clientes) references tbl_clientes(id),
    constraint FK_vendas_colaborador foreign key (id_colaboradores) references tbl_colaboradores(id),
    constraint FK_vendas_pagamento foreign key (id_pagamentos) references tbl_pagamentos(id)
);

-- Tabela de junção para associar produtos às vendas
CREATE TABLE tbl_venda_produtos (
    id_vendas INT not null,
    id_produtos INT not null,
    quantidade INT not null,
    constraint FK_vendass foreign key (id_vendas) references tbl_vendas(id),
    constraint FK_vendas_produto foreign key (id_produtos) references tbl_produtos(id)
);
