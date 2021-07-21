/* tbl_member 쿼 리*/

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

/* 예시 삽입 */
insert into tbl_member(userId, userPass, userName, userPhon)
    values('아이디', '비밀번호', '닉네임', '전화번호');
    
select * from tbl_member;     

/* 관리자 권한 부여 */
update tbl_member
    set
        verify = 9
    where userId = 'admin@oneshot.com';

select userId,verify
    from tbl_member;    

    
/*delete from tbl_member
    where userId = 'admin@oneshot.com'; */
    
commit;    