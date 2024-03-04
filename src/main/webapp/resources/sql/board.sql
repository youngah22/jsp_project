drop table board;

CREATE TABLE board (
    num NUMBER NOT NULL, -- 게시글 순번
    id VARCHAR2(20) NOT NULL, -- 회원 아이디
    name VARCHAR2(20) NOT NULL, -- 회원 이름
    subject VARCHAR2(200) NOT NULL, -- 게시글 제목 (최대 200자)
    content VARCHAR2(1000) NOT NULL, -- 게시글 내용 (최대 1000자)
    regist_day VARCHAR(50), -- 게시글 등록 일자 (최대 50자)
    hit NUMBER, -- 게시글 조회 수
    ip VARCHAR(50), -- 게시글 등록 시 IP (최대 50자)
    PRIMARY KEY (num) -- 게시글 순번을 고유 키로 설정
);

select * from BOARD;

drop sequence num_seq;

CREATE SEQUENCE num_seq -- 시퀀스 생성
START WITH 1
INCREMENT BY 1;

SHOW ERRORS TRIGGER num_SEQUENCE_TRIGGER

SELECT * FROM USER_ERRORS WHERE NAME = 'NUM_SEQUENCE_TRIGGER';

CREATE OR REPLACE TRIGGER num_SEQUENCE_TRIGGER
BEFORE INSERT
ON board
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Before SELECT: ' || :NEW.num);
    SELECT num_seq.nextval INTO :NEW.num FROM dual;
    DBMS_OUTPUT.PUT_LINE('After SELECT: ' || :NEW.num);
END;
/
