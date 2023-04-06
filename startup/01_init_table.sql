-- create users table not singular here as user is a reserved word
create table users (
  aadhar_id int,
  name varchar(50) not null,
  age int not null,
  door_number varchar(10) not null,
  city varchar(20) not null,
  street varchar(50) not null,
  pincode varchar(5) not null,
  role varchar(10) not null check (role in ('manager', 'customer', 'dba')),
  primary key (aadhar_id)
);

-- create phone number table
create table phone_numbers(
  aadhar_id int not null,
  phone varchar(10),
  primary key (aadhar_id, phone)
);

-- foreign key between uesrs and phone number
alter table phone_numbers add constraint fk_phone_users foreign key (aadhar_id) references users(aadhar_id);