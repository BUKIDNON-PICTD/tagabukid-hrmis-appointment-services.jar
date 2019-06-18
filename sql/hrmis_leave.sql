[findEmpSched]
SET DATEFIRST 1
SELECT * FROM bdo.GetEmpSched3(CAST($P{leavedate} AS DATE),CAST($P{leavedate} AS DATE),$P{USRID})

[findUserInfo]
SELECT u.*,d.DEPTID,d.DEPTNAME FROM USERINFO u
INNER JOIN DEPARTMENTS d ON d.DEPTID = u.DEFAULTDEPTID
WHERE u.hrmisid = $P{emp_r_cod}