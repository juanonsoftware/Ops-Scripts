SELECT p.name, p.last_deployed_time
FROM   [internal].[projects] p
order by p.last_deployed_time desc