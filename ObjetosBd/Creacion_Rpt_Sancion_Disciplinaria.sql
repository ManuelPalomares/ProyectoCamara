--------------------------------------------------------
--  DDL for Table RPT_SANCION_DISCIPLINARIA
--------------------------------------------------------

  CREATE TABLE "RECA_DB"."RPT_SANCION_DISCIPLINARIA" 
   (	"CONSECUTIVO_REPORTE" VARCHAR2(30 BYTE), 
	"REGISTRO" NUMBER(10,0), 
	"CONSECUTIVO" NUMBER, 
	"NIT_ENTIDAD" VARCHAR2(20 BYTE), 
	"INSCRIPCION" NUMBER(10,0) DEFAULT 0, 
	"CODIGO_CAMARA" VARCHAR2(2 BYTE), 
	"CODIGO_LIBRO_REGISTRADO" VARCHAR2(2 BYTE), 
	"FECHA_INSCRIPCION" DATE, 
	"TIPO_IDENTIFICACION" VARCHAR2(2 BYTE), 
	"NIT_PROPONENTE" VARCHAR2(20 BYTE), 
	"NOMBRE_PROPONENTE" VARCHAR2(128 BYTE), 
	"ACTO_ADMINISTRATIVO" VARCHAR2(40 BYTE), 
	"FECHA_ACTO_ADMINISTRATIVO" DATE, 
	"ACTO_EJECUTORIA" VARCHAR2(40 BYTE), 
	"FECHA_ACTO_EJECUTORIA" DATE, 
	"DESCRIPCION" VARCHAR2(512 BYTE), 
	"VIGENCIA" DATE, 
	"FUNDAMENTO_LEGAL" VARCHAR2(512 BYTE), 
	"ESTADO" NUMBER(1,0), 
	"ACTO_SUSPENSION_TEMP" VARCHAR2(40 BYTE), 
	"FECHA_ACTO_SUSPENSION" DATE, 
	"ACTO_CONFIRMACION" VARCHAR2(40 BYTE), 
	"FECHA_ACTO_CONFIRMACION" DATE, 
	"ACTO_REVOCACION" VARCHAR2(40 BYTE), 
	"FECHA_ACTO_REVOCACION" DATE, 
	"INDICADOR_ENVIO" NUMBER(1,0), 
	"OBSERVACIONES" VARCHAR2(256 BYTE), 
	"IMAGEN_ACTO" CLOB
   ) 
  TABLESPACE "RECADATA" ;
 

   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."CONSECUTIVO" IS 'Consecutivo interno de la tabla';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."TIPO_IDENTIFICACION" IS 'Tipo de identificaci�n del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."NIT_PROPONENTE" IS 'N�mero de identificaci�n del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."NOMBRE_PROPONENTE" IS 'Nombre del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_ADMINISTRATIVO" IS 'N�mero del acto administrativo con el cual se impone la saci�n disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_ADMINISTRATIVO" IS 'Fecha de la ejecutoria del acto administrativo. Fecha en que la sanci�n disciplinaria queda en firme.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_EJECUTORIA" IS 'N�mero del acto administrativo con el cual se confirma la imposici�n de la sanci�n disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_EJECUTORIA" IS 'Fecha del acto administrativo a trav�s del cual se confirma la imposici�n de la sanci�n disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."DESCRIPCION" IS 'Descripci�n de la sanci�n.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."VIGENCIA" IS 'Fecha hasta cuando la sanci�n est� vigente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FUNDAMENTO_LEGAL" IS 'Fundamento legal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ESTADO" IS '0 - En firme (la sanci�n se certifica) 1- Suspensi�n temporal. 2 - Confirmada. 3 - Revocada (no se certifica).';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_SUSPENSION_TEMP" IS 'N�mero del acto que ordena la suspensi�n temporal de la sanci�n disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_SUSPENSION" IS 'Fecha en que se genera el acto de suspensi�n temporal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_CONFIRMACION" IS 'N�mero del acto que confirma la sanci�n, solo en aquellos casos en los cuales la sanci�n disciplinaria hubiere sido suspendida con anterioridad.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_CONFIRMACION" IS 'Fecha en que se genera el acto de confirmaci�n de la sanci�n. Solo en aquellos casos en los cuales la sanci�n hubiere sido suspendida con anterioridad.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_REVOCACION" IS 'Solo debe ser indicado en caso que la sanci�n disciplinaria se reporte en estado 3 (revocado)';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_REVOCACION" IS 'Solo debe ser reportado en caso que la sanci�n disciplinaria se reporte en estado 3 (revocado)';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."INDICADOR_ENVIO" IS '0- Nuevo reporte de sanci�n (cuando se env�a la sanci�n por primera vez) 1- Modificaci�n. Se debe reportar cuando se desee cambiar alg�n campo de una sanci�n reportada previamente. 2- Eliminaci�n de una sanci�n. Reporte este indicador cuando la sanci�n deba ser eliminada del historial de un proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."OBSERVACIONES" IS 'Observaciones en caso de eliminaci�n de la sanci�n disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."IMAGEN_ACTO" IS 'Imagen en formato binario base64 del acto administrativo a trav�s del cual se impuso la sanci�n disciplinaria.';


ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (NOMBRE_ENTIDAD VARCHAR2(500) );

ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (MUNICIPIO_ENTIDAD NUMBER );

ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (AREA_ENTIDAD VARCHAR2(200) );

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.NOMBRE_ENTIDAD IS 'Nombre de la entidad que reporta';

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.MUNICIPIO_ENTIDAD IS 'C�digo dane del municipio de la entidad que reporta';

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.AREA IS 'Area de la entidad que reporta';
