
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
  
  
  
  
-- 검색 결과 만족하는 총 갯수 조회

-- 작성자로 검색 요청시
SELECT 
       COUNT(*)
FROM BOARD B
JOIN MEMBER ON (BOARD_WRITER = USER_NO)
WHERE B.STATUS = 'Y'
  AND USER_ID LIKE '%ad%';

-- 제목으로 검색 요청시

SELECT
       board_title
FROM BOARD B
WHERE B.STATUS = 'Y'
  AND BOARD_TITLE LIKE '%다%'
;
  
  
-- 내용으로 검색 요청시

SELECT
       COUNT(*)
FROM BOARD B
WHERE B.STATUS = 'Y'
  AND BOARD_CONTENT LIKE '%게시%'
;  
  


---- 어떤 검색 요청이던 간에 

SELECT 
       COUNT(*)
FROM BOARD B
JOIN MEMBER ON (BOARD_WRITER = USER_NO)
WHERE B.STATUS = 'Y'
  AND USER_ID
  AND BOARD_TITLE
  AND BOARD_CONTENT
      LIKE '%' || '' || '%';



--- 게시글 상세 조회 요청시 실행할 sql

UPDATE
       BOARD
   SET COUNT = COUNT+1;
 WHERE BOARD_NO = #{bno}
   AND STATUS = 'Y'
   ;
   
-- 게시글 조회   

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
     
-- 게시글 댓글 리스트 조회

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


  