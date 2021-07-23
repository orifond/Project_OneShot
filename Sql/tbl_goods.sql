/* tbl_goods �� ��*/
create table tbl_goods (
    gdsNum number not null,
    gdsName varchar2(500) not null,
    cateCode varchar2(30) not null,
    gdsPrice number not null,
    gdsStock number,
    gdsDes Clob,
    gdsImg varchar(500),
    gdsDate date default sysdate,
    primary key(gdsNum)
);

/* ���� ���� */
 insert into tbl_goods (gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes)
    values (tbl_goods_seq.nextval, '��ǰ �̸�', 100, 1000, 30, '��ǰ ����');
    
    
select * from tbl_goods;


/* 
drop table tbl_goods; 
    
delete from tbl_goods
    where gdsName = 'test';
*/

commit;

select gdsNum, gdsName, cateCode, gdsPrice, gdsStock, gdsDes, gdsImg, gdsDate
    from tbl_goods
        order by gdsNum desc;