CREATE OR REPLACE FUNCTION obter_descricao_segmercado
(p_ID IN SEGMERCADO.ID%type)
 
RETURN SEGMERCADO.DESCRICAO%type
IS 
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = p_ID;
    RETURN v_DESCRICAO;
END;

SELECT ID, obter_descricao_segmercado(ID), DESCRICAO, LOWER(DESCRICAO) FROM SEGMERCADO;

-------------------------

VARIABLE g_DESCRICAO VARCHAR2(100);
EXECUTE : g_DESCRICAO :=obter_descricao_segmercado(3);
PRINT g_DESCRICAO;

SET SERVEROUTPUT ON;

DECLARE
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
    v_ID SEGMERCADO.ID%type := 1;
BEGIN
    v_DESCRICAO := obter_descricao_segmercado(v_ID);
    dbms_output.put_line('A descrição do segmento de mercado é' || v_DESCRICAO);
END;






