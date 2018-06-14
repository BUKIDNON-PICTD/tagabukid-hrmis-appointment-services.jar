[getList]
SELECT DISTINCT xx.`appointmentgroupname`,xx.objid
FROM hrmis_appointmentcasual xx
WHERE NOW() BETWEEN xx.`effectivefrom` AND `xx.`effectiveuntil`
WHERE xx. appointmentgroupname LIKE $P{searchtext}