[getGroupName]
select appointmentgroupname
from hrmis_appointmentjoborder
where appointmentgroupname like $P{searchtext}
group by appointmentgroupname