[getRootNodes]
SELECT a.* FROM references_tblfinaccount a  WHERE 
a.parentaccountid IS NULL ORDER BY a.name

[getChildNodes]
SELECT a.* FROM references_tblfinaccount a WHERE 
a.parentaccountid = $P{objid}  ORDER BY a.name

[getList]
SELECT a.* FROM references_tblfinaccount a WHERE 
a.parentaccountid = $P{objid} AND
(a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext})
ORDER BY a.name

[getSearch]
SELECT a.* FROM references_tblfinaccount a WHERE 
a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext} 
ORDER BY a.name


[approve]
UPDATE references_tblfinaccount SET state='APPROVED' WHERE 
objid=$P{objid} 

[changeParent]
UPDATE references_tblfinaccount SET parentaccountid=$P{parentaccountid},lft=$P{lft},rgt=$P{rgt} WHERE 
objid=$P{objid} 

[findParent]
SELECT * FROM references_tblfinaccount WHERE objid = $P{parentaccountid}

[changeNodeRight]
UPDATE references_tblfinaccount SET rgt = rgt + 2 WHERE rgt > $P{myRight}

[changeNodeLeft]
UPDATE references_tblfinaccount SET lft = lft + 2 WHERE lft > $P{myRight}

[changeParentRight]
UPDATE references_tblfinaccount SET rgt = rgt + 2 WHERE rgt > $P{myLeft}

[changeParentLeft]
UPDATE references_tblfinaccount SET lft = lft + 2 WHERE lft > $P{myLeft}

