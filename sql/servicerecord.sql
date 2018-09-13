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