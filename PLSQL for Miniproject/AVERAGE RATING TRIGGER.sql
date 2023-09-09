set serveroutput on

create or replace trigger avg_rating
before update of rating
on deliveries
for each row

declare
    sum_rating number;
    num number;
    did delivery.d_id%type;
begin
    did:=:new.d_id;

    select sum(rating) into sum_rating
    from rates
    where d_id=(select d_id from rates where rating=0);

    select count(*) into num
    from rates
    where d_id=(select d_id from rates where rating=0);

    update delivery set rating=(sum_rating+:new.rating)/num where d_id=did;
end;
/