CREATE OR REPLACE FORCE VIEW RECA_DB.V_INSCRIP_KARDEX 
(
  matricula,
  camara,
  kardex,
  libroregistro,
  numeroregistro,
  dupli,
  fecharegistro,
  actogenerico, 
  descripcionacto,
  idtipodoc,
  fechadoc,
  txtorigendoc,
  numdoc,
  noticia,
  ctrrevocacion,
  numeroregistrorevocacion,
  fecharegistrorevocacion,
  camaraanterior,
  librocamaraanterior,
  numeroregistrocamaraanterior,
  fecharegistrocamaraanterior

) AS 
SELECT
  NULL matricula,
  NULL camara,
  NULL kardex,
  NULL libroregistro,
  NULL numeroregistro,
  NULL dupli,
  NULL fecharegistro,
  NULL actogenerico, 
  NULL descripcionacto,
  NULL Idtipodoc,
  NULL fechadoc,
  NULL txtorigendoc,
  NULL numdoc,
  NULL noticia,
  NULL ctrrevocacion,
  NULL numeroregistrorevocacion,
  NULL fecharegistrorevocacion,
  NULL camaraanterior,
  NULL librocamaraanterior,
  NULL numeroregistrocamaraanterior,
  NULL fecharegistrocamaraanterior
  FROM DUAL;