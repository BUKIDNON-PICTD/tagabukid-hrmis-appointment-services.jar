[getRootNodes]
SELECT a.* FROM references_tblorganizationunit a  WHERE 
a.parentorgunitid IS NULL ORDER BY a.name

[getChildNodes]
SELECT a.* FROM references_tblorganizationunit a WHERE 
a.parentorgunitid = $P{orgunitid}  ORDER BY a.name

[getList]
SELECT a.* FROM references_tblorganizationunit a WHERE 
a.parentorgunitid = $P{orgunitid} AND
(a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext})
ORDER BY a.name

[getSearch]
SELECT a.* FROM references_tblorganizationunit a WHERE 
a.code LIKE $P{searchtext} OR a.name LIKE $P{searchtext} 
ORDER BY a.name


[approve]
UPDATE references_tblorganizationunit SET state='APPROVED' WHERE 
orgunitid=$P{objid} 

[changeParent]
UPDATE references_tblorganizationunit SET parentorgunitid=$P{parentorgunitid},lft=$P{lft},rgt=$P{rgt} WHERE 
orgunitid=$P{objid} 

[findParent]
SELECT * FROM references_tblorganizationunit WHERE orgunitid = $P{parentorgunitid}

[changeNodeRight]
UPDATE references_tblorganizationunit SET rgt = rgt + 2 WHERE rgt > $P{myRight}

[changeNodeLeft]
UPDATE references_tblorganizationunit SET lft = lft + 2 WHERE lft > $P{myRight}

[changeParentRight]
UPDATE references_tblorganizationunit SET rgt = rgt + 2 WHERE rgt > $P{myLeft}

[changeParentLeft]
UPDATE references_tblorganizationunit SET lft = lft + 2 WHERE lft > $P{myLeft}

