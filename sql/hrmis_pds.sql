[getList]
select name
from references_tblloccountry
where name like $P{searchtext}

[getCountry]
select name
from references_tblloccountry
where name like $P{searchtext}
order by name asc

[getQuestions]
SELECT * FROM references_tblpdsq ORDER BY position;