[getHitList]
-- by lastname vs lastname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
	SELECT DISTINCT zzz.lastname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by lastname vs middlename
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
	SELECT DISTINCT zzz.middlename
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by lastname vs maidenname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_lastname` IN
(
	SELECT DISTINCT zzz.maidenname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --

-- middlename here

-- by MIDDLENAME vs lastname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
	SELECT DISTINCT zzz.lastname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by middlename vs middlename
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
	SELECT DISTINCT zzz.middlename
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by middlename vs maidenname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`person_middlename` IN
(
	SELECT DISTINCT zzz.maidenname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)


UNION

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --

-- maidenname here

-- by maidenname vs lastname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
	SELECT DISTINCT zzz.lastname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by maidenname vs middlename
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
	SELECT DISTINCT zzz.middlename
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)

UNION

-- by maidenname vs maidenname
SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
WHERE xx.`maidenname` IN
(
	SELECT DISTINCT zzz.maidenname
	FROM
	(


		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
		WHERE f.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
		WHERE f.pdsid = '${hit}'

		-- ++++++++++++ --
		-- GRANDPARENTS -- 

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		-- Spouse side --

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
		WHERE q.pdsid = '${hit}'

		UNION

		SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
		WHERE q.pdsid = '${hit}'
	) zzz
)




UNION





-- MAIN QUERY 1.1
-- by lastname of father

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT f.pdsid FROM hrmis_pds_familybackground_fathername f
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 1.2
-- by middlename of father

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT f.pdsid FROM hrmis_pds_familybackground_fathername f
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 2.1
-- by middlename of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT m.pdsid FROM hrmis_pds_familybackground_mothername m
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = m.mother_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 2.2
-- by lastname of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(

	SELECT m.pdsid FROM hrmis_pds_familybackground_mothername m
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = m.mother_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 2.3
-- by maidenname of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT m.pdsid FROM hrmis_pds_familybackground_mothername m
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = m.mother_objid 
	WHERE m.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 3.1
-- by lastname of spouse

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT s.pdsid FROM hrmis_pds_familybackground_spousename s
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = s.spouse_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 3.2
-- by middlename of spouse

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT s.pdsid FROM hrmis_pds_familybackground_spousename s
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = s.spouse_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 3.3
-- by maidenname of spouse

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT s.pdsid FROM hrmis_pds_familybackground_spousename s
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = s.spouse_objid 
	WHERE s.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 4.1
-- by lastname of fatherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT fgf.pdsid FROM hrmis_pds_family_fatherside_grandfather fgf
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = fgf.fathersidegrandfather_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 4.2
-- by middlename of fatherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT fgf.pdsid FROM hrmis_pds_family_fatherside_grandfather fgf
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = fgf.fathersidegrandfather_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 5.1
-- by lastname of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT fgm.pdsid FROM hrmis_pds_family_fatherside_grandmother fgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = fgm.fathersidegrandmother_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 5.2
-- by middlename of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT fgm.pdsid FROM hrmis_pds_family_fatherside_grandmother fgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = fgm.fathersidegrandmother_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 5.3
-- by maidenname of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT fgm.pdsid FROM hrmis_pds_family_fatherside_grandmother fgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = fgm.fathersidegrandmother_objid 
	WHERE fgm.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 6.1
-- by lastname of motherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT mgf.pdsid FROM hrmis_pds_family_motherside_grandfather mgf
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = mgf.mothersidegrandfather_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 6.2
-- by middlename of motherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT mgf.pdsid FROM hrmis_pds_family_motherside_grandfather mgf
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = mgf.mothersidegrandfather_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 7.1
-- by lastname of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT mgm.pdsid FROM hrmis_pds_family_motherside_grandmother mgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = mgm.mothersidegrandmother_objid 
	WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 7.2
-- by middlename of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT mgm.pdsid FROM hrmis_pds_family_motherside_grandmother mgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = mgm.mothersidegrandmother_objid 
	WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 7.3
-- by maidenname of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
	SELECT mgm.pdsid FROM hrmis_pds_family_motherside_grandmother mgm
	INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = mgm.mothersidegrandmother_objid 
	WHERE mgm.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 8.1 - SPOUSE
-- by lastname of father

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sf.pdsid FROM hrmis_pds_family_spouse_father sf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sf.spousefather_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)


UNION

-- MAIN QUERY 8.2 - SPOUSE
-- by middlename of father

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sf.pdsid FROM hrmis_pds_family_spouse_father sf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sf.spousefather_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)


UNION

-- MAIN QUERY 9.1 - SPOUSE
-- by lastname of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sm.pdsid FROM hrmis_pds_family_spouse_mother sm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sm.spousemother_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 9.2 - SPOUSE
-- by middlename of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sm.pdsid FROM hrmis_pds_family_spouse_mother sm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sm.spousemother_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 9.3 - SPOUSE
-- by maidenname of mother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sm.pdsid FROM hrmis_pds_family_spouse_mother sm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sm.spousemother_objid 
		WHERE sm.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 10.1 - SPOUSE
-- by lastname of fatherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sfgf.pdsid FROM hrmis_pds_family_spouse_fatherside_grandfather sfgf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sfgf.spousefathersidegrandfather_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 10.2 - SPOUSE
-- by middlename of fatherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sfgf.pdsid FROM hrmis_pds_family_spouse_fatherside_grandfather sfgf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sfgf.spousefathersidegrandfather_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 11.1 - SPOUSE
-- by lastname of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sfgm.pdsid FROM hrmis_pds_family_spouse_fatherside_grandmother sfgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sfgm.spousefathersidegrandmother_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 11.2 - SPOUSE
-- by middlename of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sfgm.pdsid FROM hrmis_pds_family_spouse_fatherside_grandmother sfgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sfgm.spousefathersidegrandmother_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 11.2 - SPOUSE
-- by maidenname of fatherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT sfgm.pdsid FROM hrmis_pds_family_spouse_fatherside_grandmother sfgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = sfgm.spousefathersidegrandmother_objid 
		WHERE sfgm.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)


UNION

-- MAIN QUERY 12.1 - SPOUSE
-- by lastname of motherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT smgf.pdsid FROM hrmis_pds_family_spouse_motherside_grandfather smgf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = smgf.spousemothersidegrandfather_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 12.2 - SPOUSE
-- by middlename of motherside grandfather

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT smgf.pdsid FROM hrmis_pds_family_spouse_motherside_grandfather smgf
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = smgf.spousemothersidegrandfather_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 13.1 - SPOUSE
-- by lastname of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT smgm.pdsid FROM hrmis_pds_family_spouse_motherside_grandmother smgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = smgm.spousemothersidegrandmother_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 13.1 - SPOUSE
-- by middlename of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT smgm.pdsid FROM hrmis_pds_family_spouse_motherside_grandmother smgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = smgm.spousemothersidegrandmother_objid 
		WHERE xx.middlename IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 13.1 - SPOUSE
-- by maidenname of motherside grandmother

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT smgm.pdsid FROM hrmis_pds_family_spouse_motherside_grandmother smgm
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = smgm.spousemothersidegrandmother_objid 
		WHERE smgm.maidenname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

UNION

-- MAIN QUERY 14.1 - CHILDREN
-- by lastname of CHILDREN

	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
	WHERE xx.objid IN
	(
		SELECT ch.pdsid FROM hrmis_pds_familybackground_children ch
		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = ch.child_objid 
		WHERE xx.lastname IN
		(
		-- names to search --
			SELECT DISTINCT zzz.middlename
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION 

			SELECT DISTINCT zzz.lastname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz

			UNION

			SELECT DISTINCT zzz.maidenname
			FROM
			(
				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
				WHERE objid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
				WHERE f.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
				WHERE f.pdsid = '${hit}'

				-- ++++++++++++ --
				-- GRANDPARENTS --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				-- Spouse side --

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
				WHERE q.pdsid = '${hit}'

				UNION

				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
				WHERE q.pdsid = '${hit}'
			) zzz
		-- end names to search -- 
		)
	)

-- UNION

-- -- MAIN QUERY 14.2 - CHILDREN
-- -- by middlename of CHILDREN

-- 	SELECT xx.objid, xx.person_name AS fullname FROM hrmis_pds xx
-- 	WHERE xx.objid IN
-- 	(
-- 		SELECT ch.pdsid FROM hrmis_pds_familybackground_children ch
-- 		INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = ch.child_objid 
-- 		WHERE xx.middlename IN
-- 		(
-- 		-- names to search --
-- 			SELECT DISTINCT zzz.middlename
-- 			FROM
-- 			(
-- 				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
-- 				WHERE objid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				-- ++++++++++++ --
-- 				-- GRANDPARENTS --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				-- Spouse side --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'
-- 			) zzz

-- 			UNION 

-- 			SELECT DISTINCT zzz.lastname
-- 			FROM
-- 			(
-- 				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
-- 				WHERE objid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				-- ++++++++++++ --
-- 				-- GRANDPARENTS --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				-- Spouse side --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'
-- 			) zzz

-- 			UNION

-- 			SELECT DISTINCT zzz.maidenname
-- 			FROM
-- 			(
-- 				SELECT person_lastname AS lastname,person_middlename AS middlename,maidenname AS maidenname FROM hrmis_pds 
-- 				WHERE objid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_fathername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.father_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_mothername f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.mother_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,f.maidenname AS maidenname FROM hrmis_pds_familybackground_spousename f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.spouse_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_familybackground_children f
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = f.child_objid 
-- 				WHERE f.pdsid = '${hit}'

-- 				-- ++++++++++++ --
-- 				-- GRANDPARENTS --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.fathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.mothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				-- Spouse side --

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_father q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_mother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_fatherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousefathersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename,NULL AS maidenname FROM hrmis_pds_family_spouse_motherside_grandfather q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandfather_objid
-- 				WHERE q.pdsid = '${hit}'

-- 				UNION

-- 				SELECT xx.lastname AS lastname,xx.middlename AS middlename, q.maidenname AS maidenname FROM hrmis_pds_family_spouse_motherside_grandmother q
-- 				INNER JOIN etracs254_bukidnon.`entityindividual` xx ON xx.objid = q.spousemothersidegrandmother_objid
-- 				WHERE q.pdsid = '${hit}'
-- 			) zzz
-- 		-- end names to search -- 
-- 		)
-- 	)
