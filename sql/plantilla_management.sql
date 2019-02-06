[getResult]
SELECT p.objid,
(SELECT itemno FROM hrmis_tblemploymentplantilla_previous WHERE parentid = p.objid ORDER BY recordlog_datecreated DESC LIMIT 1 OFFSET 1) AS previtemno,
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
LEFT JOIN references_tblorganizationunit o on o.`orgunitid` = p.`org_orgunitid`
LEFT JOIN references_tbljobposition j on j.`objid` = p.`jobposition_objid`
LEFT JOIN `references_tblpaygradeandstepincrement` grade on grade.`objid` = j.`paygrade_objid`
LEFT JOIN hrmis_appointmentpermanent ap on ap.`plantilla_objid` = p.`objid`
LEFT JOIN hrmis_pds pds on pds.`objid` = ap.`pds_objid`
LEFT JOIN references_tblpaygradeandstepincrement currentstep on currentstep.`grade` = grade.`grade` and currentstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1))
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc on currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid from `hrmis_tblpayrollsalarytranche` WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
LEFT join `hrmis_tblpayrollsalarytranche` currenttranche on currenttranche.objid = currentinc.salarytrancheid
LEFT join references_tblpaygradeandstepincrement prevstep on prevstep.`grade` = grade.`grade` and prevstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1))
LEFT join hrmis_tblpayrollsalaryscheduleitem previnc on previnc.paygradeandstepincrementid = prevstep.`objid` AND previnc.salarytrancheid = (SELECT objid from `hrmis_tblpayrollsalarytranche` WHERE LAST_DAY(NOW()) - INTERVAL 1 YEAR BETWEEN effectivefromdate AND effectivetodate)
LEFT join `hrmis_tblpayrollsalarytranche` prevtranche on prevtranche.objid = previnc.salarytrancheid

WHERE
	p.type = 'Permanent'
AND
	p.org_orgunitid ='${funnel}'

ORDER BY
p.itemno

[getTrancheName]
SELECT objid, name, circular_acronymabbreviation AS circular, (SELECT YEAR(NOW()) - 1) as prevyear  FROM `hrmis_tblpayrollsalarytranche`
WHERE NOW() BETWEEN effectivefromdate AND effectivetodate