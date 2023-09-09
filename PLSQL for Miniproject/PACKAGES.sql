set serveroutput on 

create or replace package pkg is
    function order_id_gen return varchar;
    function delivery_person_gen return number;
    procedure order_init(name customer.c_name%type);
end pkg;
/

create or replace package body pkg is

    function order_id_gen 
    return varchar as
    l_random_string VARCHAR(6);
      l_alphabets VARCHAR(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      l_alpha1 CHAR(1);
      l_alpha2 CHAR(1);
      l_alpha3 CHAR(1);
      l_digits NUMBER(3);
    BEGIN
      l_alpha1 := SUBSTR(l_alphabets, DBMS_RANDOM.VALUE(1, LENGTH(l_alphabets)), 1);
      l_alpha2 := SUBSTR(l_alphabets, DBMS_RANDOM.VALUE(1, LENGTH(l_alphabets)), 1);
      l_alpha3 := SUBSTR(l_alphabets, DBMS_RANDOM.VALUE(1, LENGTH(l_alphabets)), 1);
    
      l_digits := TRUNC(DBMS_RANDOM.VALUE(0, 1000));
    
      l_random_string := l_alpha1 || l_alpha2 || l_alpha3 || LPAD(l_digits, 3, '0');

      return l_random_string;
    END order_id_gen;
    

    function delivery_person_gen
    return number as
    random number;
    n number;
    BEGIN
        select count(*) into n
        from delivery;

        random:=MOD(TRUNC(DBMS_RANDOM.VALUE(1,100)),n)+1;
        return random;
    end delivery_person_gen;

    procedure order_init(name customer.c_name%type) is
    cursor c is select d_id from delivery;
    od_id orders.o_id%type;
    cid customer.c_id%type;
    did delivery.d_id%type;
    i number;
    cnt number;

    BEGIN
        od_id:= order_id_gen;

        select c_id into cid
        from customer 
        where c_name=name;

        i:=pkg.delivery_person_gen; 
        cnt:=1;
        for x in c
        loop
            if cnt=i then
                did:=x.d_id;
                exit;
            end if;
            cnt:=cnt+1;
        end loop;      

        insert into orders values(od_id,cid,did,current_date,0);
        insert into deliveries values(od_id,did,current_date,0,0);
        insert into rates values(cid,did,current_date,0);
    end order_init;
end pkg;
/
--------------------------------------------------------------------------------