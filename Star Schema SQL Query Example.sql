Select
 enc.EncounterID
,enc.EDWPatientID
,enc.EncounterDepartmentID
,enc.EncounterDTS
,enc.EncounterLocationID
,pat.PatientNM
,dept.DepartmentNM
,loc.LocationNM
,cal.EndOfMonthVAL
From clinical.reporting.encounter
Left join ClinicalPatient pat on pat.edwpatientID = enc.edwpatientID
Left join Department dept on dept.departmentID = enc.EncounterDepartmentID
Left Join Location loc on loc.locationID =  enc.EncounterLocationID
Left Join StandardCalendar cal on cal.DateVal = enc.EncounterDTS