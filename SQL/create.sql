DROP TABLE IF EXISTS USUARIO CASCADE;
DROP TABLE IF EXISTS JOGO CASCADE;
DROP TABLE IF EXISTS CHAVE CASCADE;
DROP TABLE IF EXISTS CLIENTE CASCADE;
DROP TABLE IF EXISTS TITULAR CASCADE;
DROP TABLE IF EXISTS CLIENTE_JOGO CASCADE;
DROP TABLE IF EXISTS JOGO_TITULAR CASCADE;

CREATE TABLE USUARIO (
    id serial PRIMARY KEY,
    nome varchar(50),
    apelido varchar(20),
    email varchar(50),
    senha varchar(100)
);

CREATE TABLE JOGO (
    id serial PRIMARY KEY,
    nome varchar(50),
    descricao varchar(200),
    preco real
);

CREATE TABLE CHAVE (
    id serial PRIMARY KEY,
    chave varchar(50),
    data timestamp,
    FK_JOGO_id serial
);

CREATE TABLE CLIENTE (
    saldo real,
    FK_USUARIO_id serial PRIMARY KEY
);

CREATE TABLE TITULAR (
    id serial PRIMARY KEY,
    nome varchar(50),
    senha varchar(100)
);

CREATE TABLE CLIENTE_JOGO (
    data timestamp,
    preco_efetivo real,
    FK_CLIENTE_FK_USUARIO_id serial,
    FK_JOGO_id serial
);

CREATE TABLE JOGO_TITULAR (
    FK_TITULAR_id serial,
    FK_JOGO_id serial
);

ALTER TABLE CHAVE ADD CONSTRAINT FK_CHAVE_2
    FOREIGN KEY (FK_JOGO_id)
    REFERENCES JOGO (id)
    ON DELETE RESTRICT;

ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_2
    FOREIGN KEY (FK_USUARIO_id)
    REFERENCES USUARIO (id)
    ON DELETE CASCADE;

ALTER TABLE CLIENTE_JOGO ADD CONSTRAINT FK_CLIENTE_JOGO_1
    FOREIGN KEY (FK_CLIENTE_FK_USUARIO_id)
    REFERENCES CLIENTE (FK_USUARIO_id);

ALTER TABLE CLIENTE_JOGO ADD CONSTRAINT FK_CLIENTE_JOGO_2
    FOREIGN KEY (FK_JOGO_id)
    REFERENCES JOGO (id);

ALTER TABLE JOGO_TITULAR ADD CONSTRAINT FK_JOGO_TITULAR_1
    FOREIGN KEY (FK_TITULAR_id)
    REFERENCES TITULAR (id)
    ON DELETE RESTRICT;

ALTER TABLE JOGO_TITULAR ADD CONSTRAINT FK_JOGO_TITULAR_2
    FOREIGN KEY (FK_JOGO_id)
    REFERENCES JOGO (id)
    ON DELETE SET NULL;