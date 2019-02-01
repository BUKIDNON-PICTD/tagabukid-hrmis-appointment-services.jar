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