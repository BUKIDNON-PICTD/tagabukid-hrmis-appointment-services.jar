[getList]
SELECT 
  `hrmis_appointmentcasual`.`objid`,
  `hrmis_appointmentcasual`.`state`,
  `hrmis_appointmentcasual`.`status`,
  `hrmis_appointmentcasual`.`appointmentgroupname`,
  `hrmis_appointmentcasual`.`effectivefrom`,
  `hrmis_appointmentcasual`.`effectiveuntil`,
  `hrmis_appointmentcasual`.`natureofappointment_objid`,
  `hrmis_appointmentcasual`.`dateissued`,
  `hrmis_appointmentcasual`.`org_orgunitid`,
  `hrmis_appointmentcasual`.`currentsalarystep_objid`,
  `hrmis_appointmentcasual`.`compensation`,
  `hrmis_appointmentcasual`.`remarks`,
  `hrmis_appointmentcasual`.`signatorygroup_objid`,
  `hrmis_appointmentcasual`.`recordlog_datecreated`,
  `hrmis_appointmentcasual`.`recordlog_createdbyuserid`,
  `hrmis_appointmentcasual`.`recordlog_createdbyuser`,
  `hrmis_appointmentcasual`.`recordlog_dateupdated`,
  `hrmis_appointmentcasual`.`recordlog_lastupdatedbyuserid`,
  `hrmis_appointmentcasual`.`recordlog_lastupdatedbyuser`,
  `signatorygroup`.`state` AS `signatorygroup_state`,
  `signatorygroup`.`code` AS `signatorygroup_code`,
  `signatorygroup`.`signatorygroupname` AS `signatorygroup_signatorygroupname`,
  `signatorygroup`.`remarks` AS `signatorygroup_remarks`,
  `signatorygroup`.`signatorytype` AS `signatorygroup_signatorytype`,
  `signatorygroup`.`recordlog_datecreated` AS `signatorygroup_recordlog_datecreated`,
  `signatorygroup`.`recordlog_createdbyuserid` AS `signatorygroup_recordlog_createdbyuserid`,
  `signatorygroup`.`recordlog_createdbyuser` AS `signatorygroup_recordlog_createdbyuser`,
  `signatorygroup`.`recordlog_dateupdated` AS `signatorygroup_recordlog_dateupdated`,
  `signatorygroup`.`recordlog_lastupdatedbyuserid` AS `signatorygroup_recordlog_lastupdatedbyuserid`,
  `signatorygroup`.`recordlog_lastupdatedbyuser` AS `signatorygroup_recordlog_lastupdatedbyuser`,
  `natureofappointment`.`name` AS `natureofappointment_name`,
  `natureofappointment`.`description` AS `natureofappointment_description`,
  `natureofappointment`.`code` AS `natureofappointment_code`,
  `natureofappointment`.`pastverb` AS `natureofappointment_pastverb`,
  `natureofappointment`.`hasappointmentissued` AS `natureofappointment_hasappointmentissued`,
  `natureofappointment`.`recordlog_datecreated` AS `natureofappointment_recordlog_datecreated`,
  `natureofappointment`.`recordlog_createdbyuserid` AS `natureofappointment_recordlog_createdbyuserid`,
  `natureofappointment`.`recordlog_createdbyuser` AS `natureofappointment_recordlog_createdbyuser`,
  `natureofappointment`.`recordlog_dateoflastupdate` AS `natureofappointment_recordlog_dateoflastupdate`,
  `natureofappointment`.`recordlog_lastupdatebyuserid` AS `natureofappointment_recordlog_lastupdatebyuserid`,
  `natureofappointment`.`recordlog_lastupdatebyuser` AS `natureofappointment_recordlog_lastupdatebyuser`,
  `natureofappointment`.`natureofappointment` AS `natureofappointment_natureofappointment`,
  `org`.`name` AS `org_name`,
  `org`.`description` AS `org_description`,
  `org`.`code` AS `org_code`,
  `org`.`parentorgunitid` AS `org_parentorgunitid`,
  `org`.`organizationunittypeid` AS `org_organizationunittypeid`,
  `org`.`position1` AS `org_position1`,
  `org`.`left` AS `org_left`,
  `org`.`right` AS `org_right`,
  `org`.`position` AS `org_position`,
  `org`.`level` AS `org_level`,
  `org`.`type` AS `org_type`,
  `org`.`addrcitymunid` AS `org_addrcitymunid`,
  `org`.`addrbarangayid` AS `org_addrbarangayid`,
  `org`.`addressdetails` AS `org_addressdetails`,
  `org`.`contacts_landline` AS `org_contacts_landline`,
  `org`.`contacts_mobile` AS `org_contacts_mobile`,
  `org`.`contacts_email` AS `org_contacts_email`,
  `org`.`contacts_fax` AS `org_contacts_fax`,
  `org`.`state` AS `org_state`,
  `org`.`recordlog_datecreated` AS `org_recordlog_datecreated`,
  `org`.`recordlog_createdbyuserid` AS `org_recordlog_createdbyuserid`,
  `org`.`recordlog_createdbyuser` AS `org_recordlog_createdbyuser`,
  `org`.`recordlog_dateoflastupdate` AS `org_recordlog_dateoflastupdate`,
  `org`.`recordlog_lastupdatebyuserid` AS `org_recordlog_lastupdatebyuserid`,
  `org`.`recordlog_lastupdatebyuser` AS `org_recordlog_lastupdatebyuser`,
  `currentsalarystep`.`name` AS `currentsalarystep_name`,
  `currentsalarystep`.`description` AS `currentsalarystep_description`,
  `currentsalarystep`.`acronymabbreviation` AS `currentsalarystep_acronymabbreviation`,
  `currentsalarystep`.`effectivefromdate` AS `currentsalarystep_effectivefromdate`,
  `currentsalarystep`.`effectivetodate` AS `currentsalarystep_effectivetodate`,
  `currentsalarystep`.`isapproved` AS `currentsalarystep_isapproved`,
  `currentsalarystep`.`recordlog_datecreated` AS `currentsalarystep_recordlog_datecreated`,
  `currentsalarystep`.`recordlog_createdbyuserid` AS `currentsalarystep_recordlog_createdbyuserid`,
  `currentsalarystep`.`recordlog_createdbyuser` AS `currentsalarystep_recordlog_createdbyuser`,
  `currentsalarystep`.`recordlog_dateoflastupdate` AS `currentsalarystep_recordlog_dateoflastupdate`,
  `currentsalarystep`.`recordlog_lastupdatebyuserid` AS `currentsalarystep_recordlog_lastupdatebyuserid`,
  `currentsalarystep`.`recordlog_lastupdatebyuser` AS `currentsalarystep_recordlog_lastupdatebyuser`,
  `currentsalarystep`.`circular_name` AS `currentsalarystep_circular_name`,
  `currentsalarystep`.`circular_description` AS `currentsalarystep_circular_description`,
  `currentsalarystep`.`circular_acronymabbreviation` AS `currentsalarystep_circular_acronymabbreviation` 
FROM
  `hrmis_appointmentcasual` 
  LEFT JOIN `references_tblappointmententrycode` `natureofappointment` 
    ON `hrmis_appointmentcasual`.`natureofappointment_objid` = `natureofappointment`.`objid` 
  LEFT JOIN `references_tblorganizationunit` `org` 
    ON `hrmis_appointmentcasual`.`org_orgunitid` = `org`.`orgunitid` 
  LEFT JOIN `hrmis_tblpayrollsalarytranche` `currentsalarystep` 
    ON `hrmis_appointmentcasual`.`currentsalarystep_objid` = `currentsalarystep`.`objid` 
  LEFT JOIN `hrmis_appointment_signatorygrouping` `signatorygroup` 
    ON `hrmis_appointmentcasual`.`signatorygroup_objid` = `signatorygroup`.`objid`
WHERE `hrmis_appointmentcasual`.`objid` IS NOT NULL
${filter}