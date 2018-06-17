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
j.`name` AS jobposition,
f.`name` AS fund,
a.`name` AS accounttitle,
i.`name` AS incrementtype,
c.`name` AS positionserviceclassification,
cs.`name` AS positionservicesubclassification
FROM hrmis_tblemploymentplantilla xx
INNER JOIN references_tblorganizationunit o ON o.`orgunitid` =  xx.`organizationunitid`
INNER JOIN references_tbljobposition j ON j.`objid` = xx.`jobpositionid`
INNER JOIN references_tblemptincrementtype i ON i.`objid` = xx.`incrementtypeid`
INNER JOIN references_tblfinfund f ON f.`objid` = xx.`fundid`
INNER JOIN references_tblfinaccounttitle a ON a.`objid` = xx.`accounttitleid`
INNER JOIN references_tblemptpositionserviceclassification c ON c.`objid` = xx.`positionserviceclassificationid`
INNER JOIN references_tblemptpositionservicesubclassification cs ON cs.`objid` = xx.`positionservicesubclassificationid`
WHERE xx.`organizationunitid` = $P{orgunitid}

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
j.`name` AS jobposition,
f.`name` AS fund,
a.`name` AS accounttitle,
i.`name` AS incrementtype,
c.`name` AS positionserviceclassification,
cs.`name` AS positionservicesubclassification
FROM hrmis_tblemploymentplantilla xx
INNER JOIN references_tblorganizationunit o ON o.`orgunitid` =  xx.`organizationunitid`
INNER JOIN references_tbljobposition j ON j.`objid` = xx.`jobpositionid`
INNER JOIN references_tblemptincrementtype i ON i.`objid` = xx.`incrementtypeid`
INNER JOIN references_tblfinfund f ON f.`objid` = xx.`fundid`
INNER JOIN references_tblfinaccounttitle a ON a.`objid` = xx.`accounttitleid`
INNER JOIN references_tblemptpositionserviceclassification c ON c.`objid` = xx.`positionserviceclassificationid`
INNER JOIN references_tblemptpositionservicesubclassification cs ON cs.`objid` = xx.`positionservicesubclassificationid`
WHERE j.name LIKE $P{searchtext}

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

