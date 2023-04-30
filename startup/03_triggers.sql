connect c##project_dba/password;

create or replace trigger users_history_trigger before
  insert or
    update or
      delete on users for each row
    declare
      record_id number;
  begin
    select
      max(user_record_id) into record_id
    from
      users_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into users_history values (
        record_id + 1,
        :new.aadhar_id,
        :new.name,
        :new.password,
        :new.age,
        :new.door_number,
        :new.city,
        :new.street,
        :new.pincode,
        :new.role,
        1
      );
    elsif updating then
      update users_history
      set
        is_current = 0
      where
        aadhar_id = :old.aadhar_id;
      insert into users_history values (
        record_id + 1,
        :new.aadhar_id,
        :new.name,
        :new.password,
        :new.age,
        :new.door_number,
        :new.city,
        :new.street,
        :new.pincode,
        :new.role,
        1
      );
    elsif deleting then
      update users_history
      set
        is_current = 0
      where
        aadhar_id = :old.aadhar_id;
    end if;
  end users_history_trigger;
/

create or replace trigger phone_numbers_history_trigger before
  insert or
    update on phone_numbers for each row
  declare
    user_id int;
begin
  if inserting or updating then
    select
      user_record_id into user_id
    from
      users_history
    where
      aadhar_id = :new.aadhar_id
      and is_current = 1;
    insert into phone_numbers_history values (
      user_id,
      :new.phone
    );
  end if;
end phone_numbers_history_trigger;
/

create or replace trigger residential_property_history_trigger before
  insert or
    update or
      delete on property_residential for each row
    declare
      record_id number;
  begin
    select
      max(property_record_id) into record_id
    from
      property_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        :new.number_of_bedrooms,
        'residential',
        :new.type,
        1
      );
    elsif updating then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        :new.number_of_bedrooms,
        'residential',
        :new.type,
        1
      );
    elsif deleting then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
    end if;
  end residential_property_history_trigger;
/

create or replace trigger commercial_property_history_trigger before
  insert or
    update or
      delete on property_commercial for each row
    declare
      record_id number;
  begin
    select
      max(property_record_id) into record_id
    from
      property_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        null,
        'commercial',
        :new.type,
        1
      );
    elsif updating then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        null,
        'commercial',
        :new.type,
        1
      );
    elsif deleting then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
    end if;
  end commercial_property_history_trigger;
/

create or replace trigger users_history_trigger before
  insert or
    update or
      delete on users for each row
    declare
      record_id number;
  begin
    select
      max(user_record_id) into record_id
    from
      users_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into users_history values (
        record_id + 1,
        :new.aadhar_id,
        :new.name,
        :new.password,
        :new.age,
        :new.door_number,
        :new.city,
        :new.street,
        :new.pincode,
        :new.role,
        1
      );
    elsif updating then
      update users_history
      set
        is_current = 0
      where
        aadhar_id = :old.aadhar_id;
      insert into users_history values (
        record_id + 1,
        :new.aadhar_id,
        :new.name,
        :new.password,
        :new.age,
        :new.door_number,
        :new.city,
        :new.street,
        :new.pincode,
        :new.role,
        1
      );
    elsif deleting then
      update users_history
      set
        is_current = 0
      where
        aadhar_id = :old.aadhar_id;
    end if;
  end users_history_trigger;
/

create or replace trigger phone_numbers_history_trigger before
  insert or
    update on phone_numbers for each row
  declare
    user_id int;
begin
  if inserting or updating then
    select
      user_record_id into user_id
    from
      users_history
    where
      aadhar_id = :new.aadhar_id
      and is_current = 1;
    insert into phone_numbers_history values (
      user_id,
      :new.phone
    );
  end if;
end phone_numbers_history_trigger;
/

create or replace trigger residential_property_history_trigger before
  insert or
    update or
      delete on property_residential for each row
    declare
      record_id number;
  begin
    select
      max(property_record_id) into record_id
    from
      property_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        :new.number_of_bedrooms,
        'residential',
        :new.type,
        1
      );
    elsif updating then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        :new.number_of_bedrooms,
        'residential',
        :new.type,
        1
      );
    elsif deleting then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
    end if;
  end residential_property_history_trigger;
/

create or replace trigger commercial_property_history_trigger before
  insert or
    update or
      delete on property_commercial for each row
    declare
      record_id number;
  begin
    select
      max(property_record_id) into record_id
    from
      property_history;
    if inserting then
      if record_id is null then
        record_id := 0;
      end if;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        null,
        'commercial',
        :new.type,
        1
      );
    elsif updating then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
      insert into property_history values (
        record_id + 1,
        :new.property_id,
        :new.address,
        :new.annual_hike,
        :new.number_of_floors,
        :new.plinth_area,
        :new.total_area,
        :new.rent,
        :new.locality,
        :new.available_from,
        :new.available_till,
        :new.year_of_construction,
        null,
        'commercial',
        :new.type,
        1
      );
    elsif deleting then
      update property_history
      set
        is_current = 0
      where
        property_id = :old.property_id;
    end if;
  end commercial_property_history_trigger;
/