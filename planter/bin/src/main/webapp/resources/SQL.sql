CREATE DATABASE planter;

USE planter;

CREATE TABLE member(
	mid VARCHAR(16) PRIMARY KEY, -- 아이디
    passwd VARCHAR(16) NOT NULL, -- 비밀번호
    name VARCHAR(10) NOT NULL, -- 이름
    phone VARCHAR(12) NOT NULL, -- 핸드폰 번호
    email VARCHAR(50) UNIQUE, -- 이메일
    postcode VARCHAR(10), -- 우편번호
    address1 VARCHAR(200), -- 주소
    address2 VARCHAR(200), -- 상세주소
    address3 VARCHAR(200), -- 상세주소2(동)
    -- receive_sms INT DEFAULT 1, -- SMS 수신여부(DEFAULT 1 = YES)
    -- receive_email INT DEFAULT 1, -- EMAIL 수신여부(DEFAULT 1 = YES)
    role INT DEFAULT 0 -- 회원권한(0 = 일반회원/1 = 관리자)
);

SELECT * FROM member;