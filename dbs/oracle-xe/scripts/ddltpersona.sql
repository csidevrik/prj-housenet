CREATE TABLE TPERSONA
(
IDPERSONA	NUMBER(8,0) NOT NULL ENABLE,
FHASTA TIMESTAMP(6)  NOT NULL ENABLE,
FDESDE TIMESTAMP(6) NOT NULL ENABLE,
IDENTIFICACION	VARCHAR2(19 BYTE),
NOMBRE VARCHAR2(200 BYTE),
FECHANACIMIENTO DATE,
IDEMPLEADOINGRESO NUMBER(8,0),
IDEMPLEADOMOD NUMBER(8,0)
);

ALTER TABLE TPERSONA  ADD  CONSTRAINT PK_TPERID PRIMARY KEY (IDPERSONA,FHASTA);

