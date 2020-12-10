INSERT INTO "RECA_DB"."SEG_OPCION" (OPCION, ORDEN, DESCRIPCION, URL) VALUES ('339', '500_05', 'Cambio de Domicilio', 'cargaradicacambiodomicilio.do');
Insert into SEG_OPCION_X_GRUPO (OPCION,GRUPO) values ('339','01');

INSERT INTO "RECA_DB"."SEG_OPCION" (OPCION, ORDEN, DESCRIPCION, URL) VALUES ('340', '500_03_06', 'Cambio de Domicilio', 'cargareporte.do?reporte=66');
Insert into SEG_OPCION_X_GRUPO (OPCION,GRUPO) values ('340','01');

INSERT INTO "RECA_DB"."RE_REPORTE" (REPORTE, NOMBRE, PATH) VALUES ('66', 'Proponentes en Cambio de Domicilio', 'reporteCambioDomicilio.jasper')

commit;
