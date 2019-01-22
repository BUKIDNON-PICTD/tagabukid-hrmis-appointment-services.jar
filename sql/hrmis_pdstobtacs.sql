[findbtacsid]
SELECT MAX (USERID) AS btacsid FROM USERINFO

[insertPersonalData]
SET IDENTITY_INSERT USERINFO ON
INSERT INTO USERINFO 
(USERID,
BADGENUMBER,
NAME,
GENDER,
BIRTHDAY,
ATT,
INLATE,
OUTEARLY,
OVERTIME,
SEP,
HOLIDAY,
LUNCHDURATION,
lname,
fname,
mname,
pdsid) VALUES 
(x,
x,
entity.person,
entity.person.gender,
entity.person.birthdate,
'1',
'1',
'1',
'1',
'1',
'1',
'1',
entity.person.lastname,
entity.person.firstname,
entity.person.middlename,
r.objid);
SET IDENTITY_INSERT USERINFO OFF
GO