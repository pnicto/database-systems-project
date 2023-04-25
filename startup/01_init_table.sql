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

-- create property history table
create table property_history (
  property_record_id int not null,
  property_id int not null,
  address varchar(50) not null,
  annual hike int not null,
  number_of_floors int,
  plinth_area int not null,
  total_area int not null,
  rent int,
  locality varchar(50),
  available_from date not null,
  available_till date not null,
  year_of_construction int not null,
  number_of_bedrooms int,
  property_type varchar(11) not null check (property_type in ('residential', 'commercial')),
  type varchar(17) not null check (type in ('flat', 'independent_house', 'shop', 'warehouse')),
  is_current int not null check (is_current in (0, 1)),
  primary key (property_record_id)
);

-- create user history table
create table users_history (
  user_record_id int not null,
  aadhar_id int not null,
  name varchar(20) not null,
  password varchar(20) not null,
  age int not null,
  door_number varchar(10) not null,
  city varchar(20) not null,
  street varchar(50) not null,
  pincode varchar(6) not null,
  role varchar(10) not null check (role in ('manager', 'customer', 'dba')),
  is_current int not null check (is_current in (0, 1)),
  primary key (user_record_id)
);

-- create phone number history table
create table phone_numbers_history (
  user_record_id int not null,
  phone varchar(10) not null,
  primary_key (user_record_id, phone)
);

-- foreign key between users history and phone number history
alter table phone_numbers_history add constraint fk_phone_history_users foreign key (user_record_id) references users_history(user_record_id);

-- create records table  
create table records (
  record_id int not null,
  date_of_record date not null,
  owner_record_id int not null,
  tenant_record_id int not null,
  property_record_id int not null,
  primary key (record_id)
); 

-- foreign keys from record table to other history tables
alter table records add constraint fk_records_owner_history foreign key (owner_record_id) references users_history(user_record_id);

alter table records add constraint fk_records_tenant_history foreign key (tenant_record_id) references users_history(user_record_id);

alter table records add constraint fk_records_property_history foreign key (property_record_id) references property_history(property_record_id);


-- foreign key between users and residential properties
alter table property_residential add constraint fk_property_residential_owners foreign key ( owner_id ) references users( aadhar_id );

alter table property_residential add constraint fk_property_residential_tenants foreign key ( tenant_id ) references users( aadhar_id );

-- foreign key between users and commercial properites
alter table property_commercial add constraint fk_property_commercial_owners foreign key ( owner_id ) references users( aadhar_id );

alter table property_commercial add constraint fk_property_commercial_tenants foreign key ( tenant_id ) references users( aadhar_id );