select * from emp

-- 1)  student is > 75000 

-- true => "good salary"

-- false => "average salary"

	
CREATE OR REPLACE FUNCTION checksalary(sal_count int)
RETURNS varchar as $$
DECLARE 
       result varchar;
BEGIN
    if sal_count > 75000 THEN result = 'good salary';
	ELSE result = 'average salary';	
	END if;
	RETURN  result;
END
$$ language plpgsql;

select *, checksalary(salary::int) from emp


-- 2) This is show age_status ('adult','senior',super senior)

Create or Replace Function age_status(age int)
RETURNS varchar as $$
DECLARE 
		age_criteria varchar;
BEGIN
	CASE 
		when age < 40 then age_criteria = 'Adult';
		when age > 50 then age_criteria = 'Senior';
		ELSE age_criteria = 'Super Senior';
	END CASE;
	RETURN age_criteria;
END
$$ language plpgsql;

select *, age_status(age) from emp

