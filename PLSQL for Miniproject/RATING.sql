set serveroutput on

declare
cursor c is select * from rates natural join orders where rating=0;

od_id orders.o_id%type;
dname delivery.d_name%type;
did delivery.d_id%type;
rate number;

begin
    rate:='&rating';
    
    for i in c
    loop
        od_id:=i.o_id;

        select d_name,d_id into dname,did
        from delivery
        where d_id=i.d_id;
    end loop;

    dbms_output.put_line('You entered '||rate||' rating for your order number '||od_id||' delivered by '||dname);

    update deliveries set rating=rate where rating=0;
    update rates set rating=rate where rating=0;
end;
/