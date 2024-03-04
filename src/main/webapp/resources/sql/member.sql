CREATE TABLE member(
    id VARCHAR2(10) NOT NULL, -- 회원 아이디
    password VARCHAR2(10) NOT NULL, -- 비밀번호
    name VARCHAR2(10) NOT NULL, -- 이름
    gender VARCHAR2(4), -- 성별
    birth VARCHAR2(10), -- 생일
    mail VARCHAR2(30), -- 메일
    phone VARCHAR2(20), -- 전화번호
    address VARCHAR2(90), -- 주소
    regist_day VARCHAR2(50), -- 가입 일자
    PRIMARY KEY (id) -- 회원 아이디를 고유 키로 설정
);
