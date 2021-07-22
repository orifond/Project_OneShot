/* ��õ ��ǰ ���̺� */

create table goods_sug(
    indexNo number not null,
    gdsNum number not null,
    sugNum varchar2(100),
    col1 varchar2(100),
    col2 varchar2(100),
    primary key(indexNo)
);


create sequence goods_sug_seq;


-- goodsNum ����
alter table goods_sug
    add constraint goods_sug foreign key(gdsNum)
    references tbl_goods(gdsNum);
    
    
    
select * from tbl_goods;

drop table goods_sug;