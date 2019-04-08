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
WHERE p.type = 'Permanent' AND orgunitid = '${funnel}' ORDER BY p.itemno ASC;

[getCasualResult]
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
LEFT JOIN hrmis_appointmentcasual apc ON apc.org_orgunitid = p.`org_orgunitid` AND apc.effectiveuntil = (SELECT MAX(effectiveuntil) FROM hrmis_appointmentcasual WHERE org_orgunitid = p.`org_orgunitid` AND effectiveuntil > effectivefrom)
LEFT JOIN hrmis_appointmentcasualitems api ON api.parentid = apc.objid AND api.plantilla_objid = p.objid
INNER JOIN references_tblpaygradeandstepincrement grade ON grade.`objid` = job.`paygrade_objid`
LEFT JOIN references_tblpaygradeandstepincrement currentstep ON currentstep.`grade` = grade.`grade` AND currentstep.`step` = IF((TIMESTAMPDIFF(YEAR,apc.effectivefrom,NOW())/3) < 1 ,1,FLOOR((TIMESTAMPDIFF(YEAR,apc.effectivefrom,NOW())/3)+1))
LEFT JOIN hrmis_tblpayrollsalaryscheduleitem currentinc ON currentinc.paygradeandstepincrementid = currentstep.`objid` AND currentinc.salarytrancheid = (SELECT objid FROM hrmis_tblpayrollsalarytranche WHERE NOW() BETWEEN effectivefromdate AND effectivetodate)
LEFT JOIN hrmis_pds pds ON pds.`objid` = api.`pds_objid`
LEFT JOIN hrmis_servicerecords sr ON sr.personnelaction_name LIKE 'ORIGINAL' AND sr.employmentstatus_objid = (SELECT objid FROM `references_tblemptemploymentstatus` es WHERE es.`name` = 'Casual') AND sr.pdsid = api.`pds_objid`
LEFT JOIN hrmis_servicerecords sr1 ON sr1.pdsid = api.`pds_objid` AND sr1.datefrom = (SELECT MAX(datefrom) FROM hrmis_servicerecords WHERE pdsid = api.`pds_objid` AND dateto > datefrom)
LEFT JOIN references_tblemptemploymentstatus empstat ON empstat.name = apc.status AND empstat.name = 'Casual'
LEFT JOIN hrmis_pds_civilservice csc ON csc.pdsid = api.`pds_objid`
LEFT JOIN references_tbleligibility csctbl ON csctbl.objid = csc.eligibility_objid
WHERE p.type = 'Casual' AND orgunitid = '${funnel}' ORDER BY p.itemno ASC;
