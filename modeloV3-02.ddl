-- Gerado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   em:        2020-06-19 22:32:26 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cliente_habilidade (
    cliente_cli_id      NUMBER NOT NULL,
    habilidade_hab_id   NUMBER NOT NULL,
    cli_hab_nivel       NUMBER NOT NULL
);

ALTER TABLE cliente_habilidade ADD CONSTRAINT cliente_habilidade_pk PRIMARY KEY ( cliente_cli_id,
                                                                                  habilidade_hab_id );

CREATE TABLE cliente_vagas (
    vagas_vgs_id     NUMBER NOT NULL,
    cliente_cli_id   NUMBER NOT NULL
);

ALTER TABLE cliente_vagas ADD CONSTRAINT cliente_vagas_pk PRIMARY KEY ( vagas_vgs_id,
                                                                        cliente_cli_id );

CREATE TABLE clientes (
    cli_id            NUMBER NOT NULL,
    cli_pnome         VARCHAR2(15),
    cli_nmeio         VARCHAR2(20),
    cli_unome         VARCHAR2(20),
    cli_sexo          VARCHAR2(1),
    cli_email         VARCHAR2(100),
    cli_telefone      VARCHAR2(15),
    cli_celular       VARCHAR2(16),
    cli_objetivo      VARCHAR2(150),
    cli_logradouro    VARCHAR2(50),
    cli_numero        VARCHAR2(10),
    cli_complemento   VARCHAR2(30),
    cli_cep           VARCHAR2(14),
    cli_bairro        VARCHAR2(25),
    cli_uf            VARCHAR2(5)
);

ALTER TABLE clientes ADD CHECK ( cli_id = 1 );

COMMENT ON TABLE clientes IS
    'Tabela contendo os dados dos clientes';

COMMENT ON COLUMN clientes.cli_id IS
    'numero do cadastro do cliente no site';

COMMENT ON COLUMN clientes.cli_pnome IS
    'nome do cliente';

COMMENT ON COLUMN clientes.cli_nmeio IS
    'nome do meio do cliente';

COMMENT ON COLUMN clientes.cli_unome IS
    'ultimo nome do cliente';

COMMENT ON COLUMN clientes.cli_sexo IS
    'sexo do cliente';

COMMENT ON COLUMN clientes.cli_email IS
    'email de cadastro do cliente';

COMMENT ON COLUMN clientes.cli_telefone IS
    'telefone do cliente';

COMMENT ON COLUMN clientes.cli_celular IS
    'celular do cliente';

COMMENT ON COLUMN clientes.cli_objetivo IS
    'pequeno resumo sobre o cliente';

COMMENT ON COLUMN clientes.cli_logradouro IS
    'endereco do cliente';

COMMENT ON COLUMN clientes.cli_numero IS
    'numero da residencia ou apartamento do cliente';

COMMENT ON COLUMN clientes.cli_complemento IS
    'complemento do endereco do cliente';

COMMENT ON COLUMN clientes.cli_cep IS
    'codigo de enderecamento postal do cliente';

COMMENT ON COLUMN clientes.cli_bairro IS
    'bairro em que o cliente reside';

COMMENT ON COLUMN clientes.cli_uf IS
    'sigla da unidade federativa onde reside o cliente';

ALTER TABLE clientes ADD CONSTRAINT cliente_pk PRIMARY KEY ( cli_id );

CREATE TABLE empresas (
    emp_id                    NUMBER NOT NULL,
    emp_cnpj                  VARCHAR2(20),
    emp_nome_fantasia         VARCHAR2(100),
    emp_descricao_atividade   VARCHAR2(100),
    emp_logradouro            VARCHAR2(100),
    emp_numero                VARCHAR2(9),
    emp_complemento           VARCHAR2(35),
    emp_bairro                VARCHAR2(25),
    emp_cidade                VARCHAR2(25),
    emp_estado                VARCHAR2(25),
    emp_uf                    VARCHAR2(2),
    emp_cep                   VARCHAR2(8)
);

COMMENT ON TABLE empresas IS
    'Tabela contendo os dados da empresa';

COMMENT ON COLUMN empresas.emp_id IS
    'Numero de cadastro da empresa no site';

COMMENT ON COLUMN empresas.emp_cnpj IS
    'Numero referente ao cadastro da empresa junto ao governo';

COMMENT ON COLUMN empresas.emp_nome_fantasia IS
    'nome pelo qual a empresa se apresenta';

COMMENT ON COLUMN empresas.emp_descricao_atividade IS
    'descricao dos ramos no qual a empresa atua';

COMMENT ON COLUMN empresas.emp_logradouro IS
    'endereco da empresa';

COMMENT ON COLUMN empresas.emp_numero IS
    'numero da empresa';

COMMENT ON COLUMN empresas.emp_complemento IS
    'complemento do endereco da empresa';

COMMENT ON COLUMN empresas.emp_bairro IS
    'bairro onde a empresa se localiza';

COMMENT ON COLUMN empresas.emp_cidade IS
    'cidade onde a empresa se localiza';

COMMENT ON COLUMN empresas.emp_estado IS
    'estado onde a empresa se localiza';

COMMENT ON COLUMN empresas.emp_uf IS
    'unidade federativa onde a empresa se localiza';

COMMENT ON COLUMN empresas.emp_cep IS
    'cep onde a empresa se localiza';

ALTER TABLE empresas ADD CONSTRAINT empresa_pk PRIMARY KEY ( emp_id );

CREATE TABLE habilidades (
    hab_id          NUMBER NOT NULL,
    hab_nome        VARCHAR2(100),
    hab_descricao   VARCHAR2(250)
);

COMMENT ON TABLE habilidades IS
    'Tabela contendo os dados das habilidades exigidas pela vaga e contidas pelo cliente';

COMMENT ON COLUMN habilidades.hab_id IS
    'Identificador do registro na tabela';

COMMENT ON COLUMN habilidades.hab_nome IS
    'Nome da habilidade';

ALTER TABLE habilidades ADD CONSTRAINT habilidade_pk PRIMARY KEY ( hab_id );

CREATE TABLE vagas (
    vgs_id                   NUMBER NOT NULL,
    vgs_titulo               VARCHAR2(50),
    vgs_categoria            VARCHAR2(50),
    vgs_descricao            VARCHAR2(150),
    vgs_tipo_contrato        VARCHAR2(10),
    vgs_anos_experiencia     VARCHAR2(20),
    vgs_nivel_escolaridade   VARCHAR2(15),
    vgs_publicacao           DATE,
    vgs_ultima_atualizacao   DATE,
    vgs_desativacao          DATE,
    empresa_emp_id           NUMBER NOT NULL
);

COMMENT ON TABLE vagas IS
    'Tabela contendo os dados das vagas com relação a cliente, empresa';

COMMENT ON COLUMN vagas.vgs_id IS
    'numero de cadastro da vaga no site';

COMMENT ON COLUMN vagas.vgs_titulo IS
    'nome da vaga';

COMMENT ON COLUMN vagas.vgs_categoria IS
    'categoria operacional da vaga';

COMMENT ON COLUMN vagas.vgs_descricao IS
    'descricao da vaga';

COMMENT ON COLUMN vagas.vgs_tipo_contrato IS
    'tipo de contrato da vaga';

COMMENT ON COLUMN vagas.vgs_anos_experiencia IS
    'qual a experiencia exigida por parte do candidato';

COMMENT ON COLUMN vagas.vgs_nivel_escolaridade IS
    'qual a escolaridade exigida por parte do candidato';

COMMENT ON COLUMN vagas.vgs_publicacao IS
    'data publicacao vaga';

COMMENT ON COLUMN vagas.vgs_ultima_atualizacao IS
    'quando ocorreu a ultima mudanca na vaga';

COMMENT ON COLUMN vagas.vgs_desativacao IS
    'data da desativacao da vaga';

ALTER TABLE vagas ADD CONSTRAINT vagas_pk PRIMARY KEY ( vgs_id );

CREATE TABLE vagas_habilidade (
    vagas_vgs_id        NUMBER NOT NULL,
    habilidade_hab_id   NUMBER NOT NULL,
    vgs_hab_nivel       NUMBER NOT NULL
);

ALTER TABLE vagas_habilidade ADD CONSTRAINT vagas_habilidade_pk PRIMARY KEY ( vagas_vgs_id,
                                                                              habilidade_hab_id );

ALTER TABLE cliente_vagas
    ADD CONSTRAINT cliente_vagas_cliente_fk FOREIGN KEY ( cliente_cli_id )
        REFERENCES clientes ( cli_id );

ALTER TABLE cliente_vagas
    ADD CONSTRAINT cliente_vagas_vagas_fk FOREIGN KEY ( vagas_vgs_id )
        REFERENCES vagas ( vgs_id );

ALTER TABLE cliente_habilidade
    ADD CONSTRAINT pk_clihab_cli FOREIGN KEY ( cliente_cli_id )
        REFERENCES clientes ( cli_id );

ALTER TABLE cliente_habilidade
    ADD CONSTRAINT pk_clihab_hab FOREIGN KEY ( habilidade_hab_id )
        REFERENCES habilidades ( hab_id );

ALTER TABLE vagas
    ADD CONSTRAINT vagas_empresa_fk FOREIGN KEY ( empresa_emp_id )
        REFERENCES empresas ( emp_id );

ALTER TABLE vagas_habilidade
    ADD CONSTRAINT vagas_habilidade_habilidade_fk FOREIGN KEY ( habilidade_hab_id )
        REFERENCES habilidades ( hab_id );

ALTER TABLE vagas_habilidade
    ADD CONSTRAINT vagas_habilidade_vagas_fk FOREIGN KEY ( vagas_vgs_id )
        REFERENCES vagas ( vgs_id );

CREATE SEQUENCE clientes_cli_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clientes_cli_id_trg BEFORE
    INSERT ON clientes
    FOR EACH ROW
    WHEN ( new.cli_id IS NULL )
BEGIN
    :new.cli_id := clientes_cli_id_seq.nextval;
END;
/

CREATE SEQUENCE empresas_emp_id_seq START WITH 1 MAXVALUE 9999999999999999999999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER empresas_emp_id_trg BEFORE
    INSERT ON empresas
    FOR EACH ROW
    WHEN ( new.emp_id IS NULL )
BEGIN
    :new.emp_id := empresas_emp_id_seq.nextval;
END;
/

CREATE SEQUENCE habilidades_hab_id_seq START WITH 1 MAXVALUE 9999999999999999999999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER habilidades_hab_id_trg BEFORE
    INSERT ON habilidades
    FOR EACH ROW
    WHEN ( new.hab_id IS NULL )
BEGIN
    :new.hab_id := habilidades_hab_id_seq.nextval;
END;
/

CREATE SEQUENCE vagas_vgs_id_seq START WITH 1 MAXVALUE 9999999999999999999999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER vagas_vgs_id_trg BEFORE
    INSERT ON vagas
    FOR EACH ROW
    WHEN ( new.vgs_id IS NULL )
BEGIN
    :new.vgs_id := vagas_vgs_id_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          4
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
