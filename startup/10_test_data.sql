connect c##project_dba/password;
set serveroutput on; 

execute create_new_user (205161944040, 'Ojas Dhar', 'password', 58, '815', 'Haridwar', 'Balasubramanian Marg', '065374', 'customer', '6390064081');

execute create_new_user (820655938098, 'Shalv Chahal', 'password', 24, '306', 'Kota', 'Jhaveri Path', '874070', 'customer', '0248989667');

execute create_new_user (613023615851, 'Ela Borra', 'password', 51, '577', 'Kurnool', 'Thakur Circle', '350691', 'customer', '6131059979');

execute create_new_user (492673121695, 'Arhaan Shenoy', 'password', 29, '343', 'Buxar', 'Kuruvilla Street', '706033', 'customer', '5204859124');

execute create_new_user (205133557947, 'Jhanvi Shukla', 'password', 38, '927', 'Proddatur', 'Swamy Road', '509032', 'customer', '1739269800');

execute create_new_user (563800287934, 'Navya Mangal', 'password', 65, '709', 'Meerut', 'Dubey Circle', '513169', 'customer', '2005028663');

execute create_new_user (114516488954, 'Amira Sethi', 'password', 36, '459', 'Chandrapur', 'Chauhan Marg', '999153', 'customer', '4189638194');

execute create_new_user (116500671542, 'Mehul Roy', 'password', 31, '351', 'Bhavnagar', 'Bhatt Marg', '448477', 'customer', '3201858639');

execute create_new_user (443740798995, 'Anya Bumb', 'password', 22, '191', 'Agra', 'Ganesan Nagar', '421802', 'customer', '9515813197');

execute create_new_user (441844869868, 'Adah Cheema', 'password', 57, '536', 'Tiruchirappalli', 'Sarma Street', '948716', 'customer', '8946307439');

execute create_new_user (227651916380, 'Mannat Buch', 'password', 20, '466', 'Kolhapur', 'Kale Circle', '812344', 'manager', '5650682696');

execute create_new_user (890459760434, 'Suhana Ghosh', 'password', 32, '678', 'Nizamabad', 'Thakur Road', '942058', 'manager', '7071457529');

execute create_new_user (100326688239, 'Pihu Bhardwaj', 'password', 60, '980', 'Orai', 'Varughese Zila', '834348', 'manager', '0714776145');

execute create_new_user (193678569153, 'Aniruddh Srinivasan', 'password', 39, '247', 'Kozhikode', 'Chahal', '614972', 'manager', '0661172119');

execute create_new_user (352546413931, 'Samarth Batra', 'password', 47, '766', 'Karawal Nagar', 'Bahl', '614424', 'manager', '5177038397');

execute insert_property_record('residential', 1, '76/77, Bains Street Faridabad-627417', 7, 3, 79, 111, 51600, 'Faridabad', date '2023-01-01', date '2024-01-01', 1941, 'independent_house', 492673121695, 205133557947, 2);

execute insert_property_record('residential', 2, '47/12, Borah Path Nandyal-287446', 10, 19, 20, 62, 15500, 'Nandyal', date '2022-10-01', date '2025-10-01', 1993, 'flat', 492673121695, null, 2);

execute insert_property_record('residential', 3, '93/028 Chakraborty Marg, Faridabad-046521', 5, 12, 54, 88, 47300, 'Faridabad', date '2022-08-01', date '2023-08-01', 1985, 'flat', 205133557947, 116500671542, 1);

execute insert_property_record('residential', 4, '11/61 Gara Bokaro 006756', 5, 15, 40, 87, 68100, 'Bokaro', date '2023-08-01', date '2026-08-01', 2006, 'flat', 563800287934, null, 1);

execute insert_property_record('residential', 5, 'H.No. 610, Ganesh Ganj, Jorhat-696969', 9, 23, 57, 77, 66000, 'Jorhat', date '2022-04-01', date '2024-04-01', 1929, 'independent_house', 116500671542, 613023615851, 2);

execute insert_property_record('residential', 6, 'H.No. 76 Dara Marg Patna-299087', 2, 2, 23, 52, 89700, 'Patna', date '2023-01-01', date '2024-01-01', 2015, 'independent_house', 205161944040, 613023615851, 3);

execute insert_property_record('residential', 7, 'H.No. 884, Raval Mysore-161386', 2, 13, 89, 107, 68000, 'Mysore', date '2022-08-01', date '2024-08-01', 2015, 'independent_house', 613023615851, 563800287934, 4);

execute insert_property_record('residential', 8, '84 Babu Circle, Kolkata-368435', 10, 10, 75, 107, 88600, 'Kolkata', date '2022-08-01', date '2023-08-01', 1999, 'independent_house', 205133557947, 613023615851, 1);

execute insert_property_record('residential', 9, '29 Thaman Vadodara 050013', 9, 10, 57, 77, 52600, 'Vadodara', date '2022-11-01', date '2023-11-01', 1986, 'independent_house', 613023615851, 205161944040, 3);

execute insert_property_record('residential', 10, '31/72, Khatri Marg Kochi-874217', 7, 4, 94, 133, 59600, 'Kochi', date '2022-07-01', date '2024-07-01', 1945, 'independent_house', 114516488954, 205161944040, 1);

execute insert_property_record('commercial', 1, '834 Kadakia Marg Meerut 627739', 6, 25, 22, 42, 14800, 'Meerut', date '2022-05-01', date '2023-05-01', 1940, 'warehouse', 613023615851, 441844869868);

execute insert_property_record('commercial', 2, 'H.No. 444 Tata Circle, Kharagpur-925966', 1, 22, 38, 73, 18000, 'Kharagpur', date '2023-07-01', date '2024-07-01', 2018, 'warehouse', 116500671542, 205161944040);

execute insert_property_record('commercial', 3, '00/081, Mammen Path, Kolkata-681847', 5, 10, 68, 105, 82600, 'Kolkata', date '2023-02-01', date '2026-02-01', 1929, 'shop', 443740798995, 441844869868);

execute insert_property_record('commercial', 4, 'H.No. 19, Taneja Street Ranchi-585962', 10, 16, 28, 41, 37300, 'Ranchi', date '2023-03-01', date '2026-03-01', 1925, 'warehouse', 205161944040, 116500671542);

execute insert_property_record('commercial', 5, 'H.No. 169, Bhatia Road, Thane-520102', 10, 21, 23, 51, 83400, 'Thane', date '2023-05-01', date '2024-05-01', 2018, 'warehouse', 441844869868, 563800287934);

execute insert_property_record('commercial', 6, 'H.No. 125 Sami Marg Gaya-734926', 9, 13, 94, 135, 91700, 'Gaya', date '2022-08-01', date '2023-08-01', 1939, 'warehouse', 613023615851, 820655938098);

execute insert_property_record('commercial', 7, '35/34, Barad Ganj, Thane 601798', 6, 20, 100, 124, 51300, 'Thane', date '2023-02-01', date '2024-02-01', 1939, 'shop', 441844869868, 114516488954);

execute insert_property_record('commercial', 8, '35, Chadha Zila Bangalore 897935', 2, 17, 48, 82, 28200, 'Bangalore', date '2023-03-01', date '2026-03-01', 1938, 'warehouse', 114516488954, 205133557947);

execute insert_property_record('commercial', 9, 'H.No. 85, Subramanian Zila, New Delhi-731194', 6, 13, 93, 125, 91000, 'New Delhi', date '2023-04-01', date '2024-04-01', 1902, 'shop', 441844869868, null);

execute insert_property_record('commercial', 10, '30/132, Sekhon Circle, Haridwar 447769', 8, 10, 32, 63, 18100, 'Haridwar', date '2022-06-01', date '2024-06-01', 1913, 'shop', 492673121695, 441844869868);

