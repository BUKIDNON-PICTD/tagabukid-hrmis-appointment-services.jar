[getSigType]
select signatorytype
from hrmis_appointment_signatorygrouping
where signatorytype like $P{searchtext}
group by signatorytype