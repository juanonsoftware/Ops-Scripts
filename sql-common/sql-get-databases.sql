select * from sys.databases
where name like '%prod%'
order by name

print @@rowcount