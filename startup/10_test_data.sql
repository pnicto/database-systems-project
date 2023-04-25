set serveroutput on;

connect c##project_dba/password;

execute create_new_user (1, 'John', 'password', 15, '121', 'city', 'street', '515001', 'manager', '123456789');

execute create_new_user (2, 'Doe', 'secure_pass', 40, '357', 'city', 'street', '500075', 'manager', '987654321');

execute insert_property_record('residential', 1, 'Address', 100, 10, 50, 70, 50000, 'locality', date '2023-12-01', date '2024-12-01', 2001, 'flat', 1, 1, 3);

execute insert_property_record('residential', 2, 'Address 2', 200, 2, 30, 60, 27100, 'locality 2', date '2023-01-01', date '2024-07-01', 1984, 'independent_house', 1, 2, 2);

execute insert_property_record('commercial', 1, 'Address', 200, 2, 30, 60, 27100, 'locality', date '2023-01-01', date '2024-07-01', 1984, 'shop', 2, 1);

execute insert_property_record('commercial', 2, 'Address 2', 4000, 10, 100, 160, 550055, 'locality 2', date '2011-03-01', date '2024-07-01', 1800, 'warehouse', 2, 1);