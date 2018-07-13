[getRootNodes]
SELECT a.* FROM references_tblfinaccounttitle a  WHERE 
a.parentaccounttitleid IS NULL ORDER BY a.name

[getChildNodes]
SELECT a.* FROM references_tblfinaccounttitle a WHERE 
a.parentaccounttitleid = $P{objid}  ORDER BY a.name

[getList]
SELECT a.* FROM references_tblfinaccounttitle a WHERE 
a.parentaccounttitleid = $P{objid} AND
(a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext})
ORDER BY a.name

[getSearch]
SELECT a.* FROM references_tblfinaccounttitle a WHERE 
a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext} 
ORDER BY a.name


[approve]
UPDATE references_tblfinaccounttitle SET state='APPROVED' WHERE 
objid=$P{objid} 

[changeParent]
UPDATE references_tblfinaccounttitle SET parentaccounttitleid=$P{parentaccounttitleid},lft=$P{lft},rgt=$P{rgt} WHERE 
objid=$P{objid} 

[findParent]
SELECT * FROM references_tblfinaccounttitle WHERE objid = $P{parentaccounttitleid}

[changeNodeRight]
UPDATE references_tblfinaccounttitle SET rgt = rgt + 2 WHERE rgt > $P{myRight}

[changeNodeLeft]references_tblfinaccounttitle SET lft = lft + 2 WHERE lft > $P{myRight}

[changeParentRight]
UPDATE references_tblfinaccounttitle SET rgt = rgt + 2 WHERE rgt > $P{myLeft}

[changeParentLeft]
UPDATE references_tblfinaccounttitle SET lft = lft + 2 WHERE lft > $P{myLeft}

