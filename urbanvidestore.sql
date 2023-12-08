-- @Project : UrbanVibeStore
-- @Authors : Núñez Quintana Luis Axel y Vargas Pacheco Bryan
-- @Date : 03/12/2023
-- Target DBMS : MySQL

-- 
-- TABLE: ARTICULO 
--
CREATE TABLE ARTICULO(
    ARTICULO_ID  INT NOT NULL,
    NOMBRE       VARCHAR(40) NOT NULL,
    PRECIO       INT NOT NULL,
    SUCURSAL_ID  INT NOT NULL,
    PRIMARY KEY (ARTICULO_ID)
);

-- 
-- TABLE: CLIENTE 
--
CREATE TABLE CLIENTE(
    CLIENTE_ID   INT NOT NULL,
    NOMBRE       VARCHAR(40) NOT NULL,
    AP_PAT       VARCHAR(40) NOT NULL,
    AP_MAT       VARCHAR(40) NOT NULL,
    SUCURSAL_ID  INT NOT NULL,
    PRIMARY KEY (CLIENTE_ID),
    UNIQUE KEY CliENTE_NOMBRE_AP_PAT_AP_MAT_UK (NOMBRE, AP_PAT, AP_MAT)
);

-- 
-- TABLE: GUIA_ENVIO 
--
CREATE TABLE GUIA_ENVIO(
    GUIA_ENVIO_ID  INT NOT NULL,
    NUM_SERIE      VARCHAR(40) NOT NULL,
    CLIENTE_ID     INT NOT NULL,
    ARTICULO_ID    INT NOT NULL,
    SUCURSAL_ID    INT NOT NULL,
    PRIMARY KEY (GUIA_ENVIO_ID),
    UNIQUE KEY GUIA_ENVIO_NUM_SERIE_UK (NUM_SERIE)
);

-- 
-- TABLE: SUCURSAL 
--
CREATE TABLE SUCURSAL(
    SUCURSAL_ID  INT NOT NULL,
    NOMBRE       VARCHAR(40) NOT NULL,
    DIRECCION    VARCHAR(40) NOT NULL,
    PRIMARY KEY (SUCURSAL_ID),
    UNIQUE KEY SUCURSAL_DIRECCION_UK (DIRECCION)
);

-- 
-- INDEX: IX_ARTICULO_SUCURSAL_ID_FK 
--
CREATE INDEX IX_ARTICULO_SUCURSAL_ID_FK ON ARTICULO(SUCURSAL_ID);

-- 
-- INDEX: IX_CLIENTE_SUCURSAL_ID_FK 
--
CREATE INDEX IX_CLIENTE_SUCURSAL_ID_FK ON CLIENTE(SUCURSAL_ID);

-- 
-- INDEX: IX_GUIA_ENVIO_CLIENTE_ID_FK 
--
CREATE INDEX IX_GUIA_ENVIO_CLIENTE_ID_FK ON GUIA_ENVIO(CLIENTE_ID);

-- 
-- INDEX: IX_GUIA_ENVIO_ARTICULO_ID_FK 
--
CREATE INDEX IX_GUIA_ENVIO_ARTICULO_ID_FK ON GUIA_ENVIO(ARTICULO_ID);

-- 
-- INDEX: IX_GUIA_ENVIO_SUCURSAL_ID_FK 
--
CREATE INDEX IX_GUIA_ENVIO_SUCURSAL_ID_FK ON GUIA_ENVIO(SUCURSAL_ID);

-- 
-- TABLE: ARTICULO_SUCURSAL_ID_FK 
--
ALTER TABLE ARTICULO ADD CONSTRAINT ARTICULO_SUCURSAL_ID_FK 
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL(SUCURSAL_ID);

-- 
-- TABLE: CLIENTE_SUCURSAL_ID_FK 
--
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_SUCURSAL_ID_FK 
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL(SUCURSAL_ID);

-- 
-- TABLE: GUIA_ENVIO_CLIENTE_ID_FK 
--
ALTER TABLE GUIA_ENVIO ADD CONSTRAINT GUIA_ENVIO_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE(CLIENTE_ID);

-- 
-- TABLE: GUIA_ENVIO_ARTICULO_ID_FK 
--
ALTER TABLE GUIA_ENVIO ADD CONSTRAINT GUIA_ENVIO_ARTICULO_ID_FK 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID);

-- 
-- TABLE: GUIA_ENVIO_SUCURSAL_ID_FK 
--
ALTER TABLE GUIA_ENVIO ADD CONSTRAINT GUIA_ENVIO_SUCURSAL_ID_FK 
    FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL(SUCURSAL_ID);
