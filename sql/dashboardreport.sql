[getRpuData]
SELECT
mu.name, 
faas.barangay,
SUM(IF(rpu.rputype = 'land',1,0)) AS LAND,
SUM(IF(rpu.rputype = 'bldg',1,0)) AS BLDG,
SUM(IF(rpu.rputype = 'misc',1,0)) AS MISC,
SUM(IF(rpu.rputype = 'planttree',1,0)) AS PLANTTREE,
SUM(IF(rpu.rputype = 'mach',1,0)) AS MACH,
SUM(IF(rpu.rputype = 'land',rpu.totalareaha,0)) AS LANDTOTALAREAHA,
SUM(IF(rpu.rputype = 'bldg',rpu.totalareaha,0)) AS BLDGTOTALAREAHA,
SUM(IF(rpu.rputype = 'misc',rpu.totalareaha,0)) AS MISCTOTALAREAHA,
SUM(IF(rpu.rputype = 'planttree',rpu.totalareaha,0)) AS PLANTTREETOTALAREAHA,
SUM(IF(rpu.rputype = 'mach',rpu.totalareaha,0)) AS MACHTOTALAREAHA,
SUM(IF(rpu.rputype = 'land',rpu.totalareasqm,0)) AS LANDTOTALAREASQM,
SUM(IF(rpu.rputype = 'bldg',rpu.totalareasqm,0)) AS BLDGTOTALAREASQM,
SUM(IF(rpu.rputype = 'misc',rpu.totalareasqm,0)) AS MISCTOTALAREASQM,
SUM(IF(rpu.rputype = 'planttree',rpu.totalareasqm,0)) AS PLANTTREETOTALAREASQM,
SUM(IF(rpu.rputype = 'mach',rpu.totalareasqm,0)) AS MACHTOTALAREASQM,
SUM(IF(rpu.rputype = 'land',rpu.totalbmv,0)) AS LANDTOTALBMV,
SUM(IF(rpu.rputype = 'bldg',rpu.totalbmv,0)) AS BLDGTOTALBMV,
SUM(IF(rpu.rputype = 'misc',rpu.totalbmv,0)) AS MISCTOTALBMV,
SUM(IF(rpu.rputype = 'planttree',rpu.totalbmv,0)) AS PLANTTREETOTALBMV,
SUM(IF(rpu.rputype = 'mach',rpu.totalbmv,0)) AS MACHTOTALBMV,
SUM(IF(rpu.rputype = 'land',rpu.totalmv,0)) AS LANDTOTALMV,
SUM(IF(rpu.rputype = 'bldg',rpu.totalmv,0)) AS BLDGTOTALMV,
SUM(IF(rpu.rputype = 'misc',rpu.totalmv,0)) AS MISCTOTALMV,
SUM(IF(rpu.rputype = 'planttree',rpu.totalmv,0)) AS PLANTTREETOTALMV,
SUM(IF(rpu.rputype = 'mach',rpu.totalmv,0)) AS MACHTOTALMV,
SUM(IF(rpu.rputype = 'land',rpu.totalav,0)) AS LANDTOTALAV,
SUM(IF(rpu.rputype = 'bldg',rpu.totalav,0)) AS BLDGTOTALAV,
SUM(IF(rpu.rputype = 'misc',rpu.totalav,0)) AS MISCTOTALAV,
SUM(IF(rpu.rputype = 'planttree',rpu.totalav,0)) AS PLANTTREETOTALAV,
SUM(IF(rpu.rputype = 'mach',rpu.totalav,0)) AS MACHTOTALAV
FROM faas_list faas
INNER JOIN municipality mu ON mu.objid = faas.lguid
INNER JOIN rpu rpu ON rpu.objid = faas.rpuid
WHERE faas.state = "CURRENT"  
GROUP BY mu.name, faas.barangay
ORDER BY mu.name;

[getDashrputypecount]
SELECT
mu.name, 
faas.barangay,
SUM(IF(rpu.rputype = 'land',1,0)) AS LAND,
SUM(IF(rpu.rputype = 'bldg',1,0)) AS BLDG,
SUM(IF(rpu.rputype = 'misc',1,0)) AS MISC,
SUM(IF(rpu.rputype = 'planttree',1,0)) AS PLANTTREE,
SUM(IF(rpu.rputype = 'mach',1,0)) AS MACH
FROM faas_list faas
INNER JOIN municipality mu ON mu.objid = faas.lguid
INNER JOIN rpu rpu ON rpu.objid = faas.rpuid
WHERE faas.state = "CURRENT"  
GROUP BY mu.name, faas.barangay
ORDER BY mu.name;


[getRPUType]
SELECT 
lgu.name AS LGU,
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
GROUP BY lgu.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;
#######################
-- TOTAL Hectare RPU --
#######################
[getTotalHr]
SELECT
mu.name,
SUM(IF(rpu.rputype = 'land',rpu.totalareaha,0)) AS LAND,
SUM(IF(rpu.rputype = 'bldg',rpu.totalareaha,0)) AS BLDG,
SUM(IF(rpu.rputype = 'misc',rpu.totalareaha,0)) AS MISC,
SUM(IF(rpu.rputype = 'planttree',rpu.totalareaha,0)) AS PLANTTREE,
SUM(IF(rpu.rputype = 'mach',rpu.totalareaha,0)) AS MACH
FROM faas_list faas
INNER JOIN municipality mu ON mu.objid = faas.lguid
INNER JOIN rpu rpu ON rpu.objid = faas.rpuid
WHERE faas.state = "CURRENT"  
GROUP BY mu.name
ORDER BY mu.name;
-- SELECT 
-- lgu.name AS LGU, 
-- -- bar.name AS BARANGAY, 
-- SUM(IF(rpu.rputype='land',rpu.`totalareaha`,0)) AS LAND, 
-- SUM(IF(rpu.rputype='bldg',rpu.`totalareaha`,0)) AS BLDG,
-- SUM(IF(rpu.rputype='misc',rpu.`totalareaha`,0)) AS MISC,
-- SUM(IF(rpu.rputype='mach',rpu.`totalareaha`,0)) AS MACH,
-- SUM(IF(rpu.rputype='planttree',rpu.`totalareaha`,0)) AS PLANTTREE

-- FROM `faas_list` fl

-- INNER JOIN municipality lgu ON lgu.objid = fl.`lguid`
-- INNER JOIN barangay bar ON bar.`objid` = fl.`barangayid`
-- INNER JOIN rpu ON rpu.`objid` = fl.`rpuid`

-- WHERE fl.`state` = 'CURRENT'
-- GROUP BY lgu.`name`
-- ORDER BY lgu.`name`
-- ;



###################
-- TOTAL SQM RPU --
###################
[getTotalSQM]
SELECT 
lgu.name AS LGU, 
bar.name AS BARANGAY, 
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
GROUP BY lgu.`name`, bar.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;


###################
-- TOTAL BMV RPU --
###################
[getTotalBMV]
SELECT 
lgu.name AS LGU, 
bar.name AS BARANGAY, 
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
GROUP BY lgu.`name`, bar.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;


##################
-- TOTAL MV RPU --
##################
[getTotalMV]
SELECT 
lgu.name AS LGU, 
bar.name AS BARANGAY,
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
GROUP BY lgu.`name`, bar.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;


##################
-- TOTAL AV RPU --
##################
[getTotalAV]
SELECT 
lgu.name AS LGU, 
bar.name AS BARANGAY,
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
GROUP BY lgu.`name`, bar.`name`
ORDER BY lgu.`name`, bar.`name`, rpu.`rputype`
;
