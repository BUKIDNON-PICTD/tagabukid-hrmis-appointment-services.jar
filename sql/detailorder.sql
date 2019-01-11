[getList]
SELECT
`hrmis_detailorder_list`.`objid`,
`hrmis_detailorder_list`.`personnel_name` as persona,
`hrmis_detailorder_list`.`status`,
`charges`.`code` AS charged,
`hrmis_detailorder_list`.`to_code` AS destined,
`hrmis_detailorder_list`.`effectivity`,
`hrmis_detailorder_list`.`years`,
`hrmis_detailorder_list`.`remarks`

FROM `hrmis_detailorder_list`

LEFT JOIN `hrmis_pds` `personnel`
	ON `personnel`.`objid` = `hrmis_detailorder_list`.`pdsid`

LEFT JOIN `etracs254_bukidnon`.`entityindividual` `ei`
	ON `ei`.`objid` = `hrmis_detailorder_list`.`personnel_objid`

LEFT JOIN `references_tblorganizationunit` `charges`
	ON `charges`.`orgunitid` = `hrmis_detailorder_list`.`charges_orgunitid`

LEFT JOIN `references_tblorganizationunit` `to`
	ON `to`.`orgunitid` = `hrmis_detailorder_list`.`to_orgunitid`
-- SELECT 
-- `hrmis_detailorder_list`.`objid`,
-- ,
-- `personnel`.`person_name` AS `person_name`,
-- `hrmis_detailorder_list`.`status`,
-- `charges`.`code` AS `charges_code`,
-- `to`.`code` AS `to_code`,
-- `hrmis_detailorder_list`.`effectivity`,
-- `hrmis_detailorder_list`.`years`

-- FROM `hrmis_detailorder_list`

-- INNER JOIN `hrmis_pds` `personnel`
-- 	ON `personnel`.`objid` = `hrmis_detailorder_list`.`pdsid`
-- INNER JOIN `references_tblorganizationunit` `charges`
-- 	ON `charges`.`orgunitid` = `hrmis_detailorder_list`.`charges_orgunitid`
-- INNER JOIN `references_tblorganizationunit` `to`
-- 	ON `to`.`orgunitid` = `hrmis_detailorder_list`.`to_orgunitid`
${filter}
ORDER BY persona