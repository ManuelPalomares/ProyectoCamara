CREATE TABLE LIQUIDACIONES_CAMBIO_DOMICILIO 
(
  LIQUIDACION_LOCAL NUMBER 
, LIQUIDACION_RUES NUMBER 
, TIPO VARCHAR2(5) 
);

COMMENT ON COLUMN LIQUIDACIONES_CAMBIO_DOMICILIO.LIQUIDACION_LOCAL IS 'N�mero de la liquidaci�n local generada';

COMMENT ON COLUMN LIQUIDACIONES_CAMBIO_DOMICILIO.LIQUIDACION_RUES IS 'N�mero de la liquidaci�n generada en el rues';

COMMENT ON COLUMN LIQUIDACIONES_CAMBIO_DOMICILIO.TIPO IS 'Tipo de registro (RM, R)UP';
