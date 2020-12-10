create or replace FUNCTION F_CIIU_INSCRITO (P_MATRICULA NUMBER, P_CAMARA NUMBER, P_SECUENCIA NUMBER) RETURN VARCHAR2 IS
  
  CADENA VARCHAR2(10) := NULL;
 
  
    
  BEGIN
  SELECT CIIU  INTO CADENA
    FROM CIIUS_INSCRITOS C
    WHERE C.MATRICULA=P_MATRICULA
    AND C.CAMARA=P_CAMARA
    AND C.SECUENCIA=P_SECUENCIA;
    
    RETURN CADENA;
  END;
 