connect c##project_dba/password;

set serveroutput on;

-- procedure to create new user
create or replace procedure create_new_user (
  aadhar_id int,
  aname varchar2,
  password varchar2,
  age int,
  door_number varchar2,
  city varchar2,
  street varchar2,
  pincode varchar2,
  role varchar2,
  phone varchar2
)is
  tmp_query varchar(200);
begin
 -- insert into users table
  insert into users values (
    aadhar_id,
    aname,
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
 -- create user in db
  execute immediate '
CREATE USER c##'
    || aadhar_id
    ||' PROFILE "DEFAULT"
IDENTIFIED BY '
    || password
    ||' DEFAULT TABLESPACE "USERS"';
  dbms_output.put_line('created user with aadhar id '
    || aadhar_id);
  execute immediate 'grant connect to c##'
    || aadhar_id
    ||' container=all ';
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

-- procedure to get all property details located in given locality
create or replace procedure search_property_for_rent(
  locale varchar2
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
  var_owner_id             int;
  var_tenant_id            int;
  var_number_of_bedrooms   int;
  cursor commercial_cursor is
    select
      *
    from
      property_commercial
    where
      locality = locale;
  cursor residential_cursor is
    select
      *
    from
      property_residential
    where
      locality = locale;
begin
  open commercial_cursor;
  loop
    fetch commercial_cursor into var_property_id, var_address, var_annual_hike, var_number_of_floors, var_plinth_area, var_total_area, var_rent, var_locality, var_available_from, var_available_till, var_year_of_construction, var_type, var_owner_id, var_tenant_id;
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
    dbms_output.put_line('available_from: '
      || var_available_from);
    dbms_output.put_line('available_till: '
      || var_available_till);
    dbms_output.put_line('year_of_construction: '
      || var_year_of_construction);
    dbms_output.put_line('type: '
      || var_type);
    dbms_output.put_line('owner_id: '
      || var_owner_id);
    dbms_output.put_line('tenant_id: '
      || var_tenant_id
      || chr(10));
  end loop;
  open residential_cursor;
  loop
    fetch residential_cursor into var_property_id, var_address, var_annual_hike, var_number_of_floors, var_plinth_area, var_total_area, var_rent, var_locality, var_available_from, var_available_till, var_year_of_construction, var_number_of_bedrooms, var_type, var_owner_id, var_tenant_id;
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
    dbms_output.put_line('owner_id: '
      || var_owner_id);
    dbms_output.put_line('tenant_id: '
      || var_tenant_id
      || chr(10));
  end loop;
  close commercial_cursor;
  close residential_cursor;
end search_property_for_rent;
/

-- procedure to rent a property to a tenant
create or replace procedure rent_property(
  p_id int,
  t_id int,
  classification varchar2,
  record_date date
)is
  var_owner_id           int;
  var_owner_record_id    int;
  var_property_record_id int;
  var_tenant_record_id   int;
begin
 -- update the tenant id in the respective property table
  if classification = 'commercial' then
    update property_commercial
    set
      tenant_id = t_id
    where
      property_id = p_id;
 -- Get owner id
    select
      owner_id into var_owner_id
    from
      property_commercial
    where
      property_id = p_id;
  elsif classification = 'residential' then
    update property_residential
    set
      tenant_id = t_id
    where
      property_id = p_id;
 -- Get owner id
    select
      owner_id into var_owner_id
    from
      property_residential
    where
      property_id = p_id;
  end if;
 -- get owner record id
  select
    user_record_id into var_owner_record_id
  from
    users_history
  where
    aadhar_id = var_owner_id
    and is_current =1;
 -- get tenant record id
  select
    user_record_id into var_tenant_record_id
  from
    users_history
  where
    aadhar_id = t_id
    and is_current =1;
 -- get property record id
  select
    property_record_id into var_property_record_id
  from
    property_history
  where
    property_id = p_id
    and is_current =1;
 -- update the records table
  insert into records(
    date_of_record,
    owner_record_id,
    tenant_record_id,
    property_record_id
  ) values (
    record_date,
    var_owner_record_id,
    var_tenant_record_id,
    var_property_record_id
  );
end rent_property;
/

-- procedure to get rent history given property id and type
create or replace procedure get_rent_history (
  p_id int,
  classification varchar
) is
  var_owner_id            int;
  var_tenant_id           int;
  var_record_date         date;
  var_property_record_id  int;
  var_owner_name          varchar(20);
  var_tenant_name         varchar(20);
  var_owner_record_id     int;
  var_tenant_record_id    int;
  var_check_record_exists int;
  cursor records_cursor is
    select
      property_record_id
    from
      property_history
    where
      property_id = p_id
      and property_type = classification;
begin
  open records_cursor;
  loop
    fetch records_cursor into var_property_record_id;
    exit when records_cursor%notfound;
    select
      count(*) into var_check_record_exists
    from
      records
    where
      property_record_id = var_property_record_id;
    if(var_check_record_exists > 0) then
      select
        date_of_record,
        owner_record_id,
        tenant_record_id into var_record_date,
        var_owner_record_id,
        var_tenant_record_id
      from
        records
      where
        property_record_id = var_property_record_id;
      select
        aadhar_id,
        name into var_owner_id,
        var_owner_name
      from
        users_history
      where
        user_record_id = var_owner_record_id;
      select
        aadhar_id,
        name into var_tenant_id,
        var_tenant_name
      from
        users_history
      where
        user_record_id = var_tenant_record_id;
      dbms_output.put_line('Record Date: '
        || var_record_date);
      dbms_output.put_line('Property Owner ID: '
        || var_owner_id);
      dbms_output.put_line('Property Owner Name: '
        || var_owner_name);
      dbms_output.put_line( 'Tenant ID: '
        || var_tenant_id);
      dbms_output.put_line('Tenant Name: '
        || var_tenant_name
        || chr(10));
    end if;
  end loop;
  close records_cursor;
end get_rent_history;
/