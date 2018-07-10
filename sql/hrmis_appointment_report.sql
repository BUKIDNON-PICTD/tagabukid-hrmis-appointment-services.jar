[getActiveAppointmentByGenderCasual]
SELECT ei.*,c.`effectivefrom`,c.`effectiveuntil` FROM hrmis_appointmentcasualitems ci 
INNER JOIN hrmis_appointmentcasual c ON c.`objid` = ci.`parentid`
INNER JOIN etracs254_bukidnon.`entityindividual` ei ON ei.`objid` = ci.`personnel_objid`
WHERE c.`state` IN ("DRAFT","APPROVED") AND ${filter}
AND NOW() BETWEEN c.`effectivefrom` AND c.`effectiveuntil`

[getActiveAppointmentByGenderJobOrder]
SELECT ei.*,c.`effectivefrom`,c.`effectiveuntil` FROM hrmis_appointmentjoborderitems ci 
INNER JOIN hrmis_appointmentjoborder c ON c.`objid` = ci.`parentid`
INNER JOIN etracs254_bukidnon.`entityindividual` ei ON ei.`objid` = ci.`entityid`
WHERE c.`state` = "DRAFT" AND ${filter}
AND NOW() BETWEEN c.`effectivefrom` AND c.`effectiveuntil`