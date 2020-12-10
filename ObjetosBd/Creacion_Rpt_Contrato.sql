--------------------------------------------------------
--  DDL for Table RPT_CONTRATO
--------------------------------------------------------

  CREATE TABLE "RECA_DB"."RPT_CONTRATO" 
   (	
   "CONSECUTIVO_REPORTE" VARCHAR2(30 BYTE), 
	 "REGISTRO" NUMBER(10,0), 
	 "INSCRIPCION" NUMBER(10,0) DEFAULT 0, 
	 "NRO_CONTRATO" VARCHAR2(120 BYTE), 
	 "NIT_PROPONENTE" VARCHAR2(15 BYTE), 
	 "FECHA_ADJUDICACION" DATE, 
   "FECHA_INICIO" DATE, 
	 "FECHA_TERMINACION" DATE, 
	 "CLASIFICACION" VARCHAR2(700 BYTE), 
	 "TIPO_CONTRATISTA" NUMBER(1,0), 
	 "VALOR" NUMBER(20,2) DEFAULT 0, 
	 "VALOR_PAGADO" NUMBER(20,2) DEFAULT 0, 
	 "INDICADOR_CUMPLIMIENTO" CHAR(1 BYTE), 
	 "ESTADO" NUMBER(1,0), 
	 "INDICADOR_ENVIO" NUMBER(1,0), 
	 "TIPO_IDENTIFICACION" VARCHAR2(2 BYTE), 
	 "FECHA_PERFECCIONAMIENTO" DATE, 
	 "FECHA_LIQUIDACION" DATE, 
	 "CODIGO_ACTIVIDAD" NUMBER(1,0), 
	 "CODIGO_CIIU" VARCHAR2(128 BYTE), 
	 "MOTIVO_TERMINACION_ANTICIPADA" VARCHAR2(512 BYTE), 
	 "FECHA_ACTO_TERMINACION_ANT" DATE, 
	 "OBSERVACIONES" VARCHAR2(512 BYTE), 
	 "CODIGO_CAMARA" VARCHAR2(2 BYTE), 
	 "CODIGO_LIBRO_REGISTRADO" VARCHAR2(2 BYTE), 
	 "FECHA_INSCRIPCION" DATE, 
	 "FECHA_RADICACION_RUE" DATE, 
	 "NRO_RADICACION_RUE" NUMBER(8,0), 
	 "SW_DECRETO734" NUMBER(1,0) DEFAULT (0), 
	 "NIT_ENTIDAD" VARCHAR2(20 BYTE), 
	 "SW_RUES" NUMBER(1,0) DEFAULT (0), 
	 "NRO_CONTRATO_SECOP" VARCHAR2(20 BYTE), 
	 "CLASIFICADOR_BS" VARCHAR2(512 BYTE), 
	 "OBJETO_CONTRATO" VARCHAR2(512 BYTE), 
	 "MOTIVO_CESION_CONTRATO" VARCHAR2(512 BYTE), 
	 "FECHA_CESION_CONTRATO" DATE, 
	 "CONTRATO_RELACIONADO" CHAR(1 BYTE)
   ) 
  TABLESPACE "RECADATA" ;
 

   COMMENT ON COLUMN "RECA_DB"."RPT_CONTRATO"."NRO_CONTRATO_SECOP" IS 'N�mero de contrato de acuerdo al SECOP';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_CONTRATO"."CLASIFICADOR_BS" IS 'C�digo del clasificador de bienes y servicios en el que se clasifica el contrato reportado';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_CONTRATO"."OBJETO_CONTRATO" IS 'Descripci�n del objeto del contrato por parte de la entidad estatal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_CONTRATO"."MOTIVO_CESION_CONTRATO" IS 'Motivo de la cesi�n del contrato por parte de la anterior entidad estatal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_CONTRATO"."FECHA_CESION_CONTRATO" IS 'Fecha del acto administrativo por el cual la entidad anterior cedi� el contrato.';

ALTER TABLE RPT_CONTRATO 
ADD (NOMBRE_ENTIDAD VARCHAR2(500) );

ALTER TABLE RPT_CONTRATO 
ADD (MUNICIPIO_ENTIDAD NUMBER );

ALTER TABLE RPT_CONTRATO 
ADD (AREA_ENTIDAD VARCHAR2(200) );

COMMENT ON COLUMN RPT_CONTRATO.NOMBRE_ENTIDAD IS 'Nombre de la entidad que reporta';

COMMENT ON COLUMN RPT_CONTRATO.MUNICIPIO_ENTIDAD IS 'C�digo dane del municipio de la entidad que reporta';

COMMENT ON COLUMN RPT_CONTRATO.AREA IS 'Area de la entidad que reporta';




