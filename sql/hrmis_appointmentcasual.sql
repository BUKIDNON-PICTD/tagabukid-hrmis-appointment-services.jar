[getList]
SELECT DISTINCT xx.`appointmentgroupname`,xx.objid
FROM hrmis_appointmentcasual xx
WHERE NOW() BETWEEN xx.`effectivefrom` AND xx.`effectiveuntil`
WHERE xx. appointmentgroupname LIKE $P{searchtext}

[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblemploymentplantilla p
INNER JOIN references_tbljobposition j ON j.`objid` = p.`jobposition_objid`
INNER JOIN hrmis_tblpayrollsalaryscheduleitem si ON si.`paygradeandstepincrementid` = j.`paygradeid`
WHERE si.salarytrancheid = $P{trancheid}
AND p.objid = $P{plantillaid};

