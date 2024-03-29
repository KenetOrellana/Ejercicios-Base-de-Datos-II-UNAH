/*
GRUPO 1 INTEGRANTES:
- #20021003480 KATTIA VANESSA GONZALES GALVEZ
- #20091012687 JOAQUIN ISAI SALGADO D�VILA
- #20101010369 SANDRA PRISCILA CUBAS RIVERA
- #20141011708 KENET FRANCISCO ORELLANA MEZA
- #20161003613 OWENN ALEXIS CHAVARRIA RIVERA
*/

-- EJERCICIO #3

/* HABILITANDO LA SALIDA DE DATOS EN PANTALLA */
SET SERVEROUTPUT ON;

/* CREACI�N DEL PAQUETE PK_DEPTOS_HABITANTES */
CREATE OR REPLACE PACKAGE PK_DEPTOS_HABITANTES
IS
  NOMBRE_HABS VARCHAR2(500);
  FUNCTION FN_NOMBRE_HABITANTE (IDHABTE TBLHABITANTES.IDHABITANTE%TYPE) RETURN VARCHAR2;
  PROCEDURE SP_INSERTAR_REGISTROS_DEPTOS (NOMBRE_DEPTO TBLDEPARTAMENTOS.NOMBREDEPARTAMENTO%TYPE, 
  ID_PAIS TBLDEPARTAMENTOS.IDPAIS%TYPE);
END;

/* CUERPO DEL PAQUETE PK_DEPTOS_HABITANTES */
CREATE OR REPLACE PACKAGE BODY PK_DEPTOS_HABITANTES
IS
  FUNCTION FN_NOMBRE_HABITANTE (IDHABTE TBLHABITANTES.IDHABITANTE%TYPE) RETURN VARCHAR2
  IS
    NOMBRE_HABTE TBLHABITANTES.NOMBREHABITANTE%TYPE;
  BEGIN
    SELECT NOMBREHABITANTE INTO NOMBRE_HABTE FROM TBLHABITANTES WHERE IDHABITANTE=IDHABTE;
    NOMBRE_HABS:=NOMBRE_HABTE;
    
    RETURN NOMBRE_HABS;
  END;
  
  PROCEDURE SP_INSERTAR_REGISTROS_DEPTOS (NOMBRE_DEPTO TBLDEPARTAMENTOS.NOMBREDEPARTAMENTO%TYPE, 
  ID_PAIS TBLDEPARTAMENTOS.IDPAIS%TYPE)
  IS
  BEGIN
    INSERT INTO TBLDEPARTAMENTOS (NOMBREDEPARTAMENTO, IDPAIS) VALUES (NOMBRE_DEPTO, ID_PAIS);
    COMMIT;
  END;
END;

/* BLOQUE AN�NIMO */
DECLARE
  NOMBRE_HABS VARCHAR2(500);
BEGIN
  NOMBRE_HABS:=PK_DEPTOS_HABITANTES.FN_NOMBRE_HABITANTE(2);
  DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL HABITANTE ES: ' ||NOMBRE_HABS);
  PK_DEPTOS_HABITANTES.SP_INSERTAR_REGISTROS_DEPTOS('Intibuca', 1);
END;

/* CONSULTA PARA LAS TABLAS TBLHABITANTES Y TBLDEPARTAMENTOS */
SELECT * FROM TBLHABITANTES;

SELECT * FROM TBLDEPARTAMENTOS;
