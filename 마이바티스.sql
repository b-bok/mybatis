
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