-- create users table not singular here as user is a reserved word
create table users (
  aadhar_id int,
  name varchar(20) not null,
  password varchar(20) not null,
  age int not null,
  door_number varchar(10) not null,
  city varchar(20) not null,
  street varchar(50) not null,
  pincode varchar(6) not null,
  role varchar(10) not null check (role in ('manager', 'customer', 'dba')),
  primary key (aadhar_id)
);

-- create phone number table
create table phone_numbers(
  aadhar_id int not null,
  phone varchar(10) not null,
  primary key (aadhar_id, phone)
);

-- foreign key between users and phone number
alter table phone_numbers add constraint fk_phone_users foreign key (aadhar_id) references users(aadhar_id);

-- create residential property
create table property_residential (
  property_id int,
  address varchar(50) not null,
  annual_hike int not null,
  number_of_floors int,
  plinth_area int not null,
  total_area int not null,
  rent int,
  locality varchar(50),
  available_from date not null,
  available_till date not null,
  year_of_construction int not null,
  number_of_bedrooms int,
  type varchar(17) not null check (type in ('flat', 'independent_house')),
  owner_id int not null,
  tenant_id int,
  primary key (property_id)
);

-- create commercial property
create table property_commercial (
  property_id int,
  address varchar(50) not null,
  annual_hike int not null,
  number_of_floors int,
  plinth_area int not null,
  total_area int not null,
  rent int,
  locality varchar(50),
  available_from date not null,
  available_till date not null,
  year_of_construction int not null,
  type varchar(9) not null check (type in ('shop', 'warehouse')),
  owner_id int not null,
  tenant_id int,
  primary key (property_id)
);

-- foreign key between users and residential properties
alter table property_residential add constraint fk_property_residential_owners foreign key ( owner_id ) references users( aadhar_id );

alter table property_residential add constraint fk_property_residential_tenants foreign key ( tenant_id ) references users( aadhar_id );

-- foreign key between users and commercial properites
alter table property_commercial add constraint fk_property_commercial_owners foreign key ( owner_id ) references users( aadhar_id );

alter table property_commercial add constraint fk_property_commercial_tenants foreign key ( tenant_id ) references users( aadhar_id );