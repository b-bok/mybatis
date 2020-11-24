
-- ȸ������ ��û�� ������ sql��

insert 
  into member
  (
     USER_NO
   , USER_ID
   , USER_PWD
   , USER_NAME
   , EMAIL
   , BIRTHDAY
   , GENDER
   , PHONE
   , ADDRESS  
  )
  values
  (
      SEQ_UNO.NEXTVAL
    , ?
    , ?
    , ?
    , ?
    , ?
    , ?
    , ?
    , ?
  )
  ;
  
  
  SELECT 
         USER_NO
       , USER_ID
       , USER_PWD
       , USER_NAME
       , EMAIL
       , BIRTHDAY
       , GENDER
       , PHONE
       , ADDRESS
       , ENROLL_DATE
       , MODIFY_DATE
       , STATUS
  FROM MEMBER
  WHERE USER_ID = 'admin'
    AND USER_PWD = 1234
    AND STATUS = 'Y'
       ;
  
  SELECT
          BOARD_NO
        , BOARD_TITLE
        , USER_ID
        , COUNT
        , CREATE_DATE
   FROM BOARD B
   JOIN MEMBER ON (BOARD_WRITER = USER_NO)
   WHERE B.STATUS = 'Y'
   ORDER
      BY BOARD_NO DESC;
  
  
  
  
-- �˻� ��� �����ϴ� �� ���� ��ȸ

-- �ۼ��ڷ� �˻� ��û��
SELECT 
       COUNT(*)
FROM BOARD B
JOIN MEMBER ON (BOARD_WRITER = USER_NO)
WHERE B.STATUS = 'Y'
  AND USER_ID LIKE '%ad%';

-- �������� �˻� ��û��

SELECT
       board_title
FROM BOARD B
WHERE B.STATUS = 'Y'
  AND BOARD_TITLE LIKE '%��%'
;
  
  
-- �������� �˻� ��û��

SELECT
       COUNT(*)
FROM BOARD B
WHERE B.STATUS = 'Y'
  AND BOARD_CONTENT LIKE '%�Խ�%'
;  
  


---- � �˻� ��û�̴� ���� 

SELECT 
       COUNT(*)
FROM BOARD B
JOIN MEMBER ON (BOARD_WRITER = USER_NO)
WHERE B.STATUS = 'Y'
  AND USER_ID
  AND BOARD_TITLE
  AND BOARD_CONTENT
      LIKE '%' || '' || '%';



--- �Խñ� �� ��ȸ ��û�� ������ sql

UPDATE
       BOARD
   SET COUNT = COUNT+1;
 WHERE BOARD_NO = #{bno}
   AND STATUS = 'Y'
   ;
   
-- �Խñ� ��ȸ   

SELECT
       BOARD_NO
     , BOARD_TITLE
     , BOARD_CONTENT
     , USER_ID
     , COUNT
     , CREATE_DATE
FROM BOARD 
JOIN MEMBER ON (BOARD_WRITER = USER_NO)
WHERE BOARD_NO = #{bno}
  ;
     
-- �Խñ� ��� ����Ʈ ��ȸ

SELECT
        REPLY_NO
      , USER_ID
      , REPLY_CONTENT
      , CREATE_DATE
 FROM REPLY R
 JOIN MEMBER ON (REPLY_WRITER = USER_NO)
 WHERE REF_BNO = #{bno}
   AND R.STATUS = 'Y'
 ;


  