/* goods_category �� ��*/
create table goods_category (
    cateName varchar2(20) not null,
    cateCode varchar2(30) not null,
    cateCodeRef varchar2(30) null,
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);

/* ���� ���� */
insert into goods_category (cateName, cateCode) values ('ī�װ� 1', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 1-1', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 1-2', '102', '100');

insert into goods_category (cateName, cateCode) values ('ī�װ� 2', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 2-1', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 2-2', '202', '200');

insert into goods_category (cateName, cateCode) values ('ī�װ� 3', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 3-1', '301', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ī�װ� 3-2', '302', '300');

select * from goods_category;

/* drop table goods_category; */

commit;

/* level �ο�*/
select level, cateName, cateCode, cateCodeRef from goods_category
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;
    
    
/* ������ ���� */
insert into goods_category (cateName, cateCode) values ('����', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('��Ź��', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('������', '102', '100');

insert into goods_category (cateName, cateCode) values ('����', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('����', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('ħ��', '202', '200');

insert into goods_category (cateName, cateCode) values ('����ǰ', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('����������', '301', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('�뽺������', '302', '300');

insert into goods_category (cateName, cateCode) values ('��Ȱ', '400');
insert into goods_category (cateName, cateCode) values ('��������', '500');
insert into goods_category (cateName, cateCode) values ('�ֹ�', '600');
insert into goods_category (cateName, cateCode) values ('�к긯', '700');
insert into goods_category (cateName, cateCode) values ('Ȩ����', '800');
insert into goods_category (cateName, cateCode) values ('DIY����', '900');