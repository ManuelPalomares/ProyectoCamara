
  CREATE OR REPLACE FORCE VIEW "RECA_DB"."V_VINCULOS_INSCRITOS" ("MATRICULA", "CAMARA", "TIPOVINCULO", "IDTIPOIDENTIFICACION", "IDENTIFICACION", "NOMBRE_RAZON_SOCIAL", "APE1", "APE2", "NOM1", "NOM2", "FECHANACIMIENTO", "FECHAEXPDOC", "CARGO", "RENGLON", "NITREPRESENTA", "LIBROREGISTRO", "NUMEROREGISTRO", "DUPLIREGISTRO", "FECHAREGISTRO", "NUMEROCUOTAS", "VALORCUOTAS", "APOLAB", "APOLABADI", "APOACT", "APODIN") AS 
  SELECT f.matricula,f.camara,
DECODE(f.TIPO_CARGO,0,'04',1,'05',2,'04',3,'05')  tipovinculo,
f.TIPO_IDENTIFICACION idtipoidentificacion,
f.NRO_IDENTIFICACION identificacion,
f.NOMBRE_RAZON_SOCIAL nombre_razon_social,
F_PARTIR_NOMBRES2(f.NOMBRE_RAZON_SOCIAL,3)ape1,
F_PARTIR_NOMBRES2(f.NOMBRE_RAZON_SOCIAL,4)ape2,
F_PARTIR_NOMBRES2(f.NOMBRE_RAZON_SOCIAL,1)nom1,
F_PARTIR_NOMBRES2(f.NOMBRE_RAZON_SOCIAL,2)nom2,
null fechanacimiento,
TO_CHAR(f.FECHA_DOCUMENTO, 'YYYYMMDD') fechaexpdoc,
c.NOMBRE_TIPO_CARGO cargo,
f.orden renglon,
''nitrepresenta,
f.libro libroregistro,
f.inscripcion numeroregistro,
''dupliregistro,
nvl(TO_CHAR(f.FECHA_DOCUMENTO, 'YYYYMMDD'),null)fecharegistro, 
NULL numerocuotas,
NULL valorcuotas,
''apolab,
''apolabadi,
''apoact,
''apodin
FROM REVISORES_FISCALES f, TIPOS_CARGOS_REVISOR_FISCAL c
WHERE f.TIPO_CARGO=c.TIPO_CARGO
AND f.estado=0
--AND f.MATRICULA=:p_matricula
--AND f.CAMARA=:p_camara
UNION ALL
SELECT r.matricula,r.camara,
DECODE(r.TIPO_REPRESENTANTE,6,'02','01')  tipovinculo,
r.TIPO_IDENTIFICACION idtipoidentificacion,
r.NRO_IDENTIFICACION identificacion,
r.NOMBRE_REPRESENTANTE nombre_razon_social,
F_PARTIR_NOMBRES2(r.NOMBRE_REPRESENTANTE,3)ape1,
F_PARTIR_NOMBRES2(r.NOMBRE_REPRESENTANTE,4)ape2,
F_PARTIR_NOMBRES2(r.NOMBRE_REPRESENTANTE,1)nom1,
F_PARTIR_NOMBRES2(r.NOMBRE_REPRESENTANTE,2)nom2,
null fechanacimiento,
TO_CHAR(r.FECHA_DOCUMENTO, 'YYYYMMDD') fechaexpdoc,
t.NOMBRE_TIPO_REPRES cargo,
r.ORDEN renglon,
'' nitrepresenta,
r.libro libroregistro,
r.inscripcion numeroregistro,
''dupliregistro,
nvl(TO_CHAR(r.FECHA_DOCUMENTO, 'YYYYMMDD'),null)fecharegistro, 
NULL numerocuotas,
NULL valorcuotas,
''apolab,
''apolabadi,
''apoact,
''apodin
FROM REPRESENTANTES_LEGALES r, TIPOS_REPRESENTANTES t
WHERE r.TIPO_REPRESENTANTE=t.TIPO_REPRESENTANTE
--AND r.MATRICULA=:p_matricula
--AND r.CAMARA=:p_camara
UNION ALL
SELECT s.matricula,s.camara,
'03'  tipovinculo,
s.TIPO_IDENTIFICACION idtipoidentificacion,
s.IDENTIFICACION identificacion,
(F_NOMBRE_SOCIO(S.MATRICULA, S.CAMARA, s.SECUENCIA_SOC)) nombre_razon_social,
F_PARTIR_NOMBRES2(F_NOMBRE_SOCIO(S.MATRICULA, S.CAMARA, s.SECUENCIA_SOC),1)ape1,
F_PARTIR_NOMBRES2(F_NOMBRE_SOCIO(S.MATRICULA, S.CAMARA, s.SECUENCIA_SOC),2)ape2,
F_PARTIR_NOMBRES2(F_NOMBRE_SOCIO(S.MATRICULA, S.CAMARA, s.SECUENCIA_SOC),3)nom1,
F_PARTIR_NOMBRES2(F_NOMBRE_SOCIO(S.MATRICULA, S.CAMARA, s.SECUENCIA_SOC),4)nom2,
null fechanacimiento,
null fechaexpdoc,
ts.NOMBRE_TIPO cargo,
s.SECUENCIA_SOC renglon,
'' nitrepresenta,
null libroregistro,
null numeroregistro,
'' dupliregistro,
null fecharegistro, 
s.CUOTAS numerocuotas,
s.APORTE valorcuotas,
''apolab,
''apolabadi,
''apoact,
''apodin
FROM SOCIOS s, TIPOS_SOCIOS ts
WHERE s.TIPO_SOCIO=ts.TIPO_SOCIO
UNION ALL
SELECT 
j.matricula,j.camara,
DECODE(j.TIPO_MIEMBRO,0,'06',1,'07')   tipovinculo,
j.TIPO_IDENTIFICACION idtipoidentificacion,
j.NRO_IDENTIFICACION identificacion,
j.NOMBRE nombre_razon_social,
F_PARTIR_NOMBRES2(j.NOMBRE ,3)ape1,
F_PARTIR_NOMBRES2(j.NOMBRE ,4)ape2,
F_PARTIR_NOMBRES2(j.NOMBRE ,1)nom1,
F_PARTIR_NOMBRES2(j.NOMBRE ,2)nom2,
null fechanacimiento,
TO_CHAR(j.FECHA_DOCUMENTO, 'YYYYMMDD') fechaexpdoc,
C.DESCRIPCION cargo,
j.RENGLON renglon,
'' nitrepresenta,
j.LIBRO libroregistro,
j.INSCRIPCION numeroregistro,
'' dupliregistro,
nvl(TO_CHAR(j.FECHA_DOCUMENTO, 'YYYYMMDD'),null)  fecharegistro, 
null numerocuotas,
null valorcuotas,
''apolab,
''apolabadi,
''apoact,
''apodin
FROM JUNTAS_DIRECTIVAS j,  CARGOS_JUNTAS_DIRECTIVAS C
WHERE  C.CARGO= j.CARGO;
 
