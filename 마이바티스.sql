
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