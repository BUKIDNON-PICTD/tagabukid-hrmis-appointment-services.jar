[getBTACSid]
SELECT MAX (USERID) FROM USERINFO

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
('3945',
'3945',
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
entity.person.middlename);
SET IDENTITY_INSERT USERINFO OFF
GO
-- SET IDENTITY_INSERT USERINFO ON
-- INSERT INTO USERINFO 
-- (USERID,
-- BADGENUMBER,
-- NAME,
-- GENDER,
-- BIRTHDAY,
-- ATT,
-- INLATE,
-- OUTEARLY,
-- OVERTIME,
-- SEP,
-- HOLIDAY,
-- LUNCHDURATION,
-- lname,
-- fname,
-- mname,
-- pdsid) VALUES 
-- ('3945',
-- '3945',
-- '',
-- '',
-- '1989-08-04 00:00:00.000',
-- '1',
-- '1',
-- '1',
-- '1',
-- '1',
-- '1',
-- '1',
-- '',
-- '',
-- '',
-- '');
-- SET IDENTITY_INSERT USERINFO OFF
-- GO
