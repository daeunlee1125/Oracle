insert into college values ('인문사회대학');
insert into college values ('자연과학대학');
insert into college values ('공과대학');
insert into college values ('사범대학');
insert into college values ('대학원');

insert into department values (10, '인문사회대학', '국어국문학과', '김국어', '051-123-1001');
insert into department values (11, '인문사회대학', '영어영문학과', '김영어', '051-123-1002');
insert into department values (12, '인문사회대학', '일어일문학과', '김일어', '051-123-1003');
insert into department values (13, '인문사회대학', '중어중문학과', '김중어', '051-123-1004');
insert into department values (14, '인문사회대학', '역사학과', '김역사', '051-123-1005');
insert into department values (15, '인문사회대학', '경제학과', '김경제', '051-123-1006');
insert into department values (16, '인문사회대학', '경영학과', '김경영', '051-123-1007');
insert into department values (17, '인문사회대학', '법학과', '김법학', '051-123-1008');
insert into department values (18, '인문사회대학', '철학과', '김철학', '051-123-1009');
insert into department values (19, '인문사회대학', '정치외교학과', '김정치', '051-123-1010');

insert into department values (20, '자연과학대학', '수학과', '김수학', '051-123-2001');
insert into department values (21, '자연과학대학', '물리학과', '김물리', '051-123-2002');
insert into department values (22, '자연과학대학', '화학과', '김화학', '051-123-2003');
insert into department values (23, '자연과학대학', '천문학과', '김천문', '051-123-2004');
insert into department values (24, '자연과학대학', '지구과학학과', '김지구', '051-123-2005');
insert into department values (25, '자연과학대학', '생명과학과', '김생명', '051-123-2006');
insert into department values (26, '자연과학대학', '미생물학과', '김생물', '051-123-2007');
insert into department values (27, '자연과학대학', '해양학과', '김해양', '051-123-2008');

insert into department values (30, '공과대학', '기계공학과', '김기계', '051-123-3001');
insert into department values (31, '공과대학', '전자공학과', '김전자', '051-123-3002');
insert into department values (32, '공과대학', '전기공학과', '김전기', '051-123-3003');
insert into department values (33, '공과대학', '컴퓨터공학과', '김컴공', '051-123-3004');
insert into department values (34, '공과대학', '건축공학과', '김건축', '051-123-3005');
insert into department values (35, '공과대학', '재료공학과', '김재료', '051-123-3006');
insert into department values (36, '공과대학', '화학공학과', '김화학', '051-123-3007');

insert into department values (40, '사범대학', '국어교육과', '김국어', '051-123-4001');
insert into department values (41, '사범대학', '영어교육과', '김영어', '051-123-4002');
insert into department values (42, '사범대학', '수학교육과', '김수학', '051-123-4003');
insert into department values (43, '사범대학', '윤리학과', '김윤리', '051-123-4004');
insert into department values (44, '사범대학', '교육학과', '김교육', '051-123-4005');
insert into department values (45, '사범대학', '사회교육과', '김사회', '051-123-4006');
insert into department values (46, '사범대학', '역사교육과', '김역사', '051-123-4007');
insert into department values (47, '사범대학', '체육교육과', '김체육', '051-123-4008');
insert into department values (48, '사범대학', '특수교육과', '김특수', '051-123-4009');

insert into department values (50, '대학원', '경영대학원', '김경영', '051-123-5001');
insert into department values (51, '대학원', '경제대학원', '김경제', '051-123-5002');
insert into department values (52, '대학원', '행정대학원', '김행정', '051-123-5003');
insert into department values (53, '대학원', '교육대학원', '김교육', '051-123-5004');
insert into department values (54, '대학원', '산업대학원', '김산업', '051-123-5005');


insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이자바', '700526-1111111', 33, '2021-01-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이자료', '700526-1111112', 33, '2022-02-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이미적', '700526-1111113', 42, '2021-01-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이기하', '700526-1111114', 42, '2022-02-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이칸트', '700526-1111115', 18, '2021-01-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이니체', '700526-1111116', 18, '2022-02-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이영국', '700526-1111117', 41, '2021-01-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이미국', '700526-1111118', 41, '2022-02-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이고전', '700526-1111119', 10, '2021-01-26');
insert into professor (pro_name, pro_jumin, dep_no, appointment_date) values ('이현대', '700526-1111110', 10, '2022-02-26');

insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('040526-1111111', '박컴공', 'F', 33, 2021330001, 2023);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('030526-1111112', '박컴학', 'M', 33, 2022330002, 2022);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('040526-1111113', '박이산', 'F', 42, 2021420003, 2023);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('020526-1111114', '박확통', 'M', 42, 2022420004, 2021);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('050526-1111115', '박데카', 'F', 18, 2021180005, 2024);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('040526-1111116', '박플라', 'M', 18, 2022180006, 2023);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('040526-1111117', '박하이', 'F', 41, 2021410007, 2023);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('020526-1111118', '박바이', 'M', 41, 2022410008, 2021);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('040526-1111119', '박애란', 'F', 10, 2021100009, 2023);
insert into student (std_jumin, std_name, std_gen, dep_no, pro_no, std_ent) values ('000526-1111110', '박유정', 'M', 10, 2022100010, 2019);

insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('컴퓨터학개론', 1, 3, 2025, 1, 33, 2021330001);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('자바 프로그래밍', 2, 3, 2025, 1, 33, 2022330002);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('이산수학', 1, 3, 2025, 1, 42, 2021420003);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('확률과 통계', 1, 3, 2025, 1, 42, 2022420004);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('서양중세철학사', 2, 3, 2025, 1, 18, 2021180005);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('철학고전 읽기와 토론', 1, 2, 2025, 1, 18, 2022180006);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('미디어 영문학', 4, 2, 2025, 1, 41, 2021410007);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('영미단편소설', 1, 3, 2025, 1, 41, 2022410008);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('한국어학일반론', 3, 3, 2025, 1, 10, 2021100009);
insert into course (cs_name, cs_grade, cs_credit, cs_year, cs_sem, dep_no, pro_no) values ('현대소설론', 1, 3, 2025, 1, 10, 2022100010);