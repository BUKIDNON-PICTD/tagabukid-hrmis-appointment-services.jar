[getResult]
SELECT  
org.code,
p.itemno,
job.name,
grade.grade,
currentstep.step,
currentinc.amount * 12 AS currentannual,
pds.person_lastname, 
pds.person_firstname, 
pds.person_middlename,
pds.person_gender, 
pds.person_birthdate, 
pds.tin,
sr.datefrom,
sr1.datefrom AS lastprodate,
empstat.code AS empstatcode,
csctbl.name AS cscname
FROM references_tblorganizationunit org 
INNER JOIN  hrmis_tblemploymentplantilla p ON p.`org_orgunitid` = org.orgunitid
INNER JOIN references_tbljobposition job ON job.objid = p.jobposition_objid
LEFT JOIN hrmis_appointmentpermanent ap ON ap.plantilla_objid = p.objid
INNER JOIN references_tblpaygradeandstepincrement grade ON grade.`objid` = job.`paygrade_objid`
LEFT JOIN references_tblpaygradeandstepincrement currentstep ON currentstep.`grade` = grade.`grade` AND currentstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1))
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc ON currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid FROM hrmis_tblpayrollsalarytranche WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN hrmis_pds pds ON pds.`objid` = ap.`pds_objid`
LEFT JOIN hrmis_servicerecords sr ON sr.personnelaction_name LIKE 'ORIGINAL' AND sr.employmentstatus_objid = (SELECT objid FROM `references_tblemptemploymentstatus` es WHERE es.`name` = 'PERMANENT') AND sr.pdsid = ap.`pds_objid`
LEFT JOIN hrmis_servicerecords sr1 ON sr1.pdsid = ap.`pds_objid` AND sr1.datefrom = (SELECT MAX(datefrom) FROM hrmis_servicerecords WHERE pdsid = ap.`pds_objid` AND dateto > datefrom)
LEFT JOIN references_tblemptemploymentstatus empstat ON empstat.objid = ap.status_objid AND empstat.name = 'PERMANENT'
LEFT JOIN hrmis_pds_civilservice csc ON csc.pdsid = ap.`pds_objid`
LEFT JOIN references_tbleligibility csctbl ON csctbl.objid = csc.eligibility_objid
WHERE p.type = 'Permanent' AND orgunitid = '${funnel}';
-- SELECT p.objid, org.code, p.itemno, jp.name, pds.person_name, pds.person_lastname, pds.person_firstname, pds.person_middlename,
-- pds.person_gender, pds.person_birthdate, pds.tin, grade.`grade`, csctbl.name AS cscname, empstat.code AS empstatcode, sr.datefrom,
-- IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1)) AS currentstep,
-- currenttranche.name,
-- currentinc.amount * 12 AS currentannual,
-- IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1)) AS prevstep,
-- prevtranche.name,
-- previnc.amount * 12 AS prevannual

-- FROM hrmis_tblemploymentplantilla p
-- LEFT JOIN hrmis_appointmentpermanent ap ON ap.`plantilla_objid` = p.`objid` 
-- LEFT JOIN references_tblorganizationunit org ON org.`orgunitid` = '${funnel}'
-- LEFT JOIN hrmis_pds pds ON pds.`objid` = ap.`pds_objid`
-- LEFT JOIN references_tbljobposition jp ON jp.`objid` = p.`jobposition_objid`
-- LEFT JOIN references_tblpaygradeandstepincrement grade ON grade.`objid` = jp.`paygrade_objid`
-- LEFT JOIN references_tblpaygradeandstepincrement currentstep ON currentstep.`grade` = grade.`grade` AND currentstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1))
-- LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc ON currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid FROM hrmis_tblpayrollsalarytranche WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
-- LEFT JOIN hrmis_tblpayrollsalarytranche currenttranche ON currenttranche.objid = currentinc.salarytrancheid

-- LEFT JOIN references_tblpaygradeandstepincrement prevstep ON prevstep.`grade` = grade.`grade` AND prevstep.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,LAST_DAY(NOW()) - INTERVAL 1 YEAR)/3)+1))
-- LEFT JOIN hrmis_tblpayrollsalaryscheduleitem previnc ON previnc.paygradeandstepincrementid = prevstep.`objid` AND previnc.salarytrancheid = (SELECT objid FROM hrmis_tblpayrollsalarytranche WHERE LAST_DAY(NOW()) - INTERVAL 1 YEAR BETWEEN effectivefromdate AND effectivetodate)
-- LEFT JOIN hrmis_tblpayrollsalarytranche prevtranche ON prevtranche.objid = previnc.salarytrancheid

-- LEFT JOIN hrmis_pds_civilservice csc ON csc.pdsid = pds.objid
-- LEFT JOIN references_tbleligibility csctbl ON csctbl.objid = csc.eligibility_objid
-- LEFT JOIN references_tblemptemploymentstatus empstat ON empstat.objid = ap.status_objid AND empstat.name = 'PERMANENT'

-- LEFT JOIN hrmis_servicerecords sr ON sr.personnelaction_name LIKE 'ORIGINAL' AND sr.employmentstatus_objid = (SELECT objid FROM `references_tblemptemploymentstatus` es WHERE es.`name` = 'PERMANENT') AND sr.pdsid = pds.`objid`

-- WHERE p.type = 'Permanent';


-- SELECT 
-- org.code,
-- p.itemno,
-- job.name,
-- paygrade.grade,
-- paygrade.step,
-- pds.person_lastname, 
-- pds.person_firstname, 
-- pds.person_middlename,
-- pds.person_gender, 
-- pds.person_birthdate, 
-- pds.tin,
-- empstat.code AS empstatcode,
-- csctbl.name AS cscname
-- FROM hrmis_tblemploymentplantilla p
-- INNER JOIN references_tblorganizationunit org ON org.`orgunitid` = '${funnel}'
-- INNER JOIN references_tbljobposition job ON job.objid = p.jobposition_objid
-- INNER JOIN hrmis_appointmentpermanent ap ON ap.plantilla_objid = p.objid
-- INNER JOIN references_tblpaygradeandstepincrement paygrade ON paygrade.`objid` = job.`paygrade_objid` AND paygrade.`step` = IF((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,ap.effectivefrom,NOW())/3)+1))
-- LEFT JOIN hrmis_pds pds ON pds.`objid` = ap.`pds_objid`
-- LEFT JOIN hrmis_servicerecords sr ON sr.personnelaction_name LIKE 'ORIGINAL' AND sr.employmentstatus_objid = (SELECT objid FROM `references_tblemptemploymentstatus` es WHERE es.`name` = 'PERMANENT') AND sr.pdsid = ap.`pds_objid`
-- LEFT JOIN hrmis_servicerecords sr1 ON sr1.pdsid = ap.`pds_objid` AND sr1.datefrom = (SELECT MAX(datefrom) FROM hrmis_servicerecords WHERE pdsid = ap.`pds_objid` AND dateto > datefrom)
-- LEFT JOIN hrmis_pds_civilservice csc ON csc.pdsid = ap.`pds_objid`
-- LEFT JOIN references_tbleligibility csctbl ON csctbl.objid = csc.eligibility_objid
-- LEFT JOIN references_tblemptemploymentstatus empstat ON empstat.objid = ap.status_objid AND empstat.name = 'PERMANENT'
-- WHERE p.type = 'Permanent';
