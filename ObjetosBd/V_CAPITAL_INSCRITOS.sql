CREATE OR REPLACE FORCE VIEW RECA_DB.V_CAPITAL_INSCRITOS 
( 
  libroregistro,
  numeroregistro,
  fechadatos,
  anodatos,
   matricula, 
   camara, 
  cuotascapsocial,
  valorcapsocial,
  cuotascapaut,
  valorcapaut,
  cuotascapsus,
  valorcapsus,
  cuotascappag,
  valorcappag,
  apolab,
  apoact,
  apolabadi,
  apodin,
  apotot,
  patrimonio,
  porcpartimujeres
) AS 
SELECT  DISTINCT 
  NULL libroregistro,
  NULL numeroregistro,
  NULL fechadatos,
  NULL anodatos,
  c.MATRICULA, 
  c.CAMARA, 
  cso.NRO_CUOTAS cuotascapsocial, 
  cso.VALOR_CAPITAL valorcapsocial,
  ca.NRO_CUOTAS cuotascapaut,
  ca.VALOR_CAPITAL valorcapaut,
  cs.NRO_CUOTAS cuotascapsus, 
  cs.VALOR_CAPITAL valorcapsus ,
  cp.NRO_CUOTAS cuotascappag, 
  cp.VALOR_CAPITAL valorcappag,
  NULL apolab,
  NULL apoact,
  NULL apolabadi,
  NULL apodin,
  NULL apotot,
  NULL patrimonio,
  NULL porcpartimujeres
  FROM   CAPITALES_CUOTAS_INSCRITOS c 
         LEFT JOIN CAPITALES_CUOTAS_INSCRITOS cs ON (cs.MATRICULA=c.MATRICULA
                                                     AND cs.CAMARA = c.CAMARA 
                                                     AND cs.TIPO_CAPITAL=1)
         LEFT JOIN CAPITALES_CUOTAS_INSCRITOS cp ON ( cp.MATRICULA=c.MATRICULA
                                                      AND cp.CAMARA = c.CAMARA
                                                      AND cp.TIPO_CAPITAL=2)
         LEFT JOIN CAPITALES_CUOTAS_INSCRITOS cso ON ( cso.MATRICULA=c.MATRICULA
                                                        AND cso.CAMARA = c.CAMARA
                                                        AND cso.TIPO_CAPITAL=3)
         
         LEFT JOIN CAPITALES_CUOTAS_INSCRITOS ca ON (c.MATRICULA=ca.MATRICULA
                                                     AND c.CAMARA = ca.CAMARA 
                                                     AND ca.TIPO_CAPITAL=0)
  ;
