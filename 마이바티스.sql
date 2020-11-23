
-- 회원가입 요청시 실행할 sql문

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
  
  
  
  