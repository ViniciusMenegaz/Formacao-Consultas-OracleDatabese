CREATE PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2)
IS 
BEGIN
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (P_ID,UPPER (P_DESCRICAO));
    COMMIT;

END;

SELECT * FROM SEGMERCADO;


--maneiras de incluir com procedures
EXECUTE incluir_segmercado(4, 'Farmaceuticos');

BEGIN 
    incluir_segmercado(4, 'Farmaceuticos') 
END;

---------------------------------------------------------------------------------
-- criando procedure com %type

CREATE OR REPLACE PROCEDURE incluir_segmercado
(p_ID SEGMERCADO.ID%type, p_DESCRICAO SEGMERCADO.DESCRICAO%type)
IS 
BEGIN
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (P_ID,UPPER (P_DESCRICAO));
    COMMIT;
END;

--CRIAR 2 
CREATE  PROCEDURE incluir_segmercado2
(p_ID SEGMERCADO.ID%type, p_DESCRICAO SEGMERCADO.DESCRICAO%type)
IS 
BEGIN
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (P_ID,UPPER (P_DESCRICAO));
    COMMIT;
END;

--CRIAR 3
CREATE  PROCEDURE incluir_segmercado3
(p_ID SEGMERCADO.ID%type, p_DESCRICAO SEGMERCADO.DESCRICAO%type)
IS 
BEGIN
INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (P_ID,UPPER (P_DESCRICAO));
    COMMIT;
END;


--APAGAR 2, 3
DROP PROCEDURE incluir_segmercado3
DROP PROCEDURE incluir_segmercado2

--CRIAR PROCEDURES
CREATE PROCEDURE incluindo_produto
(p_COD PRODUTO_EXERCICIO.COD%type, p_DESCRICAO PRODUTO_EXERCICIO.DESCRICAO%type, p_CATEGORIA PRODUTO_EXERCICIO.CATEGORIA%type)
IS 
BEGIN
INSERT INTO PRODUTO_EXERCICIO (COD, DESCRICAO, CATEGORIA)VALUES
    (p_COD, p_DESCRICAO, p_CATEGORIA);
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso!');
    COMMIT;
END;

--ALTERAR CATEGORIA
CREATE OR REPLACE PROCEDURE alterando_categoria_produto
(p_COD IN PRODUTO_EXERCICIO.COD%type, p_CATEGORIA IN PRODUTO_EXERCICIO.CATEGORIA%type)
IS 
BEGIN
UPDATE PRODUTO_EXERCICIO SET CATEGORIA = 
    p_CATEGORIA WHERE COD = p_COD;
    DBMS_OUTPUT.PUT_LINE('Alteraçâo de dados realizada com sucesso!');
    COMMIT;
END;

--EXCLUIR PRODUTO
CREATE OR REPLACE PROCEDURE excluindo_produto
(p_COD IN PRODUTO_EXERCICIO.COD%type)
IS
BEGIN
    DELETE FROM PRODUTO_EXERCICIO WHERE COD = p_COD;
    DBMS_OUTPUT.PUT_LINE('Exclusão do código: ' || p_COD || ' realizado com sucesso');
    COMMIT;
END;

BEGIN
 incluindo_produto('33854', 'Frescor da Montanha - Aroma Laranja - 1 Litro', 'Mate');
 incluindo_produto('89254', 'Frescor da Montanha - Aroma Uva - 1 Litro', 'Águas');
END;

BEGIN
 alterando_categoria_produto('33854', 'Águas');
END;

----------------
BEGIN 
excluindo_produto ('89254');
END;

SELECT * FROM PRODUTO_EXERCICIO;
