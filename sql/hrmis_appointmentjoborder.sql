<<<<<<< HEAD
[getGroupName]
select appointmentgroupname
from hrmis_appointmentjoborder
where appointmentgroupname like $P{searchtext}
group by appointmentgroupname
=======
[getGroupName]
select appointmentgroupname
from hrmis_appointmentjoborder
where appointmentgroupname like $P{searchtext}
group by appointmentgroupname

>>>>>>> ec054f5d6371edf58f11dcb3cb69bc11d5619c2b
