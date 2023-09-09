set serveroutput on
declare
od_id orders.o_id%type;
iid menu.item_id%type;
num number;
amt number;

begin
    select o_id into od_id
    from deliveries
    where rating=0;

    iid:='&item_id';
    num:='&quantity';
    
    select price into amt
    from menu
    where item_id=iid;

    insert into daily_inventory values(od_id,iid,num,amt*num);
end;
/