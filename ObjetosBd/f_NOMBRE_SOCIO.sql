create or replace FUNCTION F_NOMBRE_SOCIO (n_matricula number, n_camara number, n_sec_socio number) return varchar2 is
  cursor nombres is
    select nombre 
    from NOMBRES_SOCIOS
    where matricula = n_matricula
    and   camara = n_camara
    and SECUENCIA_SOC= n_sec_socio;
  cadena varchar2(4000);
begin
  for i in nombres loop
    cadena := cadena ||  i.nombre;
  end loop;
  return trim(cadena);
end;
