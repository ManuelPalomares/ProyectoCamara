CREATE OR REPLACE PACKAGE PKG_CAMBIO_DOMICILIO AS 
TYPE Cursor_Type IS REF CURSOR;     --TIPO REF CURSOR
PROCEDURE SP_VALIDAR_RENOVACION(P_MATRICULA NUMBER,P_CAMARA NUMBER, P_MSG_RESPUESTA OUT VARCHAR2,  P_ERROR  OUT VARCHAR2);
PROCEDURE SP_CONSULTAR_LIQUIDACIONES(P_FECHA_DESDE VARCHAR2, P_FECHA_HASTA VARCHAR2, P_DATOS OUT Cursor_Type,  P_ERROR  OUT VARCHAR2);
PROCEDURE SP_GENERAR_JSON(P_MATRICULA VARCHAR2,P_CAMARA VARCHAR2, P_NUMERO_REGISTRO VARCHAR2, P_TIPO VARCHAR2,P_JSON OUT CLOB,  P_ERROR  OUT VARCHAR2);
PROCEDURE SP_PROPONENTES_CAMBIO(P_DATOS OUT Cursor_Type,  P_ERROR  OUT VARCHAR2);
PROCEDURE SP_CARGAR_DATOS_JSON(P_ID_CARGUE NUMBER,P_CADENA VARCHAR2,P_USUARIO VARCHAR2,P_CLAVE VARCHAR2 , P_RESULTADO OUT VARCHAR2);
PROCEDURE SP_GRABAR_INF_JSON(P_ID_CARGUE NUMBER, P_ERROR OUT VARCHAR2 );

END PKG_CAMBIO_DOMICILIO;
/


CREATE OR REPLACE PACKAGE BODY PKG_CAMBIO_DOMICILIO AS
  PROCEDURE SP_VALIDAR_RENOVACION(P_MATRICULA NUMBER,P_CAMARA NUMBER, P_MSG_RESPUESTA OUT VARCHAR2,  P_ERROR  OUT VARCHAR2) IS

  fechaMaxRenovacion DATE;
  fechaRenovacionIns DATE;
  v_agnoRenovacion NUMBER;
  v_agnoParametro NUMBER;
  v_estadoInscrito NUMBER;
  p_renovado NUMBER:=0;
  v_disolucionVigencia NUMBER:=3;
  v_disolucioAnticipada NUMBER:=2;
  v_perdidaCalidad NUMBER:=19;
  
  
  BEGIN
  --Consulto el valor del par�metro para la fecha m�xima de renovaci�n para el a�o en curso
     BEGIN
        SELECT FECHA_RENOVACION_MERCANTIL INTO fechaMaxRenovacion
        FROM REGISTRO_CONTROL;
      EXCEPTION WHEN OTHERS THEN
          P_ERROR:='No se encontr� el par�metro FECHA_RENOVACION_MERCANTIL';
     END;
   
  --Consulto la fecha de renovaci�n del inscrito
    BEGIN
      SELECT NVL(i.FECHA_RENOVACION, i.FECHA_MATRICULA), i.ESTADO  
        INTO  fechaRenovacionIns, v_estadoInscrito
      FROM INSCRITOS i
      WHERE
       i.MATRICULA=p_matricula
       AND i.camara=p_camara;
     EXCEPTION WHEN OTHERS THEN
          P_ERROR:='No se encontr� informaci�n para el inscrito '|| TO_CHAR(p_matricula);
     END;
   BEGIN
      IF v_estadoInscrito = v_disolucionVigencia OR v_estadoInscrito = v_disolucioAnticipada OR v_estadoInscrito = v_perdidaCalidad THEN
        SELECT s.FECHASUSPENSION INTO fechaRenovacionIns
        FROM TB_SUSPENSION s
        WHERE S.MATRICULA=p_matricula
        AND S.CAMARA= p_camara;
      END IF;
   EXCEPTION WHEN OTHERS THEN
          P_ERROR:='No se encontr� informaci�n en  TB_SUSPENSION para la matr�cula '|| TO_CHAR(p_matricula);
     END;
     
    IF fechaMaxRenovacion IS NOT NULL AND  fechaRenovacionIns IS NOT NULL THEN  
      SELECT EXTRACT(YEAR FROM fechaRenovacionIns) INTO v_agnoRenovacion
      FROM dual;
    
  
      SELECT EXTRACT(YEAR FROM fechaMaxRenovacion) INTO v_agnoParametro
      FROM dual;
       
      IF   fechaRenovacionIns>=fechaMaxRenovacion OR
          (v_agnoParametro-v_agnoRenovacion)=0 Or
          (fechaRenovacionIns < fechaMaxRenovacion AND SYSDATE<= fechaMaxRenovacion) 
      THEN
        p_renovado:=1;
        
      END IF;
      IF p_renovado=0 THEN
       P_MSG_RESPUESTA:='No ha realizado la renovaci�n de su matr�cula';
      END IF;
  ELSE
      P_ERROR:='No se encontr� informaci�n  para la matr�cula '|| TO_CHAR(p_matricula);
  END IF;
 
   DBMS_OUTPUT.PUT_LINE('respuesta = ' || P_MSG_RESPUESTA) ; 
   DBMS_OUTPUT.PUT_LINE('p_msgError = ' || P_ERROR) ; 
   
  END SP_VALIDAR_RENOVACION;
  
  PROCEDURE SP_CONSULTAR_LIQUIDACIONES(P_FECHA_DESDE VARCHAR2, P_FECHA_HASTA VARCHAR2, P_DATOS OUT Cursor_Type,  P_ERROR  OUT VARCHAR2) IS
    BEGIN
      OPEN P_DATOS FOR
        SELECT R.MATRICULA,R.CAMARA,
          R.LIQUIDACION LIQUIDACION_LOCAL,
          R.FECHA_OK FECHA,  A.NOMBRE_ABOGADO ABOGADO, CD.DESCRIPCION,
          CASE E.NOMBRE_ESTADO 
              WHEN 'OK' THEN 'APROBADO'
              ELSE E.NOMBRE_ESTADO
          END ESTADO,
          'RM' TIPO_LIQUIDACION,
          L. LIQUIDACION_RUES,
          F_NOMBRE_INSCRITO (R.MATRICULA, R.CAMARA)RAZON_SOCIAL, CD.CODIGO_DOCUMENTO, R.FECHA_GRABA FECHA_RADICACION,
          I.NRO_IDENTIFICACION IDENTIFICACION,
          '' NRO_REGISTRO
          FROM RADICADOR_DOCUMENTOS R,
          LIQUIDACIONES_CAMBIO_DOMICILIO L, 
          ABOGADOS A, CODIGOS_DOCUMENTOS CD, ESTADOS_DOCUMENTOS_LIBROS E, INSCRITOS I
          WHERE R.FECHA_GRABA BETWEEN TO_DATE(P_FECHA_DESDE,'DD/MM/YYYY') AND TO_DATE(P_FECHA_HASTA,'DD/MM/YYYY')
            AND L.LIQUIDACION_LOCAL= R.LIQUIDACION
            AND R.CODIGO_DOCUMENTO IN (23, 240)
            AND A.ABOGADO=R.ABOGADO
            AND R.CODIGO_DOCUMENTO=CD.CODIGO_DOCUMENTO
            AND E.ESTADO=R.ESTADO
            AND I.MATRICULA= R.MATRICULA
            AND I.CAMARA= R.CAMARA
        UNION ALL
        SELECT R.MATRICULA,R.CAMARA, R.LIQUIDACION LIQUIDACION_LOCAL, R.FECHA FECHA,  '' ABOGADO, 
          'CAMBIO DOMICIOLIO RUP' DESCRIPCION,
          'APROBADO' ESTADO,
          'RUP' TIPO_LIQUIDACION,
          L. LIQUIDACION_RUES,
          F_NOMBRE_INSCRITO (R.MATRICULA, R.CAMARA)RAZON_SOCIAL, CD.CONCEPTO CODIGO_DOCUMENTO, R.FECHA FECHA_RADICACION,
          I.NRO_IDENTIFICACION IDENTIFICACION,
          TO_CHAR(P.REGISTRO) NRO_REGISTRO
           FROM LIQUIDACIONES_CAMBIO_DOMICILIO L,
           LIQUIDACIONES_ACUM_VIEW R,
          CONCEPTOS_LIQUIDACIONES CD,  INSCRITOS I, RP_PROPONENTE P 
          WHERE R.FECHA BETWEEN TO_DATE(P_FECHA_DESDE,'DD/MM/YYYY') AND TO_DATE(P_FECHA_HASTA,'DD/MM/YYYY')
            AND L.LIQUIDACION_LOCAL= R.LIQUIDACION
            AND P.MATRICULA=I.MATRICULA AND P.CAMARA = I.CAMARA
            AND P.MATRICULA= R.MATRICULA AND P.CAMARA= R.CAMARA
            AND I.ESTADO=10
            AND P.ESTADO=0
            AND R.CONCEPTO=27
            AND R.CONCEPTO=CD.CONCEPTO;
            
      DBMS_OUTPUT.PUT_LINE('p_msgError = ' || P_ERROR) ; 
  
  END SP_CONSULTAR_LIQUIDACIONES;
  
  PROCEDURE SP_GENERAR_JSON(P_MATRICULA VARCHAR2,P_CAMARA VARCHAR2,P_NUMERO_REGISTRO VARCHAR2, P_TIPO VARCHAR2,P_JSON OUT CLOB,  P_ERROR  OUT VARCHAR2) IS
     v_idLog NUMBER;
     v_condicion VARCHAR2(100);
     v_idJson NUMBER:=2;
    
     BEGIN
     --Si el par�metro P_Tipo es rup
     IF P_TIPO = 'RUP' THEN
        v_idJson:=2;
         v_condicion :=' AND A.REGISTRO='||P_NUMERO_REGISTRO ||' AND rownum = 1';
     END IF;
    IF P_TIPO = 'RM' THEN
        v_idJson:=1;
         v_condicion :=' AND i.MATRICULA='||P_MATRICULA ||' AND i.CAMARA='||P_CAMARA||' AND rownum = 1';
     END IF;
     --SE ARMA LA CONDICI�N TENIENDO EN CUENTA LOS PAR�METROS DE MATR�CULA, CAMARA Y N�MERO DE REGISTRO RECIBIDOS
     
    
     
     PKG_CD_JSON.generarJson(  JSONID => v_idJson, DATOS => v_condicion,IDJSONGEN => v_idLog, CLOBJSONGEN => P_JSON);
     
     --DBMS_OUTPUT.PUT_LINE('CLOBJSONGEN = ' || P_JSON);
     
  END SP_GENERAR_JSON;
  
  PROCEDURE SP_PROPONENTES_CAMBIO(P_DATOS OUT Cursor_Type,  P_ERROR  OUT VARCHAR2) IS
  BEGIN
    OPEN P_DATOS FOR
      SELECT P.REGISTRO, P.MATRICULA, P.CAMARA,  F_NOMBRE_INSCRITO (I.MATRICULA, I.CAMARA)RAZON_SOCIAL, I.FECHA_CANCELACION
      FROM
       RP_PROPONENTE P , INSCRITOS I 
      WHERE 
      P.MATRICULA=I.MATRICULA AND P.CAMARA = I.CAMARA
      AND I.ESTADO=10
      AND P.ESTADO=0;
      
  END SP_PROPONENTES_CAMBIO;
  
PROCEDURE SP_CARGAR_DATOS_JSON(P_ID_CARGUE NUMBER,P_CADENA VARCHAR2,P_USUARIO VARCHAR2,P_CLAVE VARCHAR2, P_RESULTADO OUT VARCHAR2 ) IS
  
  BEGIN
     P_RESULTADO:= PKG_CD_JSON.cargarJson(TO_CHAR(P_ID_CARGUE),P_CADENA,P_USUARIO,P_CLAVE);
     IF P_RESULTADO <>'OK' THEN
      --Se borran los datos cargados
      DELETE FROM CD_TABLA_DATOS_JSON WHERE CD_JSON_CARGUE_ID=P_ID_CARGUE;
     
    ELSE
       -- Si no hay errores, se invoca la grabaci�n de los datos
         SP_GRABAR_INF_JSON(P_ID_CARGUE, P_RESULTADO  );
          
     END IF;
      commit;
END SP_CARGAR_DATOS_JSON;
  
 PROCEDURE SP_GRABAR_INF_JSON(P_ID_CARGUE NUMBER, P_ERROR OUT VARCHAR2 ) IS
  v_idRegistro NUMBER;
  v_idMatricula NUMBER;
  BEGIN
      SELECT J.NRO_PROPONENTE INTO v_idRegistro
      FROM CD_JSON_CARGUE J WHERE ID=P_ID_CARGUE;
      IF v_idRegistro IS NULL THEN --CORRESPONDE A MATR�CULA MERCANTIL
         --Se verifica si en el registro del cargue hay asociada un n�mero de matr�cula para no tomar otra secuencia
          SELECT J.MATRICULA INTO v_idMatricula  
           FROM CD_JSON_CARGUE J WHERE ID=P_ID_CARGUE;
         IF v_idMatricula IS NULL THEN
           SELECT s.VALOR INTO v_idMatricula
           FROM SECUENCIAS_CONTROL s
           WHERE CODIGO=1;
           --ACTUALIZO LA SECUENCIA
           UPDATE SECUENCIAS_CONTROL s
           SET s.VALOR= s.VALOR +1
           WHERE CODIGO=1;
           --ACTUALIZO EL CARGUE CON EL N�MERO DE LA MATR�CULA ASIGNADO PARA QUE PUEDA SER UTILIZADO EN EL PROCESO
           UPDATE CD_JSON_CARGUE SET MATRICULA=v_idMatricula
           WHERE ID=P_ID_CARGUE;
         END IF;
      END IF;
      PKG_CD_CAMBIO_DOM.cargaTabla(P_ID_CARGUE);
      --Si no se presentaron inconvenientes al guardar los datos, se actualiza el proponente
      IF v_idRegistro IS NOT NULL THEN
       UPDATE RPT_PROPONENTE SET SW_PAGO_VIRTUAL=1 WHERE REGISTRO= v_idRegistro;
      END IF;
     EXCEPTION WHEN OTHERS THEN
     P_ERROR:='Se presentaron inconvenientes al guardar los datos del registro '|| SQLERRM;
     rollback;
   
 END SP_GRABAR_INF_JSON;
  
END PKG_CAMBIO_DOMICILIO;
/