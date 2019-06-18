[getList]
select name
from references_tblloccountry
where name like $P{searchtext}

[getCountry]
select name
from references_tblloccountry
where name like $P{searchtext}
order by name asc

[getQuestions]
SELECT * FROM references_tblpdsq ORDER BY position;

[findMaxUserID]
SELECT MAX(USERID) AS USERID FROM USERINFO

[insertUser]
INSERT INTO USERINFO (BADGENUMBER,NAME,GENDER,BIRTHDAY,DEFAULTDEPTID,ATT,INLATE,OUTEARLY,OVERTIME,SEP,HOLIDAY,MINZU,LUNCHDURATION,privilege,InheritDeptSch,InheritDeptSchClass,AutoSchPlan,MinAutoSchInterval,RegisterOT,InheritDeptRule,EMPRIVILEGE,lname,fname,mname,pdsid) VALUES ($P{BADGENUMBER},$P{NAME},$P{GENDER},$P{BIRTHDAY},$P{DEFAULTDEPTID},$P{ATT},$P{INLATE},$P{OUTEARLY},$P{OVERTIME},$P{SEP},$P{HOLIDAY},$P{MINZU},$P{LUNCHDURATION},$P{privilege},$P{InheritDeptSch},$P{InheritDeptSchClass},$P{AutoSchPlan},$P{MinAutoSchInterval},$P{RegisterOT},$P{InheritDeptRule},$P{EMPRIVILEGE},$P{lname},$P{fname},$P{mname},$P{pdsid});
