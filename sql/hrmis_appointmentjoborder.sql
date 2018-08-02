[getGroupName]
select appointmentgroupname
from hrmis_appointmentjoborder
where appointmentgroupname like $P{searchtext}
group by appointmentgroupname

[findDailyWageByTranch]
SELECT si.* FROM references_tbljobposition j
INNER JOIN hrmis_tblpayrollsalaryscheduleitem si ON si.`paygradeandstepincrementid` = j.`paygrade_objid`
WHERE si.salarytrancheid = $P{trancheid}
AND j.objid = $P{jobpositionid}
