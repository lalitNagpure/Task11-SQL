-- 1) This is show income_category('Rich_cast','Middle_cast','Poor').

select * from sales
	
CREATE OR REPLACE FUNCTION check_category(category_count int)
RETURNS varchar as $$
DECLARE 
	income_category varchar;
BEGIN
    CASE
        WHEN category_count > 1200 THEN income_category := 'Rich_cast';
        WHEN category_count BETWEEN 800 AND 1100 THEN income_category := 'Middle_cast';
        ELSE income_category :='Poor';
    END CASE;
    RETURN income_category;
END;
$$ LANGUAGE plpgsql

select check_category(1300)

select check_category(1100)

select check_category(700)


select  sales, check_category(sales::int) from sales


-- 2) This sales shows order_status is order complete or not.


Create Or Replace function order_status(sales_count int)
RETURNS Varchar as $$
DECLARE 
	output varchar;
BEGIN
	if sales_count > 60 THEN output := 'order is complete';
	ELSE output := 'order is not complete';
	END IF;
	RETURN output;
END
$$ LANGUAGE plpgsql

select order_status(0)

select sales, order_status(sales::int) from sales
 
-- 3) This is show age_status ('adult','senior',super senior)

CREATE OR REPLACE FUNCTION age_category(age int)
RETURNS varchar as $$
DECLARE
       age_status varchar;
BEGIN
  CASE
       WHEN age<35 THEN age_status:='adult';
       WHEN age<58 THEN age_status:='senior';
       ELSE age_status:='super senior';
  END CASE;
  RETURN age_status;
END
$$ language plpgsql;

select *, age_category(age) from customer

-- 4) discount > 0 is good discount else bad discount

CREATE OR REPLACE FUNCTION checkdiscount(discount int)
RETURNS varchar as $$
DECLARE
      output varchar;
BEGIN
 if discount > 0 THEN output := 'good discount';
	ELSE output := 'bad discount';
	END IF;
	RETURN output;
END
$$ language plpgsql;

select discount, checkdiscount(discount::int) from sales

-- 5) sales < 600 negetive sale else positive sale 
	
create or replace function check_sales (sales double precision)
returns varchar as $$
declare
       output varchar;
begin
       if sales <600 then output ='negetive sale';
       else output ='positive sale' ;
       end if;
       return output;
end
$$ language plpgsql

select *, check_sales(sales) from sales
