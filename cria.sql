CREATE TABLE dim_bairro (
    sk_regiao          NUMBER NOT NULL,
    sk_estado          NUMBER NOT NULL,
    sk_cidade          NUMBER NOT NULL,
    sk_bairro          NUMBER NOT NULL,
    nm_bairro          VARCHAR2(80) NOT NULL,
    nr_popul_bairro    NUMBER(6) NOT NULL,
    nr_nivel_seguranca NUMBER(1) NOT NULL
);

ALTER TABLE dim_bairro
    ADD CONSTRAINT pk_dim_bairro PRIMARY KEY ( sk_bairro,
                                               sk_cidade,
                                               sk_regiao,
                                               sk_estado );

CREATE TABLE dim_categoria (
    sk_categoria       NUMBER NOT NULL,
    nm_categoria       VARCHAR2(40) NOT NULL,
    st_categoria       CHAR(1) NOT NULL,
    nr_avaliacao_categ NUMBER(2) NOT NULL
);

ALTER TABLE dim_categoria ADD CONSTRAINT pk_dim_categoria PRIMARY KEY ( sk_categoria );

CREATE TABLE dim_centro_distrib (
    sk_regiao         NUMBER NOT NULL,
    sk_estado         NUMBER NOT NULL,
    sk_cidade         NUMBER NOT NULL,
    sk_bairro         NUMBER NOT NULL,
    sk_endereco       NUMBER NOT NULL,
    sk_centro_distrib NUMBER NOT NULL,
    cd_centro_distrib CHAR(6) NOT NULL,
    nm_centro_distrib VARCHAR2(60) NOT NULL
);


ALTER TABLE dim_centro_distrib
    ADD CONSTRAINT pk_dim_centro_distrib PRIMARY KEY ( sk_centro_distrib,
                                                       sk_endereco,
                                                       sk_bairro,
                                                       sk_cidade,
                                                       sk_regiao,
                                                       sk_estado );

CREATE TABLE dim_cidade (
    sk_regiao       NUMBER NOT NULL,
    sk_estado       NUMBER NOT NULL,
    sk_cidade       NUMBER NOT NULL,
    nm_cidade       VARCHAR2(80) NOT NULL,
    cd_ibge         NUMBER(7) NOT NULL,
    nr_popul_cidade NUMBER(8) NOT NULL,
    nr_altitude_mar NUMBER(6, 2) NOT NULL
);

ALTER TABLE dim_cidade
    ADD CONSTRAINT pk_dim_cidade PRIMARY KEY ( sk_cidade,
                                               sk_regiao,
                                               sk_estado );

CREATE TABLE dim_cliente (
    sk_regiao     NUMBER NOT NULL,
    sk_estado     NUMBER NOT NULL,
    sk_cidade     NUMBER NOT NULL,
    sk_bairro     NUMBER NOT NULL,
    sk_endereco   NUMBER NOT NULL,
    sk_cliente    NUMBER NOT NULL,
    nr_cliente    NUMBER NOT NULL,
    nm_cliente    VARCHAR2(80) NOT NULL,
    dt_nascimento DATE NOT NULL,
    st_cliente    CHAR(1) NOT NULL,
    nr_estrelas   NUMBER(1) NOT NULL
);


ALTER TABLE dim_cliente
    ADD CONSTRAINT pk_dim_cliente PRIMARY KEY ( sk_cliente,
                                                sk_endereco,
                                                sk_bairro,
                                                sk_cidade,
                                                sk_regiao,
                                                sk_estado );

CREATE TABLE dim_data (
    sk_data          NUMBER NOT NULL,
    nr_dia           NUMBER(2) NOT NULL,
    nr_mes           NUMBER(2) NOT NULL,
    nr_ano           NUMBER(4) NOT NULL,
    nr_trimestre     NUMBER(1) NOT NULL,
    nr_semestre      NUMBER(1) NOT NULL,
    nm_dia_da_semana VARCHAR2(7) NOT NULL,
    fl_fim_semana    CHAR(3) NOT NULL
);


ALTER TABLE dim_data ADD CONSTRAINT pk_dim_data PRIMARY KEY ( sk_data );

CREATE TABLE dim_endereco (
    sk_regiao         NUMBER NOT NULL,
    sk_estado         NUMBER NOT NULL,
    sk_cidade         NUMBER NOT NULL,
    sk_bairro         NUMBER NOT NULL,
    sk_endereco       NUMBER NOT NULL,
    nm_logradouro     VARCHAR2(120) NOT NULL,
    nr_logradouro     NUMBER(5),
    ds_complem_lograd VARCHAR2(30),
    nr_cep            NUMBER(8) NOT NULL
);


ALTER TABLE dim_endereco
    ADD CONSTRAINT pk_dim_endereco PRIMARY KEY ( sk_endereco,
                                                 sk_bairro,
                                                 sk_cidade,
                                                 sk_regiao,
                                                 sk_estado );

CREATE TABLE dim_entregador (
    sk_entregador NUMBER NOT NULL,
    nm_entregador VARCHAR2(80) NOT NULL
);

ALTER TABLE dim_entregador ADD CONSTRAINT pk_dim_entregador PRIMARY KEY ( sk_entregador );

CREATE TABLE dim_estado (
    sk_regiao    NUMBER NOT NULL,
    sk_estado    NUMBER NOT NULL,
    nm_estado    VARCHAR2(60) NOT NULL,
    sg_estado    CHAR(2) NOT NULL,
    nm_gentilico VARCHAR2(40) NOT NULL
);

ALTER TABLE dim_estado ADD CONSTRAINT pk_dim_estado PRIMARY KEY ( sk_regiao,
                                                                  sk_estado );

CREATE TABLE dim_produto (
    sk_categoria    NUMBER NOT NULL,
    sk_subcategoria NUMBER NOT NULL,
    sk_produto      NUMBER NOT NULL,
    nm_produto      VARCHAR2(80) NOT NULL,
    tp_embalagem    VARCHAR2(20) NOT NULL
);


ALTER TABLE dim_produto
    ADD CONSTRAINT pk_dim_produto PRIMARY KEY ( sk_produto,
                                                sk_categoria,
                                                sk_subcategoria );

CREATE TABLE dim_regiao (
    sk_regiao NUMBER NOT NULL,
    nm_regiao VARCHAR2(20) NOT NULL
);

ALTER TABLE dim_regiao ADD CONSTRAINT pk_dim_regiao PRIMARY KEY ( sk_regiao );

CREATE TABLE dim_subcategoria (
    sk_categoria          NUMBER NOT NULL,
    sk_subcategoria       NUMBER NOT NULL,
    nm_subcategoria       VARCHAR2(40) NOT NULL,
    st_subcategoria       CHAR(1) NOT NULL,
    nr_avaliacao_subcateg NUMBER(2) NOT NULL
);


ALTER TABLE dim_subcategoria ADD CONSTRAINT pk_dim_subcategoria PRIMARY KEY ( sk_subcategoria,
                                                                              sk_categoria );

CREATE TABLE fto_pedido_entrega (
    sk_produto           NUMBER NOT NULL,
    sk_categoria         NUMBER NOT NULL,
    sk_subcategoria      NUMBER NOT NULL,
    sk_data_prevista     NUMBER NOT NULL,
    sk_data_entrega      NUMBER NOT NULL,
    sk_data_pedido       NUMBER NOT NULL,
    sk_entregador        NUMBER NOT NULL,
    sk_centro_distrib    NUMBER NOT NULL,
    sk_endereco_cd       NUMBER NOT NULL,
    sk_bairro_cd         NUMBER NOT NULL,
    sk_cidade_cd         NUMBER NOT NULL,
    sk_estado_cd         NUMBER NOT NULL,
    sk_regiao_cd         NUMBER NOT NULL,
    sk_cliente           NUMBER NOT NULL,
    sk_end_cli           NUMBER NOT NULL,
    sk_bairro_cli        NUMBER NOT NULL,
    sk_cidade_cli        NUMBER NOT NULL,
    sk_estado_cli        NUMBER NOT NULL,
    sk_regiao_cli        NUMBER NOT NULL,
    nr_pedido            NUMBER NOT NULL,
    nr_item_pedido       NUMBER NOT NULL,
    vl_unitario          NUMBER(7, 2) NOT NULL,
    qt_produto           NUMBER(4) NOT NULL,
    vl_total             NUMBER(8, 2) NOT NULL,
    nr_percent_icms      NUMBER(4, 2) NOT NULL,
    qt_total_prod_entreg NUMBER(4) NOT NULL,
    nr_nota_embalagem    NUMBER(2),
    nr_nota_pontualidade NUMBER(2),
    nr_nota_cortesia     NUMBER(2),
    dt_pedido            DATE NOT NULL,
    dt_prevista_entrega  DATE NOT NULL,
    dt_oficial_entrega   DATE,
    nr_dias_entrega      NUMBER(3) NOT NULL,
    nr_minutos_entrega   NUMBER(6) NOT NULL,
    nr_dias_atraso       NUMBER(2) NOT NULL,
    fl_entrega_atrasada  CHAR(3) NOT NULL
);

COMMENT ON COLUMN fto_pedido_entrega.nr_pedido IS
    'Este atributo  representa o número do Pedido proveniente do e-commerce. O conteúdo será numérico e sequencial e deve ser preenchido na fase de ETL seguindo regras pré-estabelecidas.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_item_pedido IS
    'Este atributo  representa o número do Item do Pedido proveniente do e-commerce. O conteúdo será numérico e sequencial e deve ser preenchido na fase de ETL seguindo regras pré-estabelecidas.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.vl_unitario IS
    'Este atributo representa o valor unitário do produto no momento que o cliente adquiriu o produto, proveniente do e-commerce Melhores Compras. Seu conteúdo é numérico e obrigatório.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.qt_produto IS
    'Este atributo  representa a quantidade adquirida do produto feita pelo cliente no momento em que adquiriu o produto, proveniente do e-commerce Melhores Compras. Seu conteúdo é numérico e obrigatório.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.vl_total IS
    'Este atributo representa o valor total do produto no momento que o cliente adquiriu o produto, proveniente do e-commerce Melhores Compras. É um calculo que multiplica QT_PRODUTO pelo VL_UNITARIO. Conteúdo numérico e obrigatório.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_percent_icms IS
    'Este atributo representa o percentual  do ICMS a ser pago de imposto no momento que o cliente adquiriu o produto, proveniente do e-commerce Melhores Compras. Conteúdo numérico e obrigatório.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.qt_total_prod_entreg IS
    'Este atributo representa a quantidade total física entregue ao cliente. Seu conteúdo é numérico e obrigatório.';

COMMENT ON COLUMN fto_pedido_entrega.nr_nota_embalagem IS
    'Representa a nota fornecida pelo cliente referente à embalagem. Nota 0 (zero) representa uma  baixa avaliação, enquanto que nota 10 representa uma excelente entrega. Conteúdo numérico e opcional, pois nem todos os clientes efetuam a avaliação.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_nota_pontualidade IS
    'Atributo  representa a nota fornecida pelo cliente referente à pontualidade na percepção do cliente. Nota 0 (zero) representa uma  baixa avaliação, enquanto que nota 10 representa um excelente prazo de entrega. Conteúdo numérico e opcional, pois nem todos os clientes efetuam a avaliação.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_nota_cortesia IS
    'Esta coluna  representa a nota fornecida pelo cliente referente à cortesia do entregador na percepção do cliente. Nota 0 (zero) representa uma  baixa avaliação, enquanto que nota 10 representa uma excelente cordialidade do entregador. Conteúdo numérico e opcional, pois nem todos os clientes efetuam a avaliação.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.dt_pedido IS
    'Este atributo  representa a data completa em que foi gerado o Pedido proveniente do e-commerce Melhores Compras. Nessa data, obrigatória, temos o dia, mês, ano, hora e minuto feito pelo cliente.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.dt_prevista_entrega IS
    'Este atributo representa a data prevista de entrega do Pedido proveniente do e-commerce Melhores Compras. Nessa data, obrigatória, temos o dia, mês, ano, hora e minuto planejado para o cliente receber o pedido.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.dt_oficial_entrega IS
    'Este atributo representa a data real de entrega do Pedido proveniente do e-commerce Melhores Compras. Nessa data, obrigatória, temos o dia, mês, ano, hora e minuto que o cliente recebeu o pedido.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_dias_entrega IS
    'Este atributo é uma medida que será calculada no momento do ETL, e consiste na diferença em dias entre DT_OFICIAL_ENTREGA e DT_PEDIDO.
';

COMMENT ON COLUMN fto_pedido_entrega.nr_minutos_entrega IS
    'Este atributo é uma medida que será calculada no momento do ETL, e consiste na diferença em minutos entre DT_OFICIAL_ENTREGA e DT_PEDIDO.'
    ;

COMMENT ON COLUMN fto_pedido_entrega.nr_dias_atraso IS
    'Este atributo é uma medida que será calculada no momento do ETL, e consiste na diferença em dias entre DT_OFICIAL_ENTREGA e DT_PREVISTA_ENTREGA (se negativo, entrega adiantada). '
    ;

COMMENT ON COLUMN fto_pedido_entrega.fl_entrega_atrasada IS
    'Este atributo é uma flag que indica se a entrega chegou atrasada ou não, possui o conteúdo do tipo char, obrigatório, SIM ou NAO. Será preenchido no momento do ETL.'
    ;

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT pk_fto_pedido_entrega PRIMARY KEY ( sk_produto,
                                                       sk_subcategoria,
                                                       sk_categoria,
                                                       sk_data_prevista,
                                                       sk_data_pedido,
                                                       sk_data_entrega,
                                                       sk_centro_distrib,
                                                       sk_endereco_cd,
                                                       sk_bairro_cd,
                                                       sk_cidade_cd,
                                                       sk_regiao_cd,
                                                       sk_estado_cd,
                                                       sk_cliente,
                                                       sk_end_cli,
                                                       sk_bairro_cli,
                                                       sk_cidade_cli,
                                                       sk_regiao_cli,
                                                       sk_estado_cli,
                                                       sk_entregador );

ALTER TABLE dim_bairro
    ADD CONSTRAINT fk_d_bairro_d_cid FOREIGN KEY ( sk_cidade,
                                                   sk_regiao,
                                                   sk_estado )
        REFERENCES dim_cidade ( sk_cidade,
                                sk_regiao,
                                sk_estado );

ALTER TABLE dim_subcategoria
    ADD CONSTRAINT fk_d_cat_d_subcat FOREIGN KEY ( sk_categoria )
        REFERENCES dim_categoria ( sk_categoria );

ALTER TABLE dim_centro_distrib
    ADD CONSTRAINT fk_d_cd_d_end FOREIGN KEY ( sk_endereco,
                                               sk_bairro,
                                               sk_cidade,
                                               sk_regiao,
                                               sk_estado )
        REFERENCES dim_endereco ( sk_endereco,
                                  sk_bairro,
                                  sk_cidade,
                                  sk_regiao,
                                  sk_estado );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_cd_f_ped_entrg FOREIGN KEY ( sk_centro_distrib,
                                                     sk_endereco_cd,
                                                     sk_bairro_cd,
                                                     sk_cidade_cd,
                                                     sk_regiao_cd,
                                                     sk_estado_cd )
        REFERENCES dim_centro_distrib ( sk_centro_distrib,
                                        sk_endereco,
                                        sk_bairro,
                                        sk_cidade,
                                        sk_regiao,
                                        sk_estado );

ALTER TABLE dim_cidade
    ADD CONSTRAINT fk_d_cid_d_estad FOREIGN KEY ( sk_regiao,
                                                  sk_estado )
        REFERENCES dim_estado ( sk_regiao,
                                sk_estado );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_cli_f_ped_entrg FOREIGN KEY ( sk_cliente,
                                                      sk_end_cli,
                                                      sk_bairro_cli,
                                                      sk_cidade_cli,
                                                      sk_regiao_cli,
                                                      sk_estado_cli )
        REFERENCES dim_cliente ( sk_cliente,
                                 sk_endereco,
                                 sk_bairro,
                                 sk_cidade,
                                 sk_regiao,
                                 sk_estado );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_dt_entrg_f_ped FOREIGN KEY ( sk_data_entrega )
        REFERENCES dim_data ( sk_data );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_dt_ped_fto_ped FOREIGN KEY ( sk_data_pedido )
        REFERENCES dim_data ( sk_data );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_dt_prev_fto_ped FOREIGN KEY ( sk_data_prevista )
        REFERENCES dim_data ( sk_data );

ALTER TABLE dim_endereco
    ADD CONSTRAINT fk_d_end_d_bair FOREIGN KEY ( sk_bairro,
                                                 sk_cidade,
                                                 sk_regiao,
                                                 sk_estado )
        REFERENCES dim_bairro ( sk_bairro,
                                sk_cidade,
                                sk_regiao,
                                sk_estado );

ALTER TABLE dim_cliente
    ADD CONSTRAINT fk_d_end_d_cli FOREIGN KEY ( sk_endereco,
                                                sk_bairro,
                                                sk_cidade,
                                                sk_regiao,
                                                sk_estado )
        REFERENCES dim_endereco ( sk_endereco,
                                  sk_bairro,
                                  sk_cidade,
                                  sk_regiao,
                                  sk_estado );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_entrg_f_ped_entrg FOREIGN KEY ( sk_entregador )
        REFERENCES dim_entregador ( sk_entregador );

ALTER TABLE dim_estado
    ADD CONSTRAINT fk_d_estad_d_reg FOREIGN KEY ( sk_regiao )
        REFERENCES dim_regiao ( sk_regiao );

ALTER TABLE fto_pedido_entrega
    ADD CONSTRAINT fk_d_prod_f_ped_entrg FOREIGN KEY ( sk_produto,
                                                       sk_categoria,
                                                       sk_subcategoria )
        REFERENCES dim_produto ( sk_produto,
                                 sk_categoria,
                                 sk_subcategoria );

ALTER TABLE dim_produto
    ADD CONSTRAINT fk_d_subcat_d_prod FOREIGN KEY ( sk_subcategoria,
                                                    sk_categoria )
        REFERENCES dim_subcategoria ( sk_subcategoria,
                                      sk_categoria );

