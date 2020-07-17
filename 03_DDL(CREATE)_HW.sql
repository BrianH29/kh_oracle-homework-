-- �ǽ����� --
-- �������� ���α׷��� ����� ���� ���̺��� ����� --
-- �̶�, �������ǿ� �̸��� �ο��� �� 
--      �� �÷��� �ּ��ޱ�



-- ���ǻ�鿡 ���� �����͸� ������� ���ǻ� ���̺�(TB_PUBLISHER) 
-- �÷� : PUB_NO(���ǻ��ȣ) -- �⺻Ű(PUBLISHER_PK)
--        PUB_NAME(���ǻ��) -- NOT NULL(PUBLISHER_NN)
--        PHONE(���ǻ���ȭ��ȣ) -- �������� ����

-- 3�� ������ ���� ������ �߰��ϱ�
CREATE TABLE TB_PUBLISHER (
PUB_NO NUMBER CONSTRAINT PUBLISHER_PK PRIMARY KEY,
PUB_NAME VARCHAR2(20) CONSTRAINT PUBLISHER_NN NOT NULL,
PHONE VARCHAR2(15)
);
SELECT * FROM TB_PUBLISHER;
COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '���ǻ��ȣ';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '���ǻ��';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '���ǻ���ȭ��ȣ';

INSERT INTO TB_PUBLISHER VALUES(1,'�Ѻ�','010-1234-0930');
INSERT INTO TB_PUBLISHER VALUES(2,'�ں�','010-3214-9827');
INSERT INTO TB_PUBLISHER VALUES(3,'�ں�','010-7834-0984');

-- �����鿡 ���� �����͸� ������� ���� ���̺�(TB_BOOK)
-- �÷� : BK_NO (������ȣ) -- �⺻Ű(BOOK_PK)
--        BK_TITLE (������) -- NOT NULL(BOOK_NN_TITLE)
--        BK_AUTHOR(���ڸ�) -- NOT NULL(BOOK_NN_AUTHOR)
--        BK_PRICE(����)
--        BK_PUB_NO(���ǻ��ȣ) -- �ܷ�Ű(BOOK_FK) (TB_PUBLISHER ���̺��� �����ϵ���)
--                                  �̶� �����ϰ� �ִ� �θ����� ���� �� �ڽ� �����͵� ���� �ǵ��� �ɼ� ����

-- 5�� ������ ���� ������ �߰��ϱ�
CREATE TABLE TB_BOOK(
BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
BK_TITLE VARCHAR2(100) CONSTRAINT BOOK_NN_TITLE NOT NULL,
BK_AUTHOR VARCHAR2(20) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
BK_PRICE VARCHAR2(10),
BK_PUB_NO NUMBER CONSTRAINT BOOK_FK REFERENCES TB_PUBLISHER(PUB_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN TB_BOOK.BK_NO IS '������ȣ';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS '������';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '���ڸ�';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS '����';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '���ǻ��ȣ';

INSERT INTO TB_BOOK VALUES (1,'��������','����','23,000','1');
INSERT INTO TB_BOOK VALUES (2,'�׷�׷�','����Ŭ','21,650','2');
INSERT INTO TB_BOOK VALUES (3,'�ູ�� �Ϸ�','�迬��','24,500','1');
INSERT INTO TB_BOOK VALUES (4,'�ֱ׷�','��׷�','15,090','3');
INSERT INTO TB_BOOK VALUES (5,'ȣ����','ȫ�浿','12,400','2');

SELECT * FROM TB_BOOK;


-- ȸ���� ���� �����͸� ������� ȸ�� ���̺� (TB_MEMBER)
-- �÷��� : MEMBER_NO(ȸ����ȣ) -- �⺻Ű(MEMBER_PK)
--         MEMBER_ID(���̵�)   -- �ߺ�����(MEMBER_UQ)
--         MEMBER_PWD(��й�ȣ) -- NOT NULL(MEMBER_NN_PWD)
--         MEMBER_NAME(ȸ����) -- NOT NULL(MEMBER_NN_NAME)
--         GENDER(����)        -- 'M' �Ǵ� 'F'�� �Էµǵ��� ����(MEMBER_CK_GEN)
--         ADDRESS(�ּ�)       
--         PHONE(����ó)       
--         STATUS(Ż�𿩺�)     -- �⺻������ 'N'  �׸��� 'Y' Ȥ�� 'N'���θ� �Էµǵ��� ��������(MEMBER_CK_STA)
--         ENROLL_DATE(������)  -- �⺻������ SYSDATE, NOT NULL ��������(MEMBER_NN_EN)

-- 5�� ������ ���� ������ �߰��ϱ�
CREATE TABLE TB_MEMBER(
MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_UQ UNIQUE,
MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_NN_PWD NOT NULL,
MEMBER_NAME VARCHAR2(20) CONSTRAINT MEMBER_NN_NAME NOT NULL,
GENDER CHAR(3)CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN('M','F')),
ADDRESS VARCHAR2(50),
PHONE VARCHAR2(15),
STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN('Y','N')), 
ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL
);

COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS '���̵�';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS '��й�ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME IS 'ȸ����';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '����';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS '�ּ�';
COMMENT ON COLUMN TB_MEMBER.PHONE IS 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN TB_MEMBER.STATUS IS 'Ż�𿩺�';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '������';

INSERT INTO TB_MEMBER VALUES(1,'user01','pass01','ȫ�浿','M','����� ����� ���赿','010-1234-9483',DEFAULT,'2020-07-15');
INSERT INTO TB_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,GENDER,ADDRESS, PHONE) 
VALUES(2,'user02','pass02','�踻��','F','������ ����','010-8394-0980');

INSERT INTO TB_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,GENDER,ADDRESS, PHONE) 
VALUES(3,'user03','pass03','��ȫ��','M','������ �ΰԵ�','010-8114-0980');

INSERT INTO TB_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,GENDER,ADDRESS, PHONE) 
VALUES(4,'user04','pass04','������','F','����� ������ ����3��','010-4214-0090');

INSERT INTO TB_MEMBER(MEMBER_NO,MEMBER_ID,MEMBER_PWD,MEMBER_NAME,GENDER,ADDRESS, PHONE) 
VALUES(5,'user05','pass05','ȫ����','F','����� õȣ�� ','010-4225-0955');


SELECT * FROM TB_MEMBER;

-- � ȸ���� � ������ �뿩�ߴ����� ����  �뿩��� ���̺�(TB_RENT)
-- �÷� : RENT_NO(�뿩��ȣ) -- �⺻Ű(RENT_PK)
--        RENT_MEM_NO(�뿩ȸ����ȣ) -- �ܷ�Ű(RENT_FK_MEM)  TB_MEMBER�� �����ϵ���
--                                     �̶� �θ� ������ ������ �ڽ� ������ ���� NULL�� �ǵ��� �ɼ� ����
--        RENT_BOOK_NO(�뿩������ȣ) -- �ܷ�Ű(RENT_FK_BOOK)  TB_BOOK�� �����ϵ���
--                                      �̶� �θ� ������ ������ �ڽ� ������ ���� NULL���� �ǵ��� �ɼ� ����
--        RENT_DATE(�뿩��) -- �⺻�� SYSDATE

-- ���õ����� 3�� ����  �߰��ϱ�

CREATE TABLE TB_RENT(
RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
RENT_MEM_NO NUMBER CONSTRAINT RENT_MEM_NO_NN REFERENCES TB_MEMBER ON DELETE SET NULL,
RENT_BOOK_NO NUMBER CONSTRAINT RENT_BOOK_NO_NN REFERENCES TB_BOOK ON DELETE SET NULL,
RENT_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN TB_RENT.RENT_NO IS '�뿩��ȣ';
COMMENT ON COLUMN TB_RENT.RENT_MEM_NO IS '�뿩ȸ����ȣ';
COMMENT ON COLUMN TB_RENT.RENT_BOOK_NO IS '�뿩������ȣ';
COMMENT ON COLUMN TB_RENT.RENT_DATE IS '�뿩��';

INSERT INTO TB_RENT(RENT_NO,RENT_MEM_NO,RENT_BOOK_NO) VALUES(1, 1, 1);
INSERT INTO TB_RENT(RENT_NO,RENT_MEM_NO,RENT_BOOK_NO) VALUES(2, 1, 3);
INSERT INTO TB_RENT(RENT_NO,RENT_MEM_NO,RENT_BOOK_NO) VALUES(3, 2, 1);

SELECT * FROM TB_RENT;




