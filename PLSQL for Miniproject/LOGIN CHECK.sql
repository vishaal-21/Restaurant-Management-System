set serveroutput on

declare
    name customer.c_name%type;
    ph customer.phno%type;

    cursor c is select c_name,phno from customer;
    flag number:=0;
begin
    name:='&full_name';
    ph:='&phone_number';

    for i in c
    loop
        if i.c_name=name and i.phno=ph then 
            flag:=1;
            exit;
        end if;
    end loop;

    if flag=1 then 
        pkg.order_init(name);
    else dbms_output.put_line('No customer found! Login first');    
    end if;
end;
/