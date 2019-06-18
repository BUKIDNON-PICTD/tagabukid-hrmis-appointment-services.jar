[getTiles]
SELECT * FROM hrmis_dash_widget WHERE state = 'ACTIVE' order by sortorder;

[getDashData]
SELECT * FROM hrmis_pds where person_gender = 'M' ORDER BY person_name;