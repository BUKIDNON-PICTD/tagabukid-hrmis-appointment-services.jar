[getResult]
SELECT p.objid,
p.`itemno`,
j.`name` as position,
pds.`person_name` as personnel,
grade.`grade`,
IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)) as currentstep,
currenttranche.name,
currentinc.amount * 12 as currentannual,
IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)) AS prevstep,
prevtranche.name,
previnc.amount * 12 as prevannual

FROM hrmis_tblemploymentplantilla p
inner JOIN references_tblorganizationunit o on o.`orgunitid` = p.`org_orgunitid`
inner JOIN references_tbljobposition j on j.`objid` = p.`jobposition_objid`
LEFT JOIN `references_tblpaygradeandstepincrement` grade on grade.`objid` = j.`paygrade_objid`
INNER JOIN hrmis_appointmentpermanent ap on ap.`plantilla_objid` = p.`objid`
INNER JOIN hrmis_pds pds on pds.`objid` = ap.`pds_objid`
INNER JOIN references_tblpaygradeandstepincrement currentstep on currentstep.`grade` = grade.`grade` and currentstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1))
INNER JOIN hrmis_tblpayrollsalaryscheduleitem currentinc on currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid from `hrmis_tblpayrollsalarytranche` WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
inner join `hrmis_tblpayrollsalarytranche` currenttranche on currenttranche.objid = currentinc.salarytrancheid
inner join references_tblpaygradeandstepincrement prevstep on prevstep.`grade` = grade.`grade` and prevstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1))
inner join hrmis_tblpayrollsalaryscheduleitem previnc on previnc.paygradeandstepincrementid = prevstep.`objid` AND previnc.salarytrancheid = (SELECT objid from `hrmis_tblpayrollsalarytranche` WHERE LAST_DAY(NOW()) - INTERVAL 1 YEAR BETWEEN effectivefromdate AND effectivetodate)
inner join `hrmis_tblpayrollsalarytranche` prevtranche on prevtranche.objid = previnc.salarytrancheid

WHERE
	p.type = 'Permanent'
AND
	p.org_orgunitid ='${funnel}'


ORDER BY
p.itemno