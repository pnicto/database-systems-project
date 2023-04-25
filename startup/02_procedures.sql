-- procedure to create new user
create or replace procedure create_new_user (
  aadhar_id int,
  name varchar,
  password varchar,
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
    password,
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

-- procedure to get all property details for given owner id
create or replace procedure get_property_records (
  own_id int
) is
  var_property_id          int;
  var_address              varchar(50);
  var_annual_hike          int;
  var_number_of_floors     int;
  var_plinth_area          int;
  var_total_area           int;
  var_rent                 int;
  var_locality             varchar(50);
  var_available_from       date;
  var_available_till       date;
  var_year_of_construction int;
  var_type                 varchar(17);
  var_tenant_id            int;
  var_number_of_bedrooms   int;
  cursor commercial_cursor is
    select
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
      tenant_id
    from
      property_commercial
    where
      owner_id = own_id;
  cursor residential_cursor is
    select
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
      tenant_id
    from
      property_residential
    where
      owner_id = own_id;
begin
  open commercial_cursor;
  loop
    fetch commercial_cursor into var_property_id, var_address, var_annual_hike, var_number_of_floors, var_plinth_area, var_total_area, var_rent, var_locality, var_available_from, var_available_till, var_year_of_construction, var_type, var_tenant_id;
    exit when commercial_cursor%notfound;
    dbms_output.put_line('COMMERCIAL PROPERTY '
      || commercial_cursor%rowcount
      || ':');
    dbms_output.put_line('property_id: '
      || var_property_id);
    dbms_output.put_line('address: '
      || var_address);
    dbms_output.put_line('annual_hike: '
      || var_annual_hike);
    dbms_output.put_line('number_of_floors: '
      || var_number_of_floors);
    dbms_output.put_line('plinth_area: '
      || var_plinth_area);
    dbms_output.put_line('total_area: '
      || var_total_area);
    dbms_output.put_line('rent: '
      || var_rent);
    dbms_output.put_line('locality: '
      || var_locality);
    dbms_output.put_line('available_from: '
      || var_available_from);
    dbms_output.put_line('available_till: '
      || var_available_till);
    dbms_output.put_line('year_of_construction: '
      || var_year_of_construction);
    dbms_output.put_line('type: '
      || var_type);
    dbms_output.put_line('tenant_id: '
      || var_tenant_id
      || chr(10));
  end loop;
  open residential_cursor;
  loop
    fetch residential_cursor into var_property_id, var_address, var_annual_hike, var_number_of_floors, var_plinth_area, var_total_area, var_rent, var_locality, var_available_from, var_available_till, var_year_of_construction, var_number_of_bedrooms, var_type, var_tenant_id;
    exit when residential_cursor%notfound;
    dbms_output.put_line('RESIDENTIAL PROPERTY '
      || residential_cursor%rowcount
      || ':');
    dbms_output.put_line('property_id: '
      || var_property_id);
    dbms_output.put_line('address: '
      || var_address);
    dbms_output.put_line('annual_hike: '
      || var_annual_hike);
    dbms_output.put_line('number_of_floors: '
      || var_number_of_floors);
    dbms_output.put_line('plinth_area: '
      || var_plinth_area);
    dbms_output.put_line('total_area: '
      || var_total_area);
    dbms_output.put_line('rent: '
      || var_rent);
    dbms_output.put_line('locality: '
      || var_locality);
    dbms_output.put_line('available_from: '
      || var_available_from);
    dbms_output.put_line('available_till: '
      || var_available_till);
    dbms_output.put_line('year_of_construction: '
      || var_year_of_construction);
    dbms_output.put_line('number_of_bedrooms: '
      || var_number_of_bedrooms);
    dbms_output.put_line('type: '
      || var_type);
    dbms_output.put_line('tenant_id: '
      || var_tenant_id
      || chr(10));
  end loop;
  close commercial_cursor;
  close residential_cursor;
end get_property_records;
/
