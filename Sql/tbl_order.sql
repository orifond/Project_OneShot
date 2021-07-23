/* tbl_order �� ��*/

--�ֹ� ���̺� ����
create table tbl_order (
    orderId varchar2(50) not null,
    userId varchar2(50) not null,
    orderRec varchar2(50) not null,
    userAddr1 varchar2(20) not null,
    userAddr2 varchar2(50) not null,
    userAddr3 varchar2(50) not null,
    orderPhon varchar2(30) not null,
    amount number not null,
    orderDate Date default sysdate,
    primary key(orderId)
);

-- �ֹ� ���̺�� ��� ���̺� ���� ����
alter table tbl_order
    add constraint tbl_order_userId foreign key(userId)
    references tbl_member(userId);
    
-------------------------------------------------------------------------------

-- �ֹ� �� ���̺� ����    
create table tbl_order_details (
    orderDetailsNum number not null,
    orderId varchar2(50) not null,
    gdsNum number not null,
    cartStock number not null,
    primary key(orderDetailsNum)
);

-- �ֹ� �� ��ȣ ������
create sequence tbl_order_details_seq;

-- �ֹ� �� ���̺�� �ֹ� ���̺� ���� ����
alter table tbl_order_details
    add constraint tbl_order_details_orderId foreign key(orderId)
    references tbl_order(orderId);
    
    
select * from tbl_order;


-- �ֹ� ���̺� & �� ���̺� ������ Ȯ��
select
    orderId, userId, orderRec, userAddr1, userAddr2, userAddr3, orderPhon, amount, orderDate
from tbl_order
    where userId = 'admin@test';
    

-- �ֹ� ��ȣ Ŭ�� �� �ֹ��� ���� �� ���� ���
select
    o.orderId, o.userId, o.orderRec, o.userAddr1, o.userAddr2, o.userAddr3, o.orderPhon, o.amount, o.orderDate,
    d.orderDetailsNum, d.gdsNum, d.cartStock,
    g.gdsName, g.gdsImg, g.gdsPrice
from tbl_order o
        inner join tbl_order_details d
            on o.orderId = d.orderId
        inner join tbl_goods g
            on d.gdsNum = g.gdsNum
        where o.userId = 'admin@test'
            and o.orderId = '20210723_802625';
    
    
    
    
    
    