--------------------------------------------------------
--  DDL for Function TO_BASE64
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "RECA_DB"."TO_BASE64" (texto in varchar2) return varchar2 is
  BEGIN
    if(texto is not null) then
        return utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(texto)));
    end if;
    return '';
    
  END to_base64;

/
