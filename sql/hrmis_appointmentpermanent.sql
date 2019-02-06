[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblemploymentplantilla p
INNER JOIN references_tbljobposition j ON j.`objid` = p.`jobposition_objid`
INNER JOIN hrmis_tblpayrollsalaryscheduleitem si ON si.`paygradeandstepincrementid` = j.`paygrade_objid`
INNER JOIN hrmis_tblpayrollsalarytranche t ON t.objid = si.salarytrancheid
WHERE NOW() BETWEEN t.effectivefromdate AND t.effectivetodate
AND p.objid = $P{plantillaid};

[findPersonnelHasActiveAppointment]
SELECT * FROM hrmis_appointmentpermanent xx
WHERE xx.`personnel_objid` = $P{personnelid}
AND $P{effectivefrom} BETWEEN xx.`effectivefrom` ANd xx.`effectiveuntil`

[getCasualAppointmentItems]
SELECT x.* FROM hrmis_appointmentcasualitems xx
INNER JOIN etracs254_bukidnon.entityindividual i ON i.objid = xx.personnel_objid
WHERE xx.`parentid` = $P{parentid}
ORDER BY i.lastname

[getOriginalAppointment]
SELECT 
"ISSUED" as status,
p.`objid` AS appointment_objid,
t.`objid` AS tranche_objid,
i.`objid` AS paygradestep_objid,
p.`effectivefrom`,
p.`effectivefrom`,
i.`amount`,
gs.`grade`,
gs.`step`
FROM hrmis_appointmentpermanent p
INNER JOIN hrmis_tblpayrollsalaryscheduleitem i ON i.`paygradeandstepincrementid` = p.`paygradeandstepincrement_objid`
INNER JOIN references_tblpaygradeandstepincrement gs ON gs.objid = i.`paygradeandstepincrementid`
INNER JOIN hrmis_tblpayrollsalarytranche t ON i.`salarytrancheid` = t.objid 
WHERE (p.`effectivefrom` BETWEEN t.`effectivefromdate` AND t.`effectivetodate`)
AND gs.`step` = 1 AND p.objid = $P{objid}