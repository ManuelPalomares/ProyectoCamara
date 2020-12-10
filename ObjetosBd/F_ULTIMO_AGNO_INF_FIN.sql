create or replace FUNCTION F_ULTIMA_AGNO_INF_FIN 
(
  vregistro IN number
) RETURN number AS 
vagno number;
BEGIN
	SELECT MAX(ANO) INTO vagno
  FROM RP_INF_FINANCIERA
WHERE REGISTRO=vregistro;

	return vagno;

END F_ULTIMA_AGNO_INF_FIN;