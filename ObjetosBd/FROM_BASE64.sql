--------------------------------------------------------
--  DDL for Function FROM_BASE64
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "RECA_DB"."FROM_BASE64" (texto in varchar2) return varchar2 is
   BEGIN
   
     if(texto is not null) then
        return utl_raw.cast_to_varchar2(utl_encode.base64_decode(utl_raw.cast_to_raw(texto)));
    end if;
    return '';
  END from_base64;

/
