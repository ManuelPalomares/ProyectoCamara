DECLARE
  JSONID NUMBER;
  DATOS VARCHAR2(200);
  IDJSONGEN NUMBER;
  CLOBJSONGEN CLOB;
BEGIN
  JSONID := 2;
  DATOS := ' and a.registro = 30 and rownum = 1 ';

  PKG_CD_JSON.GENERARJSON(
    JSONID => JSONID,
    DATOS => DATOS,
    IDJSONGEN => IDJSONGEN,
    CLOBJSONGEN => CLOBJSONGEN
  );
DBMS_OUTPUT.PUT_LINE('IDJSONGEN = ' || IDJSONGEN);

DBMS_OUTPUT.PUT_LINE('CLOBJSONGEN = ' || CLOBJSONGEN);

END;
