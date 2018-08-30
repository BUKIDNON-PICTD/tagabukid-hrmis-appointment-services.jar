[getHitList]
-- by lastname vs lastname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
SELECT DISTINCT zzz.lastname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

) zzz
)

UNION

-- by lastname vs middlename
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
SELECT DISTINCT zzz.middlename
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- by lastname vs maidenname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
SELECT DISTINCT zzz.maidenname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --

-- middlename here

-- by MIDDLENAME vs lastname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
SELECT DISTINCT zzz.lastname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- by middlename vs middlename
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
SELECT DISTINCT zzz.middlename
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- by middlename vs maidenname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
SELECT DISTINCT zzz.maidenname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)


UNION

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --

-- maidenname here

-- by maidenname vs lastname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
SELECT DISTINCT zzz.lastname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- by maidenname vs middlename
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
SELECT DISTINCT zzz.middlename
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)

UNION

-- by maidenname vs maidenname
SELECT xx.person_name as fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
SELECT DISTINCT zzz.maidenname
FROM
(
SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
WHERE objid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
WHERE f.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
WHERE f.pdsid = $P{hit}

-- ++++++++++++ --
-- GRANDPARENTS --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
WHERE q.pdsid = $P{hit}

-- Spouse side --

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
WHERE q.pdsid = $P{hit}

UNION

SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
WHERE q.pdsid = $P{hit}
) zzz
)
