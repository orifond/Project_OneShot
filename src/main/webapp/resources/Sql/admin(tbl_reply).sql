/* tbl_reply �� ��*/

create table tbl_reply (
    gdsNum number not null,
    userId varchar2(50) not null,
    repNum number not null,
    repCon varchar2(2000) not null,
    repRating number not null,
    repDate date default sysdate,
    primary key(gdsNum, repNum)
);



-- ��ǰ ��ȣ(repNum) �ڵ� ���� ������
create sequence tbl_reply_seq;

--drop table tbl_reply;

-- tbl_reply_gdsNum, tbl_reply_userId �ٸ� ���̺��� ����
alter table tbl_reply
    add constraint tbl_reply_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
alter table tbl_reply
    add constraint tbl_reply_userId foreign key(userId)
    references tbl_member(userId);
    
-- ���� �߰� ������ �׽�Ʈ
insert into tbl_reply (gdsNum, userId, repNum, repCon, repRating)
    values(261, 'admin@oneshot.com', tbl_reply_seq.nextval, '���� �׽�Ʈ ����', '5');

select * from tbl_reply;


-- ���� ����Ʈ ������ �׽�Ʈ (��ǰ ��ȣ �̿�)
select
    gdsNum, userId, repNum, repCon, repDate, repRating
from tbl_reply
    where gdsNum = 261;
    
-- ���� �г��� ǥ�� ������ (tbl_member + tbl_reply ����)
select
    r.gdsNum, r.userId, r.repNum, r.repCon, r.repDate, m.userName, r.repRating
from tbl_reply r
    inner join tbl_member m
        on r.userId = m.userId
    where gdsNum = 261;    
    

-- ���̺� ���� ���� �׽�Ʈ
delete tbl_reply 
    where repNum = 121
        and userId = 'admin@oneshot.com';
        
        
-- ���� ��ȣ(repNum) �ۼ��� Ȯ�� ����
select userId from tbl_reply
    where repNum =122;


-- ���̺� ���� ���� �׽�Ʈ
update tbl_reply
    set
        repCon = '������ ���� ����'
    where repNum = 122
        and userId = 'admin@oneshot.com';

select * from tbl_reply;

commit;


