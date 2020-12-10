CREATE OR REPLACE FORCE VIEW "RECA_DB"."V_CASAS_INSCRITO" 
  (
    cpcamara,
    cpmatricula,
    cpnit,
    cprazonsocial,
    cpdircom,
    cpmuncom,
    cptelcom1,
    cptelcom2,
    cptelcom3,
    cpemailcom,
    MATRICULA_PPAL,
    CAMARA_PPAL
 ) AS
  SELECT
   i.CAMARA cpcamara,
   i.MATRICULA  cpmatricula,
   i.NRO_IDENTIFICACION  cpnit,
   F_NOMBRE_INSCRITO(i.matricula, i.camara)  cprazonsocial,
   dc.DIRECCION  cpdircom,
   dc.CIUDAD  cpmuncom,
   dc.TELEFONOS  cptelcom1,
   dc.TELEFONO_2  cptelcom2,
   dc.MOVIL  cptelcom3,
   dc.CORREO_ELECTRONICO  cpemailcom,
   i.MATRICULA_PPAL,
   i.CAMARA_PPAL
  FROM INSCRITOS i, DIRECCIONES_INSCRITOS dc
  WHERE i.TIPO_DOMICILIO IN (2,3)
  AND i.MATRICULA= dc.MATRICULA
  AND i.CAMARA= dc.CAMARA;
  
  