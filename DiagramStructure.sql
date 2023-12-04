-- creating this diagram Structure
CREATE TABLE "Location"
(
    "LocationID" BIGINT NOT NULL,
    "LocationNM" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Location" ADD CONSTRAINT "location_locationid_primary" PRIMARY KEY("LocationID");
CREATE TABLE "Department"
(
    "DepartmentID" BIGINT NOT NULL,
    "DepartmentNM" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Department" ADD CONSTRAINT "department_departmentid_primary" PRIMARY KEY("DepartmentID");
CREATE TABLE "Aetna"
(
    "id" BIGINT NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" INT NOT NULL
);
ALTER TABLE
    "Aetna" ADD CONSTRAINT "aetna_id_primary" PRIMARY KEY("id");
CREATE TABLE "Anthem"
(
    "id" BIGINT NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" INT NOT NULL
);
ALTER TABLE
    "Anthem" ADD CONSTRAINT "anthem_id_primary" PRIMARY KEY("id");
CREATE TABLE "United"
(
    "id" BIGINT NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" BIGINT NOT NULL
);
ALTER TABLE
    "United" ADD CONSTRAINT "united_id_primary" PRIMARY KEY("id");
CREATE TABLE "StandardCalendar"
(
    "DateID" BIGINT NOT NULL,
    "DateVAL" DATETIME NOT NULL,
    "EndOfMonthVAL" DATETIME NOT NULL,
    "EndOfQuarterVAL" DATETIME NOT NULL,
    "EndOfYearVAL" DATETIME NOT NULL
);
ALTER TABLE
    "StandardCalendar" ADD CONSTRAINT "standardcalendar_dateid_primary" PRIMARY KEY("DateID");
CREATE TABLE "Encounter"
(
    "EncounterID" INT NOT NULL,
    "EDWPatientID" NVARCHAR(255) NOT NULL,
    "EncounterDepartmentID" BIGINT NOT NULL,
    "EncounterDTS" DATETIME NOT NULL,
    "EncounterLocationID" BIGINT NOT NULL
);
ALTER TABLE
    "Encounter" ADD CONSTRAINT "encounter_encounterid_primary" PRIMARY KEY("EncounterID");
CREATE TABLE "ClinicalPatient"
(
    "SourcePatientID" BIGINT NOT NULL,
    "EDWPatientID" NVARCHAR(255) NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientRaceDSC" VARCHAR(255) NOT NULL,
    "PatientEthnicityDSC" VARCHAR(255) NOT NULL,
    "PatientGenderDSC" VARCHAR(255) NOT NULL,
    "SourceSystemNM" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "ClinicalPatient" ADD CONSTRAINT "clinicalpatient_edwpatientid_primary" PRIMARY KEY("EDWPatientID");
CREATE TABLE "PatientMemberMatch"
(
    "EDWPatientID" NVARCHAR(255) NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" INT NOT NULL,
    "SourceSystemNM" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "PatientMemberMatch" ADD CONSTRAINT "patientmembermatch_edwpatientid_primary" PRIMARY KEY("EDWPatientID");
CREATE TABLE "Cigna"
(
    "id" BIGINT NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" INT NOT NULL
);
ALTER TABLE
    "Cigna" ADD CONSTRAINT "cigna_id_primary" PRIMARY KEY("id");
CREATE TABLE "Humana"
(
    "id" BIGINT NOT NULL,
    "PatientNM" VARCHAR(255) NOT NULL,
    "PatientDOB" DATETIME NOT NULL,
    "PatientSSN" INT NOT NULL
);
ALTER TABLE
    "Humana" ADD CONSTRAINT "humana_id_primary" PRIMARY KEY("id");
ALTER TABLE
    "Humana" ADD CONSTRAINT "humana_patientnm_foreign" FOREIGN KEY("PatientNM") REFERENCES "PatientMemberMatch"("PatientNM");
ALTER TABLE
    "Humana" ADD CONSTRAINT "humana_patientssn_foreign" FOREIGN KEY("PatientSSN") REFERENCES "PatientMemberMatch"("PatientSSN");
ALTER TABLE
    "United" ADD CONSTRAINT "united_patientnm_foreign" FOREIGN KEY("PatientNM") REFERENCES "PatientMemberMatch"("PatientNM");
ALTER TABLE
    "Encounter" ADD CONSTRAINT "encounter_edwpatientid_foreign" FOREIGN KEY("EDWPatientID") REFERENCES "ClinicalPatient"("EDWPatientID");
ALTER TABLE
    "Anthem" ADD CONSTRAINT "anthem_patientnm_foreign" FOREIGN KEY("PatientNM") REFERENCES "PatientMemberMatch"("PatientNM");
ALTER TABLE
    "Anthem" ADD CONSTRAINT "anthem_patientdob_foreign" FOREIGN KEY("PatientDOB") REFERENCES "PatientMemberMatch"("PatientDOB");
ALTER TABLE
    "Anthem" ADD CONSTRAINT "anthem_patientssn_foreign" FOREIGN KEY("PatientSSN") REFERENCES "PatientMemberMatch"("PatientSSN");
ALTER TABLE
    "Aetna" ADD CONSTRAINT "aetna_patientdob_foreign" FOREIGN KEY("PatientDOB") REFERENCES "PatientMemberMatch"("PatientDOB");
ALTER TABLE
    "Encounter" ADD CONSTRAINT "encounter_encounterlocationid_foreign" FOREIGN KEY("EncounterLocationID") REFERENCES "Location"("LocationID");
ALTER TABLE
    "Cigna" ADD CONSTRAINT "cigna_patientnm_foreign" FOREIGN KEY("PatientNM") REFERENCES "PatientMemberMatch"("PatientNM");
ALTER TABLE
    "ClinicalPatient" ADD CONSTRAINT "clinicalpatient_edwpatientid_foreign" FOREIGN KEY("EDWPatientID") REFERENCES "PatientMemberMatch"("EDWPatientID");
ALTER TABLE
    "Encounter" ADD CONSTRAINT "encounter_encounterdts_foreign" FOREIGN KEY("EncounterDTS") REFERENCES "StandardCalendar"("DateVAL");
ALTER TABLE
    "Cigna" ADD CONSTRAINT "cigna_patientdob_foreign" FOREIGN KEY("PatientDOB") REFERENCES "PatientMemberMatch"("PatientDOB");
ALTER TABLE
    "United" ADD CONSTRAINT "united_patientssn_foreign" FOREIGN KEY("PatientSSN") REFERENCES "PatientMemberMatch"("PatientSSN");
ALTER TABLE
    "Aetna" ADD CONSTRAINT "aetna_patientnm_foreign" FOREIGN KEY("PatientNM") REFERENCES "PatientMemberMatch"("PatientNM");
ALTER TABLE
    "Encounter" ADD CONSTRAINT "encounter_encounterdepartmentid_foreign" FOREIGN KEY("EncounterDepartmentID") REFERENCES "Department"("DepartmentID");
ALTER TABLE
    "United" ADD CONSTRAINT "united_patientdob_foreign" FOREIGN KEY("PatientDOB") REFERENCES "PatientMemberMatch"("PatientDOB");
ALTER TABLE
    "Aetna" ADD CONSTRAINT "aetna_patientssn_foreign" FOREIGN KEY("PatientSSN") REFERENCES "PatientMemberMatch"("PatientSSN");
ALTER TABLE
    "Humana" ADD CONSTRAINT "humana_patientdob_foreign" FOREIGN KEY("PatientDOB") REFERENCES "PatientMemberMatch"("PatientDOB");
ALTER TABLE
    "Cigna" ADD CONSTRAINT "cigna_patientssn_foreign" FOREIGN KEY("PatientSSN") REFERENCES "PatientMemberMatch"("PatientSSN");