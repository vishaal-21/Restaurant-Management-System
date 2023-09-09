set serveroutput on

create or replace trigger calculate_bill
before insert or update 
on daily_inventory
for each row

declare
bill_total number;
amt daily_inventory.sales%type;

begin
    amt:=:new.sales;

    update orders set amount=amount+amt where o_id=:new.o_id;
    update deliveries set amount=amount+amt where o_id=:new.o_id;
end;
/