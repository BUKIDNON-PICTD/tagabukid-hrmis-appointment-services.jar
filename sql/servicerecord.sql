[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblpayrollsalaryscheduleitem si
INNER JOIN hrmis_tblpayrollsalarytranche st ON st.objid = si.salarytrancheid
INNER JOIN references_tblpaygradeandstepincrement psi ON psi.objid = si.paygradeandstepincrementid
WHERE si.salarytrancheid = $P{trancheid}
AND si.paygradeandstepincrementid = $P{paygradestepincrementid}

[findServiceRecordReceiptData]
select max(po.receiptdate) AS receiptdate from simple_payment_order.payorder po
inner join tagabukid_hrmis.hrmis_pds pds on pds.objid = po.permobjid
where po.permobjid	= $P{objid} and po.office = 'HR'


[findDateDiff]
select DATEDIFF($P{currentdate},$P{receiptdate}) AS difference

[findDateDiffBogus]
select 1000 as difference

[getSeparationTypes]
select * from references_tblemploymentseparationtype

[findCurrDate]
SELECT CURDATE() as currdate

[getResultFromJobOrderAppointment]
select * from hrmis_appointmentjoborder jo
inner join hrmis_appointmentjoborderitems joi on joi.`parentid` = jo.`objid`
where jo.objid = $P{objid}

[findNatureofAppointmentName]
select name from references_tblappointmententrycode
where objid = $P{objid}

[findNatureofAppointmentCode]
select code from references_tblappointmententrycode
where objid = $P{objid}

[getResultFromCasualAppointment]
select * from hrmis_appointmentcasual ca
inner join hrmis_appointmentcasualitems cai on cai.`parentid` = ca.`objid`
where ca.objid = $P{objid}

[findJobPositionId]
select jobposition_objid as jobid from hrmis_tblemploymentplantilla
where objid = $P{objid}

[findPayGradeId]
select paygrade_objid as paygradeid from references_tbljobposition
where objid = $P{objid}

[findPrevAppointmentPermanent]
select * from hrmis_appointmentpermanent where pds_objid =  $P{objid}
and state = 'APPROVED'
and now() between effectivefrom and effectiveuntil
order by effectivefrom desc LIMIT 1 offset 1

[getServiceCard]
SELECT hp.person_name AS EMPLOYEENAME, hp.person_birthdate AS BIRTHDATE, hp.person_birthplace AS BIRTHPLACE, org.`name` AS AGENCY, jp.`name` AS POSITION, sr.wage AS SALARY, sr.datefrom AS EFFECTIVEDATE, sr.personnelaction_name AS ACTION
FROM hrmis_pds hp
INNER JOIN hrmis_servicerecords sr ON sr.pdsid = hp.objid
INNER JOIN references_tbljobposition jp ON jp.objid = sr.jobposition_objid
LEFT JOIN references_tblorganizationunit org ON org.orgunitid = sr.org_orgunitid
WHERE hp.objid = $P{objid}
ORDER BY sr.datefrom ASC

-- samples --
[getServiceCardPermanent]
SELECT hp.objid 
FROM hrmis_pds hp
INNER JOIN hrmis_appointmentpermanent app ON app.pds_objid = hp.objid AND NOW() BETWEEN app.effectivefrom AND app.effectiveuntil
WHERE app.org_orgunitid = $P{objid}

[getServiceCardCasual]
SELECT hp.objid 
FROM hrmis_pds hp
INNER JOIN hrmis_appointmentcasual apc ON NOW() BETWEEN apc.effectivefrom AND apc.effectiveuntil
INNER JOIN hrmis_appointmentcasualitems apci ON apci.parentid = apc.objid AND apci.pds_objid = hp.objid
WHERE apc.org_orgunitid = $P{objid}
AND apc.state = 'APPROVED'

[getServiceCardJobOrder]
SELECT hp.objid 
FROM hrmis_pds hp
INNER JOIN hrmis_appointmentjoborder apj ON NOW() BETWEEN apj.effectivefrom AND apj.effectiveuntil
INNER JOIN hrmis_appointmentjoborderitems apji ON apji.parentid = apj.objid AND apji.pdsid = hp.objid
WHERE apj.org_orgunitid = $P{objid}
AND apj.state = 'APPROVED'

[getServicetypeGovt]
SELECT * 
FROM hrmis_servicerecords
WHERE isgovservice = $P{isgovservice}
AND pdsid = $P{objid}

[getServiceRecordBoth]
select * from hrmis_pds p
inner join hrmis_servicerecords sr on sr.`pdsid` = p.`objid`
where p.objid = $P{objid}

[getServiceRecordNG]
select * from hrmis_pds p
inner join hrmis_servicerecords sr on sr.`pdsid` = p.`objid`
where p.objid = $P{objid}
and sr.`isgovservice` = 0

[getServiceRecordG]
SELECT * 
FROM hrmis_pds p
INNER JOIN hrmis_servicerecords sr ON sr.`pdsid` = p.`objid`
WHERE p.objid = $P{objid}
AND sr.`isgovservice` = 1