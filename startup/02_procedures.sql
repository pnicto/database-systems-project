-- procedure to create new user
create or replace procedure create_new_user (
  aadhar_id int,
  name varchar,
  age int,
  door_number varchar,
  city varchar,
  street varchar,
  pincode varchar,
  role varchar,
  phone varchar
)is
begin
 -- insert into users table
  insert into users values (
    aadhar_id,
    name,
    age,
    door_number,
    city,
    street,
    pincode,
    role
  );
 -- for the corresponding user insert his phone number in the phone numbers table
  insert into phone_numbers values(
    aadhar_id,
    phone
  );
  dbms_output.put_line('Created user with aadhar id '
    || aadhar_id);
end create_new_user;
/

-- procedure to insert property record
create or replace procedure insert_property_record(
  classification varchar,
  property_id int,
  address varchar,
  annual_hike int,
  number_of_floors int,
  plinth_area int,
  total_area int,
  rent int,
  locality varchar,
  available_from date,
  available_till date,
  year_of_construction int,
  type varchar,
  owner_id int,
  tenant_id int,
  number_of_bedrooms int default null
)is
begin
  if classification = 'commercial' then
    insert into property_commercial values (
      property_id,
      address,
      annual_hike,
      number_of_floors,
      plinth_area,
      total_area,
      rent,
      locality,
      available_from,
      available_till,
      year_of_construction,
      type,
      owner_id,
      tenant_id
    );
    dbms_output.put_line( 'Inserted commercial property.' );
  elsif classification = 'residential' then
    insert into property_residential values (
      property_id,
      address,
      annual_hike,
      number_of_floors,
      plinth_area,
      total_area,
      rent,
      locality,
      available_from,
      available_till,
      year_of_construction,
      number_of_bedrooms,
      type,
      owner_id,
      tenant_id
    );
    dbms_output.put_line('Inserted residential property.');
  end if;
end insert_property_record;
/

-- procedure to get tenant details given the property id
create or replace procedure get_tenant_details (
  prop_id int
)is
  user_id int;
begin
 --  To get the user id which is used to get the remaining user details
  select
    tenant_id into user_id
  from
    property_residential
  where
    property_id = prop_id;
 -- cursor to print the details
  declare
    cursor print_line is
      select
        *
      from
        users
      where
        aadhar_id = user_id;
  begin
    dbms_output.put_line('Details of the tenant are');
    for u in print_line loop
      dbms_output.put_line('aadhar_id '
        || u.aadhar_id
        || chr(10)
        || 'name '
        || u.name
        || chr(10)
        || 'age '
        || u.age
        || chr(10)
        || 'door_number '
        || u.door_number
        || chr(10)
        || 'city '
        || u.city
        || chr(10)
        || 'street '
        || u.street
        || chr(10)
        || 'pincode '
        || u.pincode
        || chr(10)
        || 'role '
        || u.role );
    end loop;
  end;
end get_tenant_details;
/