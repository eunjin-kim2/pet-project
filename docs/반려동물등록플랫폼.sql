create table owner(
    o_no number,
    o_id varchar2(30) not null UNIQUE,
    o_passwd varchar2(200) not null,
    o_name varchar2(50) not null,
    o_tel varchar2(15) not null,
    o_email varchar2(100) not null,
    o_addr varchar2(200),
    o_zipno varchar2(5),
    o_join_date date default sysdate,
    o_authority varchar2(10),
    
    primary key(o_no)
);

create table pet(
    p_no number,
    p_name  varchar2(50) not null,
    p_type varchar2(50) not null,
    p_breed varchar2(50) not null,
    p_birth DATE,
    p_gender varchar2(20) not null,
    p_neutered varchar2(3) not null,
    p_weight number(4,2) not null,
    p_detail varchar2(2000),
    p_image varchar2(100),
    p_reg_date date default sysdate,
    o_no number not null,
    
    primary key(p_no),
    foreign key(o_no) references owner(o_no)
);

desc owner;
select * from owner;

desc pet;
select * from pet;

create sequence owner_seq
    start with 1
    increment by 1;
    
select sequence_name
    from user_sequences
    where sequence_name = 'OWNER_SEQ';
    
create sequence pet_seq
    start with 1
    increment by 1;
    
select sequence_name
    from user_sequences
    where sequence_name = 'PET_SEQ';


drop table owner;
drop table pet;