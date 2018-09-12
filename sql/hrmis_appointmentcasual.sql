[getList]
SELECT DISTINCT xx.`appointmentgroupname`,xx.objid
FROM hrmis_appointmentcasual xx
WHERE NOW() BETWEEN xx.`effectivefrom` AND xx.`effectiveuntil`
WHERE xx. appointmentgroupname LIKE $P{searchtext}

[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblemploymentplantilla p
INNER JOIN references_tbljobposition j ON j.`objid` = p.`jobposition_objid`
INNER JOIN hrmis_tblpayrollsalaryscheduleitem si ON si.`paygradeandstepincrementid` = j.`paygrade_objid`
WHERE si.salarytrancheid = $P{trancheid}
AND p.objid = $P{plantillaid};

[findPersonnelHasActiveAppointment]
SELECT * FROM hrmis_appointmentcasualitems xx
inner join hrmis_appointmentcasual xxx
WHERE xx.`personnel_objid` = $P{personnelid}
AND $P{effectivefrom} BETWEEN xxx.`effectivefrom` ANd xxx.`effectiveuntil`

[getCasualAppointmentItems]
SELECT x.* FROM hrmis_appointmentcasualitems xx
INNER JOIN etracs254_bukidnon.entityindividual i ON i.objid = xx.personnel_objid
WHERE xx.`parentid` = $P{parentid}
ORDER BY i.lastname