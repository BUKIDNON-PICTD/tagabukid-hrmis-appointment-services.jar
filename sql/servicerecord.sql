[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblpayrollsalaryscheduleitem si
INNER JOIN hrmis_tblpayrollsalarytranche st ON st.objid = si.salarytrancheid
INNER JOIN references_tblpaygradeandstepincrement psi ON psi.objid = si.paygradeandstepincrementid
WHERE si.salarytrancheid = $P{trancheid}
AND si.paygradeandstepincrementid = $P{paygradestepincrementid}
