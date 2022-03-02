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
	nno INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(30) NOT NULL,
	content TEXT,
	writer VARCHAR(10),
	regdate DATETIME DEFAULT NOW(),
	hit INT DEFAULT 0
);

SELECT * FROM planter.notice;

UPDATE member
SET passwd = '1111'
WHERE mid = 'admin';


-- 파일 첨부 기능 테이블
CREATE TABLE attach(
	uuid VARCHAR(100) PRIMARY KEY,
    uploadpath VARCHAR(100),
    filename VARCHAR(100),
    image INT,
    nno INT
);

SELECT * FROM planter.attach;

-- 상품 테이블
CREATE TABLE product(
	pid INT AUTO_INCREMENT PRIMARY KEY, -- 상품 아이디
    pname VARCHAR(100) NOT NULL,		-- 상품 이름
    pprice INT NOT NULL, 				-- 상품 가격
    pdiscount INT DEFAULT 0,			-- 상품 할인가
    pstock INT NOT NULL,				-- 상품 재고
    pmemo TEXT,							-- 상품 설명
	pregdate DATETIME DEFAULT NOW(),	-- 상품 업로드 날짜
    pupdate	DATETIME DEFAULT NOW(),		-- 상품 수정 날짜
    phit INT DEFAULT 0,					-- 상품 조회수
	cid INT NOT NULL					-- 카테고리 코드(아이디)
);

SELECT * FROM planter.attach;

CREATE TABLE catagory(
	cid INT PRIMARY KEY, -- 카테고리 코드(아이디)
    cname VARCHAR(20) NOT NULL			-- 카테고리 이름
);



SELECT * FROM planter.product;

INSERT INTO planter.catagory VALUES(01, 'PLANT');
INSERT INTO planter.catagory VALUES(02, 'FLOWER');
INSERT INTO planter.catagory VALUES(03, 'GARDENING');
INSERT INTO planter.catagory VALUES(04, 'PLANTERIOR');