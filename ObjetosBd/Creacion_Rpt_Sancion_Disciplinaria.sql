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
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."TIPO_IDENTIFICACION" IS 'Tipo de identificación del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."NIT_PROPONENTE" IS 'Número de identificación del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."NOMBRE_PROPONENTE" IS 'Nombre del proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_ADMINISTRATIVO" IS 'Número del acto administrativo con el cual se impone la sación disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_ADMINISTRATIVO" IS 'Fecha de la ejecutoria del acto administrativo. Fecha en que la sanción disciplinaria queda en firme.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_EJECUTORIA" IS 'Número del acto administrativo con el cual se confirma la imposición de la sanción disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_EJECUTORIA" IS 'Fecha del acto administrativo a través del cual se confirma la imposición de la sanción disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."DESCRIPCION" IS 'Descripción de la sanción.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."VIGENCIA" IS 'Fecha hasta cuando la sanción está vigente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FUNDAMENTO_LEGAL" IS 'Fundamento legal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ESTADO" IS '0 - En firme (la sanción se certifica) 1- Suspensión temporal. 2 - Confirmada. 3 - Revocada (no se certifica).';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_SUSPENSION_TEMP" IS 'Número del acto que ordena la suspensión temporal de la sanción disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_SUSPENSION" IS 'Fecha en que se genera el acto de suspensión temporal.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_CONFIRMACION" IS 'Número del acto que confirma la sanción, solo en aquellos casos en los cuales la sanción disciplinaria hubiere sido suspendida con anterioridad.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_CONFIRMACION" IS 'Fecha en que se genera el acto de confirmación de la sanción. Solo en aquellos casos en los cuales la sanción hubiere sido suspendida con anterioridad.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."ACTO_REVOCACION" IS 'Solo debe ser indicado en caso que la sanción disciplinaria se reporte en estado 3 (revocado)';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."FECHA_ACTO_REVOCACION" IS 'Solo debe ser reportado en caso que la sanción disciplinaria se reporte en estado 3 (revocado)';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."INDICADOR_ENVIO" IS '0- Nuevo reporte de sanción (cuando se envía la sanción por primera vez) 1- Modificación. Se debe reportar cuando se desee cambiar algún campo de una sanción reportada previamente. 2- Eliminación de una sanción. Reporte este indicador cuando la sanción deba ser eliminada del historial de un proponente.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."OBSERVACIONES" IS 'Observaciones en caso de eliminación de la sanción disciplinaria.';
 
   COMMENT ON COLUMN "RECA_DB"."RPT_SANCION_DISCIPLINARIA"."IMAGEN_ACTO" IS 'Imagen en formato binario base64 del acto administrativo a través del cual se impuso la sanción disciplinaria.';


ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (NOMBRE_ENTIDAD VARCHAR2(500) );

ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (MUNICIPIO_ENTIDAD NUMBER );

ALTER TABLE RPT_SANCION_DISCIPLINARIA
ADD (AREA_ENTIDAD VARCHAR2(200) );

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.NOMBRE_ENTIDAD IS 'Nombre de la entidad que reporta';

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.MUNICIPIO_ENTIDAD IS 'Código dane del municipio de la entidad que reporta';

COMMENT ON COLUMN RPT_SANCION_DISCIPLINARIA.AREA IS 'Area de la entidad que reporta';
