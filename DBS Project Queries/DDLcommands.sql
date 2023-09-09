drop table chef;
drop table rates;
drop table daily_inventory;
drop table restaurant;
drop table deliveries;
drop table orders;
drop table delivery;
drop table employee;
drop table customer;
drop table menu;

create table employee(
    e_id varchar(5),
    description varchar(10),
    address varchar(20) not null,
    phno numeric(10,0) not null,
    salary number,
    check (description in ('Delivery','Chef','Manager')),
    check (salary>0),
    primary key(e_id)
);

create table restaurant(
    r_id varchar(5),
    r_name varchar(20) not null,
    address varchar(20) not null,
    phno numeric(10,0) not null,
    mgr_id varchar(6) references employee(e_id),
    primary key(r_id)
);

create table menu(
    item_id varchar(6),
    item_name varchar(30) not null,
    price number,
    type varchar(20),
    check (type in ('Veg Starter','Non-Veg Starter','Veg Main Course','Non-Veg Main Course','Desserts','Drinks')),
    check (price>0),
    primary key(item_id)
);

create table customer(
    c_id varchar(5),
    c_name varchar(30) not null,
    address varchar(20) not null,
    phno numeric(10,0) not null,
    primary key(c_id)
);

create table delivery(
    d_id varchar(5),
    d_name varchar(25) not null,
    rating numeric(4,2),
    primary key(d_id),
    foreign key(d_id) references employee(e_id)
);

create table chef(
    ch_id varchar(5),
    ch_name varchar(25) not null,
    primary key(ch_id),
    foreign key(ch_id) references employee(e_id)
);

create table orders(
    o_id varchar(6),
    c_id varchar(5),
    d_id varchar(5),
    dt date,
    amount number,
    primary key(o_id),
    foreign key (c_id) references customer,
    foreign key (d_id) references delivery
);

create table deliveries(
    o_id varchar(6),
    d_id varchar(5),
    dt date,
    amount number,
    rating numeric(4,2),
    primary key(o_id),
    foreign key (d_id) references delivery,
    foreign key (o_id) references orders
);

create table rates(
    c_id varchar(5),
    d_id varchar(5),
    dt date,
    rating numeric(4,2),
    check (rating>=0 and rating<=5),
    primary key (c_id, d_id, dt, rating),
    foreign key (c_id) references customer,
    foreign key (d_id) references delivery
);

create table daily_inventory(
    o_id varchar(6),
    item_id varchar(6),
    quantity number,
    sales number,
    primary key(o_id, item_id),
    foreign key (o_id) references orders,
    foreign key (item_id) references menu
);