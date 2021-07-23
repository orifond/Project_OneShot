/* tbl_reply 쿼 리*/

create table tbl_reply (
    gdsNum number not null,
    userId varchar2(50) not null,
    repNum number not null,
    repCon varchar2(2000) not null,
    repRating number not null,
    repDate date default sysdate,
    primary key(gdsNum, repNum)
);



-- 상품 번호(repNum) 자동 생성 시퀀스
create sequence tbl_reply_seq;

--drop table tbl_reply;

-- tbl_reply_gdsNum, tbl_reply_userId 다른 테이블에서 참조
alter table tbl_reply
    add constraint tbl_reply_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
alter table tbl_reply
    add constraint tbl_reply_userId foreign key(userId)
    references tbl_member(userId);
    
-- 리뷰 추가 쿼리문 테스트
insert into tbl_reply (gdsNum, userId, repNum, repCon, repRating)
    values(261, 'admin@oneshot.com', tbl_reply_seq.nextval, '리뷰 테스트 내용', '5');

select * from tbl_reply;


-- 리뷰 리스트 쿼리문 테스트 (상품 번호 이용)
select
    gdsNum, userId, repNum, repCon, repDate, repRating
from tbl_reply
    where gdsNum = 261;
    
-- 유저 닉네임 표시 쿼리문 (tbl_member + tbl_reply 조인)
select
    r.gdsNum, r.userId, r.repNum, r.repCon, r.repDate, m.userName, r.repRating
from tbl_reply r
    inner join tbl_member m
        on r.userId = m.userId
    where gdsNum = 261;    
    

-- 테이블 삭제 쿼리 테스트
delete tbl_reply 
    where repNum = 121
        and userId = 'admin@oneshot.com';
        
        
-- 리뷰 번호(repNum) 작성자 확인 쿼리
select userId from tbl_reply
    where repNum =122;


-- 테이블 수정 쿼리 테스트
update tbl_reply
    set
        repCon = '수정한 리뷰 내용'
    where repNum = 122
        and userId = 'admin@oneshot.com';

select * from tbl_reply;

commit;


