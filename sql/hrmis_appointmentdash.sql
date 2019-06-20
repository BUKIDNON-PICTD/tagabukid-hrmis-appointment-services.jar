[getTiles]
SELECT * FROM hrmis_dash_widget WHERE state = 'ACTIVE' order by sortorder;

[getPDSMale]
SELECT * FROM hrmis_pds where person_gender = 'M' ORDER BY person_name;

[getRPUTypeCount]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay,
SUM(IF(rpu.rputype='land',1,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',1,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',1,0)) AS MISC,
SUM(IF(rpu.rputype='mach',1,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',1,0)) AS PLANTTREE

FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;

[getTotalRPUHectare]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay, 
SUM(IF(rpu.rputype='land',rpu.`totalareaha`,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',rpu.`totalareaha`,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',rpu.`totalareaha`,0)) AS MISC,
SUM(IF(rpu.rputype='mach',rpu.`totalareaha`,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',rpu.`totalareaha`,0)) AS PLANTTREE

FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;


[getTotalRPUSQM]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay, 
SUM(IF(rpu.rputype='land',rpu.`totalareasqm`,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',rpu.`totalareasqm`,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',rpu.`totalareasqm`,0)) AS MISC,
SUM(IF(rpu.rputype='mach',rpu.`totalareasqm`,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',rpu.`totalareasqm`,0)) AS PLANTTREE

FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;

[getTotalRPUBVM]
SELECT 
lgu.name AS LGU, 
bar.name AS barangay, 
SUM(IF(rpu.rputype='land',rpu.`totalbmv`,0)) AS LAND, 
SUM(IF(rpu.rputype='bldg',rpu.`totalbmv`,0)) AS BLDG,
SUM(IF(rpu.rputype='misc',rpu.`totalbmv`,0)) AS MISC,
SUM(IF(rpu.rputype='mach',rpu.`totalbmv`,0)) AS MACH,
SUM(IF(rpu.rputype='planttree',rpu.`totalbmv`,0)) AS PLANTTREE

FROM `faas_list` fl

INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

WHERE fl.`state` = 'CURRENT'
GROUP BY rpu.`rputype`,bar.`name`, lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;

[getTotalRPUMV]
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