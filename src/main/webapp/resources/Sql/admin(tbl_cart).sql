/* tbl_cart �� ��*/

create table tbl_cart (
    cartNum number not null,
    userId varchar2(50) not null,
    gdsNum number not null,
    cartStock number not null,
    addDate date default sysdate,
    primary key(cartNum, userId)
);

-- drop table tbl_cart;

create sequence tbl_cart_seq;


/* īƮ ���̺�� ��� ���̺� ��ǰ ���̺� �����ϴ� ���� */
alter table tbl_cart
    add constraint tbl_cart_userId foreign key(userId)
    references tbl_member(userId);
    
alter table tbl_cart
    add constraint tbl_cart_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum);
        
/* īƮ ��� �ڵ� �׽�Ʈ */

insert into tbl_cart(cartNum, userId, gdsNum, cartStock)
    values (tbl_cart_seq.nextval, 'admin@oneshot.com', 261, 2);
    
insert into tbl_cart(cartNum, userId, gdsNum, cartStock)
    values (tbl_cart_seq.nextval, 'admin@oneshot.com', 204, 3);    
    
select * from tbl_cart;

commit;



select
    row_number() over(order by c.cartNum desc) as num,
    c.cartNum, c.userId, c.gdsNum, c.cartStock, c.addDate,
    g.gdsName, g.gdsPrice, g.gdsthumbImg
from tbl_cart c
    inner join tbl_goods g
        on c.gdsNum = g.gdsNum
    where c.userId = 'admin@oneshot.com';    
    
/* īƮ ���� */
/*
delete tbl_cart
    where cartNum = 86
        and userId = 'admin@oneshot.com';
*/

select * from tbl_cart;

 drop table tbl_cart;
 



    