/*부서 테이블 데이터 삽입*/
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, '경영지원팀',   '0530010001');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, '부설연구소',   '0530010002');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, 'SI사업1팀',    '0530010003');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, 'SI사업2팀',    '0530010004');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, 'SI사업3팀',    '0530010005');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, 'SI사업4팀',    '0530010006');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, 'SI사업본부',   '0530010007');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, '전략사업본부',  '0530010008');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, '경영지원본부',  '0530010009');
INSERT INTO FORWIZ_DEPT (DEPTNUM, DEPTNAME, DEPTCALL) VALUES (DEPT_PK_SEQ.NEXTVAL, '대표이사',     '0530010010');

/*직원 테이블 데이터 삽입*/
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'대리',    '홍일동',   '0000000000001', '2019-06-24', '10',    '01042521231', '1', '대구 동구','101동 902호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'사원',    '홍이동',   '0000000000002',	 '2019-06-25', '15',	'01042521232', '1', '대구 북구','103동 506호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'주임',    '홍삼동',   '0000000000003',  '2019-06-26', '20',	'01042521233', '0', '대구 수성구','2동 101호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'과장',    '홍사동',   '0000000000004',  '2019-06-27', '25',	'01042521234', '1', '대구 중구','1동 202호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'차장',    '홍오동',   '0000000000005',  '2019-06-28', '30',	'01042521235', '0', '대구 동구','302동 1001호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR,ADDRDETAIL) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'부장',    '홍육동',   '0000000000006',  '2019-06-29', '35',	'01042521236', '1', '대구 서구','102동 906호');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'본부장',  '홍칠동',   '0000000000007',  '2019-06-30',  '40',	'01042521237', '1', '대구 달서구');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'전무',    '홍팔동',   '0000000000008',  '2019-07-01', '45',	'01042521238', '0', '대구 중구');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'부사장',   '홍구동',  '0000000000009',	  '2019-07-02', '50',	'01042521239', '1', '대구 중구');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR) VALUES ( EMP_PK_SEQ.NEXTVAL,  EMP_PK_SEQ.NEXTVAL,'대표이사', '홍백동',  '0000000000010',	  '2019-07-03', '55',	'01042521240', '1', '대구 동구');
INSERT INTO FORWIZ_EMP (EMPNUM,PASSWD,RANK,NAME,SSM,JOINDATE,DEPTNUM,PHONENUM,GENDER,ADDR) VALUES ( 'admin', 'admin', 'admin', 'admin',  '9999999999999',	  '9999-99-99', '0',	'9999999999', '1', 'admin');
commit;