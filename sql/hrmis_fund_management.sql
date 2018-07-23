[getRootNodes]
SELECT a.* FROM references_tblfinfund a  WHERE 
a.parentfundid IS NULL ORDER BY a.name

[getChildNodes]
SELECT a.* FROM references_tblfinfund a WHERE 
a.parentfundid = $P{objid}  ORDER BY a.name

[getList]
SELECT a.* FROM references_tblfinfund a WHERE 
a.parentfundid = $P{objid} AND
(a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext})
ORDER BY a.name

[getSearch]
SELECT a.* FROM references_tblfinfund a WHERE 
a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext} 
ORDER BY a.name


[approve]
UPDATE references_tblfinfund SET state='APPROVED' WHERE 
objid=$P{objid} 

[changeParent]
UPDATE references_tblfinfund SET parentfundid=$P{parentfundid},lft=$P{lft},rgt=$P{rgt} WHERE 
objid=$P{objid} 

[findParent]
SELECT * FROM references_tblfinfund WHERE objid = $P{parentfundid}

[changeNodeRight]
UPDATE references_tblfinfund SET rgt = rgt + 2 WHERE rgt > $P{myRight}

[changeNodeLeft]
UPDATE references_tblfinfund SET lft = lft + 2 WHERE lft > $P{myRight}

[changeParentRight]
UPDATE references_tblfinfund SET rgt = rgt + 2 WHERE rgt > $P{myLeft}

[changeParentLeft]
UPDATE references_tblfinfund SET lft = lft + 2 WHERE lft > $P{myLeft}

