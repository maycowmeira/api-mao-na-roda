CREATE EXTENSION IF NOT EXISTS postgis;
CREATE SCHEMA IF NOT EXISTS cadeirante;

CREATE TABLE cadeirante.genero (
    genero_id   serial CONSTRAINT firstkey PRIMARY KEY,
    descricao   varchar(40) NOT NULL
);

CREATE TABLE cadeirante.perfil (
    perfil_id   serial CONSTRAINT firstkey1 PRIMARY KEY,
    descricao   varchar(40) NOT NULL
);

CREATE TABLE cadeirante.escolaridade (
    escolaridade_id   serial CONSTRAINT firstkey2 PRIMARY KEY,
    descricao         varchar(40) NOT NULL
);

CREATE TABLE cadeirante.usuario (
    usuario_id          serial CONSTRAINT firstkey3 PRIMARY KEY,
    escolaridade_id     integer REFERENCES cadeirante.escolaridade (escolaridade_id),
    perfil_id           integer REFERENCES cadeirante.perfil (perfil_id),
    genero_id           integer REFERENCES cadeirante.genero (genero_id),
    nome                varchar(90) NOT NULL,
    email               varchar(40) NOT NULL,
    password_digest     varchar(200) NOT NULL,
    ano                 integer,
    profissao           varchar(90),
    restricao           varchar(140),
    restricao_outras    varchar(140)
);

CREATE TABLE  cadeirante.dificuldade_cod (
    dificuldade_cod_id    serial CONSTRAINT firstkey4 PRIMARY KEY,
    nome                  varchar(90) NOT NULL
);

CREATE TABLE cadeirante.dificuldade (
    dificuldade_id        serial CONSTRAINT firstkey7 PRIMARY KEY,
    usuario_id            integer REFERENCES cadeirante.usuario (usuario_id),
    dificuldade_cod_id    integer REFERENCES cadeirante.dificuldade_cod (dificuldade_cod_id),
    valor                 integer
);

CREATE TABLE cadeirante.resultado (
    resultado_id  serial CONSTRAINT firstkey5 PRIMARY KEY,
    descricao     varchar(40) NOT NULL
);

CREATE TABLE cadeirante.tipo_marcacao (
    tipo_marcacao_id     serial CONSTRAINT firstkey8 PRIMARY KEY,
    descricao   varchar(40) NOT NULL
);

CREATE TABLE cadeirante.problema (
    problema_id         serial CONSTRAINT firstkey9 PRIMARY KEY,
    usuario_id          integer REFERENCES cadeirante.usuario (usuario_id),
    tipo_marcacao_id             integer REFERENCES cadeirante.tipo_marcacao (tipo_marcacao_id),
    lat_inicio          double precision NOT NULL,
    long_inicio         double precision NOT NULL,
    lat_final           double precision NOT NULL,
    long_final          double precision NOT NULL,
    -- calcada             geometry NOT NULL,
    data_hora_reporte   timestamp NOT NULL,
    descricao           varchar(40)
);

CREATE TABLE cadeirante.solucao (
    solucao_id    serial CONSTRAINT firstkey6 PRIMARY KEY,
    usuario_id    integer REFERENCES cadeirante.usuario (usuario_id),
    resultado_id  integer REFERENCES cadeirante.resultado (resultado_id),
    problema_id   integer REFERENCES cadeirante.problema (problema_id),
    data_hora     timestamp NOT NULL,
    descricao     varchar(40)
);
-- SELECT AddGeometryColumn ('cadeirante','problema','calcada',4326,'LINESTRING',2);

CREATE TABLE cadeirante.registro (
    registro_id   serial CONSTRAINT firstkey10 PRIMARY KEY,
    problema_id   integer REFERENCES cadeirante.problema (problema_id),
    foto_url      varchar(140),
    descricao     varchar(40)
);