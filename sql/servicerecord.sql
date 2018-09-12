[findDailyWageByTranch]
SELECT si.* FROM hrmis_tblpayrollsalaryscheduleitem si
INNER JOIN hrmis_tblpayrollsalarytranche st ON st.objid = si.salarytrancheid
INNER JOIN references_tblpaygradeandstepincrement psi ON psi.objid = si.paygradeandstepincrementid
WHERE si.salarytrancheid = $P{trancheid}
AND si.paygradeandstepincrementid = $P{paygradestepincrementid}

[findServiceRecordReceiptData]
select po.* from simple_payment_order3.payorder po
inner join tagabukid_hrmis.hrmis_pds pds on pds.objid = po.permobjid
where po.permobjid	= $P{objid}

[findDateDiff]
select DATEDIFF($P{currentdate},$P{receiptdate}) AS difference

[findDateDiffBogus]
select 1000 as difference