[getRootNodes]
SELECT a.* FROM references_tblorganizationunit a  WHERE 
a.parentorgunitid IS NULL ORDER BY a.name

[getChildNodes]
SELECT a.* FROM references_tblorganizationunit a WHERE 
a.parentorgunitid = $P{orgunitid}  ORDER BY a.name

[getList]
SELECT 
xx.`objid`,
xx.`itemno`,
xx.`isfunded`,
j.`name` AS jobposition_name,
pds.person_name AS person_name,
f.`name` AS fund_name,
a.`name` AS accounttitle_name,
i.`name` AS incrementtype_name,
c.`name` AS positionserviceclassification_name,
cs.`name` AS positionservicesubclassification_name,
xx.type
FROM hrmis_tblemploymentplantilla xx

-- Added Personnel
LEFT JOIN hrmis_appointmentpermanent ap ON ap.plantilla_objid = xx.objid
LEFT JOIN hrmis_pds pds ON pds.objid = ap.pds_objid

INNER JOIN references_tblorganizationunit o ON o.`orgunitid` =  xx.`org_orgunitid`
INNER JOIN references_tbljobposition j ON j.`objid` = xx.`jobposition_objid`
LEFT JOIN references_tblemptincrementtype i ON i.`objid` = xx.`incrementtype_objid`
INNER JOIN references_tblfinfund f ON f.`objid` = xx.`fund_objid`
INNER JOIN references_tblfinaccounttitle a ON a.`objid` = xx.`accounttitle_objid`
LEFT JOIN references_tblemptpositionserviceclassification c ON c.`objid` = xx.`positionserviceclassification_objid`
LEFT JOIN references_tblemptpositionservicesubclassification cs ON cs.`objid` = xx.`positionservicesubclassification_objid`
WHERE xx.`org_orgunitid` = $P{orgunitid} AND xx.type LIKE $P{type} AND j.name LIKE $P{searchtext}
ORDER BY xx.itemno

[getListDetails]
SELECT DISTINCT a.* FROM 
( 
  SELECT * FROM references_tblorganizationunit WHERE 
  code LIKE $P{searchtext}
  UNION 
  SELECT * FROM references_tblorganizationunit WHERE 
  name LIKE $P{searchtext}
) a
WHERE 
 a.parentorgunitid IS NULL AND  a.type='folder'
ORDER BY a.code

[getSearch]
SELECT 
xx.`objid`,
xx.`itemno`,
xx.`isfunded`,
j.`name` AS jobposition_name,
f.`name` AS fund_name,
a.`name` AS accounttitle_name,
i.`name` AS incrementtype_name,
c.`name` AS positionserviceclassification_name,
cs.`name` AS positionservicesubclassification_name,
xx.type
FROM hrmis_tblemploymentplantilla xx
INNER JOIN references_tblorganizationunit o ON o.`orgunitid` =  xx.`org_orgunitid`
INNER JOIN references_tbljobposition j ON j.`objid` = xx.`jobposition_objid`
LEFT JOIN references_tblemptincrementtype i ON i.`objid` = xx.`incrementtype_objid`
INNER JOIN references_tblfinfund f ON f.`objid` = xx.`fund_objid`
INNER JOIN references_tblfinaccounttitle a ON a.`objid` = xx.`accounttitle_objid`
LEFT JOIN references_tblemptpositionserviceclassification c ON c.`objid` = xx.`positionserviceclassification_objid`
LEFT JOIN references_tblemptpositionservicesubclassification cs ON cs.`objid` = xx.`positionservicesubclassification_objid`
WHERE j.name LIKE $P{searchtext} AND xx.type LIKE $P{type}



[findInfo]
SELECT a.*, p.code AS parent_code, p.title AS parent_title 
FROM references_tblorganizationunit a
LEFT JOIN references_tblorganizationunit p ON a.parentid = p.objid
WHERE 
a.orgunitid IN ('ROOT',$P{orgid}) AND a.objid=$P{objid}

[getLookup]
SELECT a.* FROM 
(
	SELECT objid,code,title,type FROM subay_cabinet t WHERE 
	t.orgid IN ('ROOT',$P{orgid}) AND t.code LIKE $P{searchtext} AND type=$P{type} AND parentid LIKE $P{parentid}
	UNION
	SELECT objid,code,title,type FROM subay_cabinet t WHERE 
	t.orgid IN ('ROOT',$P{orgid}) AND t.title LIKE $P{searchtext} AND type=$P{type} AND parentid LIKE $P{parentid} 
) a
ORDER BY a.code

[approve]
UPDATE subay_cabinet SET state='APPROVED' WHERE 
objid=$P{objid} 

[changeParent]
UPDATE subay_cabinet SET parentid=$P{parentid},lft=$P{lft},rgt=$P{rgt} WHERE 
objid=$P{objid} 


[getRevenueItemListByCode]
SELECT r.objid,r.code,r.title,
a.objid AS account_objid, a.title AS account_title, a.code AS account_code
FROM itemaccount r 
LEFT JOIN sre_revenue_mapping m ON m.revenueitemid=r.objid
LEFT JOIN subay_cabinet a ON a.objid=m.acctid
WHERE 
a.orgid IN ('ROOT',$P{orgid}) AND r.code LIKE $P{searchtext} 
ORDER BY r.code

[getAccountcabinets]
SELECT 
  objid,
  CASE WHEN parentid IS NULL THEN 'ROOT' ELSE parentid END AS parentid,
  code,
  title,
  type,
  0 AS amount 
FROM subay_cabinet 
ORDER BY code


[findParent]
SELECT * FROM subay_cabinet WHERE objid = $P{parentid}

[changeNodeRight]
UPDATE subay_cabinet SET rgt = rgt + 2 WHERE rgt > $P{myRight}

[changeNodeLeft]
UPDATE subay_cabinet SET lft = lft + 2 WHERE lft > $P{myRight}

[changeParentRight]
UPDATE subay_cabinet SET rgt = rgt + 2 WHERE rgt > $P{myLeft}

[changeParentLeft]
UPDATE subay_cabinet SET lft = lft + 2 WHERE lft > $P{myLeft}

