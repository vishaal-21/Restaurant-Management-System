drop trigger calculate_bill;
delete from chef;
delete from rates;
delete from daily_inventory;
delete from restaurant;
delete from deliveries;
delete from orders;
delete from delivery;
delete from employee;
delete from customer;
delete from menu;

insert into customer values('AP764', 'Aarav Patel', 'Delhi-110007', 9834789512);
insert into customer values('AS231', 'Aishwarya Singh', 'Bangalore-560086', 7746910325);
insert into customer values('SS495', 'Siddharth Sharma', 'Mumbai-400092', 8976543102);
insert into customer values('KG302', 'Kavya Gupta', 'Jaipur-302004', 9123456789);
insert into customer values('AM897', 'Arjun Mehra', 'Chandigarh-160015', 9890765432);

insert into employee values('RM764', 'Delivery', 'Bangalore-560001', 9876543210, 300000);
insert into employee values('KN982', 'Delivery', 'Delhi-110058', 8123456789, 200000);
insert into employee values('DS635', 'Chef', 'Tamil Nadu-641009', 7012345678, 850000);
insert into employee values('RK123', 'Manager', 'Jaipur-302017', 9876543210, 2000000);
insert into employee values('AS419', 'Chef', 'Hyderabad-500034', 9012345678, 1200000);
insert into employee values('AP573', 'Delivery', 'Mumbai-400058', 7777777000, 250000);
insert into employee values('RS846', 'Chef', 'Bhubaneshwar-751009', 9898765432, 950000);

insert into chef values('DS635', 'Devanshi Shah');
insert into chef values('AS419', 'Arjun Singhania');
insert into chef values('RS846', 'Radhika Sharma');

insert into delivery values('RM764', 'Ranbir Mehta', 4);
insert into delivery values('KN982', 'Kabir Nair', 3.67);
insert into delivery values('AP573', 'Anika Patel', 4);

insert into restaurant values('GD13', 'Gourmet Delights', 'Bangalore-560034', 7766554433, 'RK123');

insert into menu values('VS1', 'Bruschetta', 200,'Veg Starter');
insert into menu values('VS2', 'Caprese Salad ', 350,'Veg Starter');
insert into menu values('VS3', 'Falafel', 150,'Veg Starter');
insert into menu values('VS4', 'Paneer Tikka', 200,'Veg Starter');
insert into menu values('VS5', 'Spinach and Feta Samosas', 125,'Veg Starter');
insert into menu values('NVS1', 'Chicken Satay', 250,'Non-Veg Starter');
insert into menu values('NVS2', 'Fish Fingers', 150,'Non-Veg Starter');
insert into menu values('NVS3', 'Shrimp Cocktail', 450,'Non-Veg Starter');
insert into menu values('NVS4', 'Tandoori Chicken', 250,'Non-Veg Starter');
insert into menu values('NVS5', 'Crab Cakes', 500,'Non-Veg Starter');
insert into menu values('VMC1', 'Ratatouille', 300,'Veg Main Course');
insert into menu values('VMC2', 'Vegetable Lasagna', 350,'Veg Main Course');
insert into menu values('VMC3', 'Vegetable Biryani', 200,'Veg Main Course');
insert into menu values('VMC4', 'Grilled Vegetable Skewers', 180,'Veg Main Course');
insert into menu values('VMC5', 'Spinach and Ricotta Cannelloni', 300,'Veg Main Course');
insert into menu values('NVMC1', 'Butter Chicken', 160,'Non-Veg Main Course');
insert into menu values('NVMC2', 'Chicken Alfredo', 400,'Non-Veg Main Course');
insert into menu values('NVMC3', 'Seafood Paella', 500,'Non-Veg Main Course');
insert into menu values('NVMC4', 'Grilled Salmon', 500,'Non-Veg Main Course');
insert into menu values('NVMC5', 'Pork Chops with Apple Chutney', 450,'Non-Veg Main Course');
insert into menu values('DS1', 'Tiramisu', 150,'Desserts');
insert into menu values('DS2', 'Creme Brulee', 200,'Desserts');
insert into menu values('DS3', 'Chocolate Lava Cake', 120,'Desserts');
insert into menu values('DS4', 'Baked Alaska', 190,'Desserts');
insert into menu values('D1', 'Cucumber-Mint Cooler', 150,'Drinks');
insert into menu values('D2', 'Watermelon Lemonade', 150,'Drinks');
insert into menu values('D3', 'Strawberry-Basil Lemonade', 150,'Drinks');

insert into orders values('QWX725','AP764','RM764',to_date('2023-05-01','yyyy-mm-dd'),600);
insert into orders values('VRI813','SS495','KN982',to_date('2023-05-01','yyyy-mm-dd'),1465);
insert into orders values('JFS563','AS231','AP573',to_date('2023-05-01','yyyy-mm-dd'),900);
insert into orders values('CGW061','AP764','AP573',to_date('2023-05-02','yyyy-mm-dd'),1200);
insert into orders values('EFM800','KG302','RM764',to_date('2023-05-03','yyyy-mm-dd'),2250);
insert into orders values('BLN263','AM897','KN982',to_date('2023-05-03','yyyy-mm-dd'),1235);
insert into orders values('KHD238','SS495','KN982',to_date('2023-05-04','yyyy-mm-dd'),450);

insert into daily_inventory values('QWX725','VS1',2,400);
insert into daily_inventory values('QWX725','VMC3',1,200);
insert into daily_inventory values('VRI813','VS1',3,600);
insert into daily_inventory values('VRI813','VS5',5,625);
insert into daily_inventory values('VRI813','DS3',2,240);
insert into daily_inventory values('JFS563','D1',2,300);
insert into daily_inventory values('JFS563','D2',4,600);
insert into daily_inventory values('CGW061','NVMC2',1,400);
insert into daily_inventory values('CGW061','NVMC3',1,500);
insert into daily_inventory values('CGW061','D3',2,300);
insert into daily_inventory values('EFM800','VS3',3,450);
insert into daily_inventory values('EFM800','VMC3',2,400);
insert into daily_inventory values('EFM800','DS2',4,800);
insert into daily_inventory values('EFM800','D1',4,600);
insert into daily_inventory values('BLN263','VS5',3,375);
insert into daily_inventory values('BLN263','VMC4',2,360);
insert into daily_inventory values('BLN263','NVMC4',1,500);
insert into daily_inventory values('KHD238','DS1',1,150);
insert into daily_inventory values('KHD238','DS2',1,150);
insert into daily_inventory values('KHD238','DS3',1,150);

insert into deliveries values('QWX725','RM764',to_date('2023-05-01','yyyy-mm-dd'),600,4);
insert into deliveries values('VRI813','KN982',to_date('2023-05-01','yyyy-mm-dd'),1465,4);
insert into deliveries values('JFS563','AP573',to_date('2023-05-01','yyyy-mm-dd'),900,3.5);
insert into deliveries values('CGW061','AP573',to_date('2023-05-02','yyyy-mm-dd'),1200,4.5);
insert into deliveries values('EFM800','RM764',to_date('2023-05-03','yyyy-mm-dd'),2250,4);
insert into deliveries values('BLN263','KN982',to_date('2023-05-03','yyyy-mm-dd'),1235,3.5);
insert into deliveries values('KHD238','KN982',to_date('2023-05-04','yyyy-mm-dd'),450,3.5);

insert into rates values('AP764','RM764',to_date('2023-05-01','yyyy-mm-dd'),4);
insert into rates values('SS495','KN982',to_date('2023-05-01','yyyy-mm-dd'),4);
insert into rates values('AS231','AP573',to_date('2023-05-01','yyyy-mm-dd'),3.5);
insert into rates values('AP764','AP573',to_date('2023-05-02','yyyy-mm-dd'),4.5);
insert into rates values('KG302','RM764',to_date('2023-05-03','yyyy-mm-dd'),4);
insert into rates values('AM897','KN982',to_date('2023-05-03','yyyy-mm-dd'),3.5);
insert into rates values('SS495','KN982',to_date('2023-05-04','yyyy-mm-dd'),3.5);

select * from chef;
select * from rates;
select * from daily_inventory;
select * from restaurant;
select * from deliveries;
select * from orders;
select * from delivery;
select * from employee;
select * from customer;
select * from menu;