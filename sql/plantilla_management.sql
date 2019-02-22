[getPermanentPlantilla]
SELECT p.objid,
(SELECT itemno FROM hrmis_tblemploymentplantilla_previous WHERE parentid = p.objid ORDER BY recordlog_datecreated DESC LIMIT 1 OFFSET 1) AS previtemno,
p.`itemno`,
j.`name` AS position,
pds.`person_name` AS personnel,
grade.`grade`,
IF(IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)),IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)),1)  AS currentstep,
currenttranche.name,
IF(p.isfunded > 0, currentinc.amount * 12, null) AS currentannual,
IF(IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)),IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)),1) AS prevstep,
prevtranche.name,
IF(p.isfunded > 0, previnc.amount * 12, null) AS prevannual

FROM hrmis_tblemploymentplantilla p
LEFT JOIN references_tblorganizationunit o ON o.`orgunitid` = p.`org_orgunitid`
LEFT JOIN references_tbljobposition j ON j.`objid` = p.`jobposition_objid`
LEFT JOIN `references_tblpaygradeandstepincrement` grade ON grade.`objid` = j.`paygrade_objid`
LEFT JOIN hrmis_appointmentpermanent ap ON ap.`plantilla_objid` = p.`objid`
LEFT JOIN hrmis_pds pds ON pds.`objid` = ap.`pds_objid`

LEFT JOIN references_tblpaygradeandstepincrement currentstep ON currentstep.`grade` = grade.`grade` AND currentstep.`step` = IF(IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)),IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)),1)
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc ON currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid FROM `hrmis_tblpayrollsalarytranche` WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN `hrmis_tblpayrollsalarytranche` currenttranche ON currenttranche.objid = currentinc.salarytrancheid
LEFT JOIN references_tblpaygradeandstepincrement prevstep ON prevstep.`grade` = grade.`grade` AND prevstep.`step` = IF(IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)),IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)),1)
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem previnc ON previnc.paygradeandstepincrementid = prevstep.`objid` AND previnc.salarytrancheid = (SELECT objid FROM `hrmis_tblpayrollsalarytranche` WHERE LAST_DAY(NOW()) - INTERVAL 1 YEAR BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN `hrmis_tblpayrollsalarytranche` prevtranche ON prevtranche.objid = previnc.salarytrancheid

WHERE
p.type = "Permanent"
AND
o.orgunitid = '${funnel}'

ORDER BY
p.itemno

[getCasualPlantilla]
SELECT p.objid,
o.name,
(SELECT itemno FROM hrmis_tblemploymentplantilla_previous WHERE parentid = p.objid ORDER BY recordlog_datecreated DESC LIMIT 1 OFFSET 1) AS previtemno,
p.`itemno`,
j.`name` AS position,
pds.`person_name` AS personnel,
grade.`grade`,
-- IF((TIMESTAMPDIFF(YEAR,DATE_ADD(CURDATE(), INTERVAL 1 YEAR),NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,curdate(),NOW())/3)+1)) as currentstep,
IF((TIMESTAMPDIFF(YEAR,DATE_SUB(CURDATE(), INTERVAL 1 YEAR),NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,DATE_SUB(CURDATE(), INTERVAL 1 YEAR),NOW())/3)+1)) AS currentstep,

currentinc.amount * 12 AS currentannual,
-- IF((TIMESTAMPDIFF(YEAR,curdate(),LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,curdate(),LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)) AS prevstep,
IF((TIMESTAMPDIFF(YEAR,DATE_SUB(CURDATE(), INTERVAL 1 YEAR),LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,DATE_SUB(CURDATE(), INTERVAL 1 YEAR),LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)) AS prevstep,

previnc.amount * 12 AS prevannual

FROM hrmis_tblemploymentplantilla p

LEFT JOIN references_tblorganizationunit o ON o.`orgunitid` = p.`org_orgunitid`
LEFT JOIN references_tbljobposition j ON j.`objid` = p.`jobposition_objid`
LEFT JOIN `references_tblpaygradeandstepincrement` grade ON grade.`objid` = j.`paygrade_objid`
LEFT JOIN
	hrmis_appointmentcasualitems ap ON ap.`plantilla_objid` = p.`objid`
	AND ap.`parentid` IN (SELECT objid FROM hrmis_appointmentcasual WHERE effectiveuntil > NOW())	  
LEFT JOIN hrmis_pds pds ON pds.`objid` = ap.`pds_objid`
LEFT JOIN references_tblpaygradeandstepincrement currentstep ON currentstep.`grade` = grade.`grade` AND currentstep.`step` = 1
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc ON currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid FROM `hrmis_tblpayrollsalarytranche` WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN `hrmis_tblpayrollsalarytranche` currenttranche ON currenttranche.objid = currentinc.salarytrancheid
LEFT JOIN references_tblpaygradeandstepincrement prevstep ON prevstep.`grade` = grade.`grade` AND prevstep.`step` = 1
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem previnc ON previnc.paygradeandstepincrementid = prevstep.`objid` AND previnc.salarytrancheid = (SELECT objid FROM `hrmis_tblpayrollsalarytranche` WHERE LAST_DAY(NOW()) - INTERVAL 1 YEAR BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN `hrmis_tblpayrollsalarytranche` prevtranche ON prevtranche.objid = previnc.salarytrancheid
WHERE
p.type = 'Casual'
AND
	o.orgunitid = '${funnel}'
ORDER BY
p.itemno

[getTrancheName]
SELECT objid, name, circular_acronymabbreviation AS circular, (SELECT YEAR(NOW()) - 1) as prevyear  FROM `hrmis_tblpayrollsalarytranche`
WHERE NOW() BETWEEN effectivefromdate AND effectivetodate