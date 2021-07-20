/* goods_category 쿼 리*/
create table goods_category (
    cateName varchar2(20) not null,
    cateCode varchar2(30) not null,
    cateCodeRef varchar2(30) null,
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);

/* 예시 삽입 */
insert into goods_category (cateName, cateCode) values ('카테고리 1', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 1-1', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 1-2', '102', '100');

insert into goods_category (cateName, cateCode) values ('카테고리 2', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 2-1', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 2-2', '202', '200');

insert into goods_category (cateName, cateCode) values ('카테고리 3', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 3-1', '301', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('카테고리 3-2', '302', '300');

select * from goods_category;

/* drop table goods_category; */

commit;

/* level 부여*/
select level, cateName, cateCode, cateCodeRef from goods_category
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;
    
    
/* 데이터 삽입 */
insert into goods_category (cateName, cateCode) values ('가전', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('세탁기', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('건조기', '102', '100');

insert into goods_category (cateName, cateCode) values ('가구', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('소파', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('침대', '202', '200');

insert into goods_category (cateName, cateCode) values ('생필품', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('섬유유연제', '301', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('룸스프레이', '302', '300');

insert into goods_category (cateName, cateCode) values ('생활', '400');
insert into goods_category (cateName, cateCode) values ('수납정리', '500');
insert into goods_category (cateName, cateCode) values ('주방', '600');
insert into goods_category (cateName, cateCode) values ('패브릭', '700');
insert into goods_category (cateName, cateCode) values ('홈데코', '800');
insert into goods_category (cateName, cateCode) values ('DIY공구', '900');