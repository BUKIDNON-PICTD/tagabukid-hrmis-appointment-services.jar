[getTiles]
SELECT * FROM hrmis_dash_widget WHERE state = 'ACTIVE';

-- [getDashrputypecount]
-- SELECT mu.name, faas.barangay,
-- SUM(IF(rpu.rputype = 'land',1,0)) AS LAND,
-- SUM(IF(rpu.rputype = 'bldg',1,0)) AS BLDG,
-- SUM(IF(rpu.rputype = 'misc',1,0)) AS MISC,
-- SUM(IF(rpu.rputype = 'planttree',1,0)) AS PLANTTREE,
-- SUM(IF(rpu.rputype = 'mach',1,0)) AS MACH
-- FROM faas_list faas
-- INNER JOIN municipality mu ON mu.objid = faas.lguid
-- INNER JOIN rpu rpu ON rpu.objid = faas.rpuid
-- WHERE faas.state = "CURRENT"  
-- GROUP BY mu.name, faas.barangay
-- ORDER BY mu.name;