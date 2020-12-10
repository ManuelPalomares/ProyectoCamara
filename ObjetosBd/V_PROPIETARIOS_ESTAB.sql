CREATE OR REPLACE FORCE VIEW "RECA_DB"."V_PROPIETARIOS_ESTAB" 
  (
    camara,
    matricula,
    idtipoidentificacion,
    identificacion,
    nombre,
    nom1,
    nom2,
    ape1,
    ape2,
    dircom,
    muncom,
    telcom1,
    telcom2,
    telcom3,
    emailcom
 ) AS
  SELECT
   NULL camara,
   NULL  matricula,
   NULL idtipoidentificacion,
   NULL identificacion,
   NULL  nombre,
   NULL  nom1,
   NULL  nom2,
   NULL  ape1,
   NULL   ape2,
   NULL  dircom,
   NULL  muncom,
   NULL  telcom1,
   NULL  telcom2,
   NULL  telcom3,
   NULL  emailcom
  FROM DUAL;
    