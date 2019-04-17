[getEmployeeList]
SELECT
CONCAT(pds.`person_lastname`, ", ",
pds.`person_firstname`, " ",
pds.`person_middlename`, " ",
pds.`nameextension`, " ",
pds.`prenametitle`, " ",
pds.`postnametitle`, " ") AS employee,
 job.`name` AS position,
 plantilla.`itemno`,
 org.`name` AS org,
 org.`code` AS office,
 pds.`person_birthdate` AS birthdate,
 TIMESTAMPADD(YEAR,60,pds.`person_birthdate`) AS 60yearsold,
 TIMESTAMPADD(YEAR,61,pds.`person_birthdate`) AS 61yearsold,
 TIMESTAMPADD(YEAR,62,pds.`person_birthdate`) AS 62yearsold,
 TIMESTAMPADD(YEAR,63,pds.`person_birthdate`) AS 63yearsold,
 TIMESTAMPADD(YEAR,64,pds.`person_birthdate`) AS 64yearsold,
 TIMESTAMPADD(YEAR,65,pds.`person_birthdate`) AS 65yearsold
  FROM hrmis_appointmentpermanent p
 INNER JOIN hrmis_pds pds ON pds.`objid` = p.`pds_objid`
 INNER JOIN `hrmis_tblemploymentplantilla` plantilla ON plantilla.`objid` = p.`plantilla_objid`
 INNER JOIN references_tbljobposition job ON job.`objid` = plantilla.`jobposition_objid`
 INNER JOIN references_tblorganizationunit org ON org.`orgunitid` = p.`org_orgunitid`
 WHERE  YEAR(TIMESTAMPADD(YEAR,65,pds.`person_birthdate`)) = YEAR(NOW())
 ORDER BY org.`name`,pds.`person_lastname`,plantilla.`itemno`