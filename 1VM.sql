set verify off;
set serveroutput on;
--set linesize 100;
set pagesize 30000;

drop table Staffs;
drop table Location;
drop table Menu;
drop table Orders;
drop table Customers;

Create table Location (l_ID integer, area varchar(25), division varchar(10));
create table Staffs (s_ID integer, s_name varchar(20), s_address varchar(25), l_ID integer);
create table Menu (m_ID VARCHAR(10), m_name_size varchar(50), m_price number);
create table Orders (o_ID integer, m_ID VARCHAR(10), o_items varchar(40), Quantity number, Price number, customer_name varchar(20), customer_address varchar(25), l_ID integer, THE_DATE DATE); 
create table Customers (c_ID integer, customer_name varchar(25), customer_address varchar(50), l_ID integer);

insert into Location (l_ID, area, division) values (3, 'Love Road', 'Chittagong');

insert into Staffs (s_ID, s_name, s_address, l_ID) values (3, 'Rafin', '9/19 Nakhal Para', 1);

insert into Menu (m_ID, m_name_size, m_price) values ('1', 'Margherita (Regular)', 149);
insert into Menu (m_ID, m_name_size, m_price) values ('2', 'Margherita (Medium)', 239);
insert into Menu (m_ID, m_name_size, m_price) values ('3', 'Margherita (Large)', 429);
insert into Menu (m_ID, m_name_size, m_price) values ('4', 'Chicken and Shroom (Regular)', 289);
insert into Menu (m_ID, m_name_size, m_price) values ('5', 'Chicken and Shroom (Medium)', 379);
insert into Menu (m_ID, m_name_size, m_price) values ('6', 'Chicken and Shroom (Large)', 569);
insert into Menu (m_ID, m_name_size, m_price) values ('7', 'Masuzaa (Regular)', 279);
insert into Menu (m_ID, m_name_size, m_price) values ('8', 'Masuzaa (Medium)', 369);
insert into Menu (m_ID, m_name_size, m_price) values ('9', 'Masuzaa (Large)', 559);
insert into Menu (m_ID, m_name_size, m_price) values ('10', 'Chicken on Bar-B-Q (Regular)', 289);
insert into Menu (m_ID, m_name_size, m_price) values ('11', 'Chicken on Bar-B-Q (Medium)', 379);
insert into Menu (m_ID, m_name_size, m_price) values ('12', 'Chicken on Bar-B-Q (Large)', 569);
insert into Menu (m_ID, m_name_size, m_price) values ('13', 'Pollo Alfredo (Regular)', 299);
insert into Menu (m_ID, m_name_size, m_price) values ('14', 'Pollo Alfredo (Medium)', 389);
insert into Menu (m_ID, m_name_size, m_price) values ('15', 'Pollo Alfredo (Large)', 579);
insert into Menu (m_ID, m_name_size, m_price) values ('16', 'Hot Mexicana (Regular)', 309);
insert into Menu (m_ID, m_name_size, m_price) values ('17', 'Hot Mexicana (Medium)', 399);
insert into Menu (m_ID, m_name_size, m_price) values ('18', 'Hot Mexicana (Large)', 589);
insert into Menu (m_ID, m_name_size, m_price) values ('19', 'Saus-Age and Prepperoni (Regular)', 309);
insert into Menu (m_ID, m_name_size, m_price) values ('20', 'Saus-Age and Prepperoni (Medium)', 399);
insert into Menu (m_ID, m_name_size, m_price) values ('21', 'Saus-Age and Prepperoni (Large)', 589);
insert into Menu (m_ID, m_name_size, m_price) values ('22', 'Two in One (Regular)', 329);
insert into Menu (m_ID, m_name_size, m_price) values ('23', 'Two in One (Medium)', 419);
insert into Menu (m_ID, m_name_size, m_price) values ('24', 'Two in One (Large)', 609);

insert into Menu (m_ID, m_name_size, m_price) values ('37', 'Hot Fries', 89);
insert into Menu (m_ID, m_name_size, m_price) values ('38', 'Masala Wedges', 89);
insert into Menu (m_ID, m_name_size, m_price) values ('39', 'Cheesy Chiken Sticks', 169);
insert into Menu (m_ID, m_name_size, m_price) values ('40', 'Mineral Water', 15);
