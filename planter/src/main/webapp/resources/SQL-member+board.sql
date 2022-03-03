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

SELECT * FROM planter.member;

INSERT INTO planter.member
VALUES('admin', '1111', '관리자', '01000000000', 'admin@naver.com', '', '', '','', 1);
INSERT INTO planter.member
VALUES('eunha01', 'pw123123@@', '사용자', '01000000000', 'devv.eunha@gmail.com', '', '', '','', 0);

SELECT * FROM planter.member;

SELECT COUNT(*) FROM planter.member 
WHERE email = 'admin@naver.com'
AND mid = 'admin';

USE planter;

CREATE TABLE notice(
	nno INT AUTO_INCREMENT PRIMARY KEY, -- 글 번호
	title VARCHAR(30),					-- 글 제목
	content TEXT,						-- 글 내용
	writer VARCHAR(10),					-- 글 작성자
	regdate DATETIME DEFAULT NOW(),		-- 글 작성일
	hit INT DEFAULT 0					-- 글 조회수
);

SELECT * FROM planter.notice;


SELECT * 
FROM(
	SELECT @rownum:=@rownum+1 AS rownum, n.*
	FROM (SELECT @rownum:=0) AS rnt,
	notice AS n
) AS noticeList
;