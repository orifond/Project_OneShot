/* tbl_member �� ��*/

create table tbl_member (
    userId varchar2(50) not null,
    userPass varchar2(100) not null,
    userName varchar2(30) not null,
    userPhon varchar2(20) not null,
    userAddr1 varchar2(20) null,
    userAddr2 varchar2(50) null,
    userAddr3 varchar2(50) null,
    regDate date default sysdate,
    verify INT default 0,
    primary key(userId)
);

/* drop table tbl_member; */

/* ���� ���� */
insert into tbl_member(userId, userPass, userName, userPhon)
    values('���̵�', '��й�ȣ', '�г���', '��ȭ��ȣ');
    
select * from tbl_member;     

/* ������ ���� �ο� */
update tbl_member
    set
        verify = 9
    where userId = 'admin@oneshot.com';

select userId,verify
    from tbl_member;    

    
/*delete from tbl_member
    where userId = 'admin@oneshot.com'; */
    
commit;    