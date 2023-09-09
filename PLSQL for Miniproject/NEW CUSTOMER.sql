set serveroutput on

create or replace package customer_audit is 
    procedure new_customer(fname customer.c_name%type,lname customer.c_name%type,city customer.address%type,pincode customer.address%type,
        phno customer.phno%type);
    function id_gen(fname customer.c_name%type, lname customer.c_name%type) return varchar;
end customer_audit;
/

create or replace package body customer_audit is
    function id_gen(fname customer.c_name%type, lname customer.c_name%type) return varchar
    as id varchar(5);
    alpha1 char(1);
    alpha2 char(1);
    l_digits NUMBER(3);
    begin
        alpha1 := SUBSTR(fname, 1, 1);
        alpha2 := SUBSTR(lname, 1, 1);
        l_digits := TRUNC(DBMS_RANDOM.VALUE(0, 1000));
        id:= alpha1 || alpha2 || LPAD(l_digits, 3, '0');

        return id;
    end id_gen;

    procedure new_customer(fname customer.c_name%type,lname customer.c_name%type,city customer.address%type,pincode customer.address%type,
        phno customer.phno%type) is 
    
    id customer.c_id%type;
    t_name customer.c_name%type;
    t_address customer.address%type;
    begin  
        id:=id_gen(fname,lname);
        t_name:=fname || ' ' || lname;
        t_address:=city || '-' || pincode;

        insert into customer values(id,t_name,t_address,phno);
    end new_customer;
end customer_audit;
/

declare
    fname customer.c_name%type;
    lname customer.c_name%type;
    city customer.address%type;
    pincode customer.address%type;
    phno customer.phno%type;
begin
    fname:='&fname';
    lname:='&lname';
    city:='&city';
    pincode:='&pincode';
    phno:='&phno';

    customer_audit.new_customer(fname,lname,city,pincode,phno);
end;
/

