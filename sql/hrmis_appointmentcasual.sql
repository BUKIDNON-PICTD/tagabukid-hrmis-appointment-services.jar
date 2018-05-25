[getList]
SELECT * 
FROM hrmis_appointmentcasual 
WHERE appointmentgroupname LIKE $P{searchtext}