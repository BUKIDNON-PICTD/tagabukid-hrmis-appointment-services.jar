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
 


[getRPUTotalAV]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay,
SUM(IF(rpu.rputype='land',rpu.`totalav`,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',rpu.`totalav`,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',rpu.`totalav`,0)) AS MISC,
SUM(IF(rpu.rputype='mach',rpu.`totalav`,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',rpu.`totalav`,0)) AS PLANTTREE
 
FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;

[getRPUTotalMV]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay,
SUM(IF(rpu.rputype='land',rpu.`totalmv`,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',rpu.`totalmv`,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',rpu.`totalmv`,0)) AS MISC,
SUM(IF(rpu.rputype='mach',rpu.`totalmv`,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',rpu.`totalmv`,0)) AS PLANTTREE

FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;