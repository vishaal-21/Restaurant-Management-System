set serveroutput on

create or replace package employee_audit is 
    procedure new_employee(fname varchar,lname varchar,pos employee.description%type,city employee.address%type,zip employee.address%type,
            phno employee.phno%type,salary employee.salary%type);
    function id_gen(fname varchar, lname varchar) return varchar;
end employee_audit;
/

create or replace package body employee_audit is
    function id_gen(fname varchar, lname varchar) return varchar
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

    procedure new_employee(fname varchar,lname varchar,pos employee.description%type,city employee.address%type,zip employee.address%type,
            phno employee.phno%type,salary employee.salary%type) is
        id employee.e_id%type;
        t_name varchar(20);
        t_address employee.address%type;
    begin
        id:=id_gen(fname,lname);
        t_name:=fname || ' ' || lname;
        t_address:=city || '-' || zip;

        insert into employee values(id,pos,t_address,phno,salary);

        if pos='Delivery' then
            insert into delivery values(id,t_name,null);
        elsif pos='Chef' then
            insert into chef values(id,t_name);
        end if;
    end new_employee;
end employee_audit;
/

declare
    fname varchar(20);
    lname varchar(20);
    pos employee.description%type;
    city employee.address%type;
    zip employee.address%type;
    phno employee.phno%type;
    salary employee.salary%type;
begin
    fname:='&first_name';
    lname:='&last_name';
    pos:='&position';
    city:='&city';
    zip:='&pincode';
    phno:='&phone_number';
    salary:='&salary';

    employee_audit.new_employee(fname,lname,pos,city,zip,phno,salary);
end;
/