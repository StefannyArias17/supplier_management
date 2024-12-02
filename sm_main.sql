REM
REM Header: sm_main.sql
REM
REM Creado por [Ibeth Stefanny Pulido]
REM
REM Nombre:
REM   sm_main.sql - Script principal para Gestión de Proveedores
REM
REM Descripción:
REM   Este script crea el esquema de base de datos para la Gestión de Proveedores, 
REM   incluyendo la creación de usuarios, tablas y la inserción de datos. 
REM   Este script también realiza tareas de limpieza de usuarios y objetos previos, 
REM   crea los usuarios necesarios y asigna los privilegios adecuados. 
REM   Además, crea las tablas necesarias para el funcionamiento del esquema 
REM   y finalmente recolecta estadísticas sobre el esquema creado.
REM
REM Notas:
REM   - Ejecutar este script como usuario SYS o SYSTEM con privilegios adecuados.
REM   - Este script utiliza parámetros de entrada, por lo que debe proporcionarse 
REM     la contraseña de los usuarios como parámetros al ejecutar el script.
REM
REM Parametros:
REM   1 - Contraseña para el usuario company
REM   2 - Contraseña para el usuario SYS
REM   3 - Tablespace para datos (DEFAULT: USERS)
REM   4 - Tablespace para TEMP (DEFAULT: TEMP)
REM   5 - Ruta del esquema (DEFAULT: $ORACLE_HOME/demo/schema/supplier_management/)
REM
REM Fecha de creación: 15 de Noviembre 2024
REM Última modificación: 2 de Diciembre 2024
REM

SET ECHO OFF
SET VERIFY OFF

PROMPT
PROMPT Especificar contrasena para el usuario company como parametro 1:
DEFINE pass = &1

PROMPT
PROMPT Especificar contrasena para SYS como parametro 2:
DEFINE sys_pass = &2

PROMPT
PROMPT Especificar tablespace para datos (DEFAULT: USERS):
DEFINE tbs = &3

PROMPT
PROMPT Especificar tablespace para TEMP (DEFAULT: TEMP):
DEFINE ttbs = &4

PROMPT
PROMPT Especificar ruta del esquema (DEFAULT: $ORACLE_HOME/demo/schema/supplier_management/):
DEFINE schema_path = &5

PROMPT
DEFINE spool_file = sm_main.log

SET VERIFY ON

SPOOL &spool_file

REM =======================================================
REM Limpieza de usuario y objetos previos (si existen)
REM =======================================================

BEGIN
   FOR r IN (SELECT granted_role FROM dba_role_privs WHERE grantee = 'COMPANY') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || r.granted_role || ' FROM COMPANY';
   END LOOP;

   FOR p IN (SELECT privilege FROM dba_sys_privs WHERE grantee = 'COMPANY') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || p.privilege || ' FROM COMPANY';
   END LOOP;

   FOR q IN (SELECT privilege FROM dba_tab_privs WHERE grantee = 'COMPANY') LOOP
      EXECUTE IMMEDIATE 'REVOKE ' || q.privilege || ' ON ' || q.owner || '.' || q.table_name || ' FROM COMPANY';
   END LOOP;
END;
/

BEGIN
   FOR c IN (SELECT sid, serial# FROM v$session WHERE username = 'COMPANY') LOOP
      EXECUTE IMMEDIATE 'ALTER SYSTEM KILL SESSION ''' || c.sid || ',' || c.serial# || ''' IMMEDIATE';
   END LOOP;
END;
/

DROP USER company CASCADE;

REM =======================================================
REM Crear usuario company
REM =======================================================

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER company IDENTIFIED BY &pass;

ALTER USER company DEFAULT TABLESPACE &tbs
                     QUOTA UNLIMITED ON &tbs;

ALTER USER company TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO company;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, CREATE TABLE, CREATE PROCEDURE TO company;

REM =======================================================
REM Crear objetos
REM =======================================================

CONNECT company/&pass

PROMPT
PROMPT Creando tablas, secuencias y restricciones...
@&schema_path.sm_cre.sql

PROMPT
PROMPT Insertando datos en las tablas...
@&schema_path.sm_popul.sql

PROMPT
PROMPT Añadiendo comentarios a las tablas y columnas...
@&schema_path.sm_comnt.sql

REM =======================================================
REM Recolectar estadísticas del esquema
REM =======================================================

PROMPT
PROMPT Recolectando estadisticas del esquema...
BEGIN
   DBMS_STATS.GATHER_SCHEMA_STATS(OWNNAME => 'COMPANY');
END;
/

SPOOL OFF

PROMPT
PROMPT Esquema Gestion de Proveedores creado y configurado exitosamente.
PROMPT
