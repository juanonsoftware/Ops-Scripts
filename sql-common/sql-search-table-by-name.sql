select name, type_desc, create_date
from BPDB.sys.tables
where name like '%u%'
order by create_date desc

select @@rowcount