[getEmployeeList]
SELECT ent.name, ent.address_text, ent.* FROM etracs254_bukidnon.entity ent
INNER JOIN tagabukid_hrmis.hrmis_entity hr ON hr.objid = ent.objid
WHERE ent.objid IN (SELECT objid FROM tagabukid_hrmis.hrmis_entity)
AND ent.name LIKE $P{searchtext}