
------------ Initialization of Role Type Codes in F15C6_ROL Table --------------

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'Requestor', 'The employee who created the rfe');

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'FYI Reviwer', 'An employee with peripheral
  interests; will get automcatically notified at certain stages');

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'Sys Admin Approver', 'First round approver for
  the new RFE''s in their lab.');

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'Lab Director Approver', 'Second round approver
  for new RFE''s in their lab.');

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'Chairperson Approver', 'Network Security Panel
  Approver.');

INSERT INTO F15C6_ROL (role_id, role_type, descript)
  VALUES (F15C6_ROL_SEQ.NEXTVAL, 'Exec Dir Approver', 'Final round approver for
  all RFE''s');

------------- Initialization of Status Codes in F15C6_STA Table ----------------

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Entered', 'The RFE has been created but has
  not yer been submitted for approval.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Submitted', 'The RFE has beeb submitted to the
  Lab System Administrator for approval.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Returned', 'The RFE has been returnied for
  further information or clarification. Once Submitted again, it will follow
  the same routing as an entered RFE. ');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Recalled', 'The requestor has recalled an RFE
  that has not yet reached final approval. Once submitted again, it will follow
  the same routing as an entered RFE.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Rejected', 'The RFE has been rejected and
  cannot be implemented.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'SA Approved', 'The Lab System Administrator
  has approved the RFE; it has been submitted for Lab Director approval.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'LD Approved', 'The Lab Director has approved
  the RFE; it has been submitted for Network Security Panel Approval.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'CH Approved', 'The Lab Director has approved
  the RFE; it has been submitted to the Chairperson of Security Panel approval.');

INSERT INTO F15C6_STA (status_id, rfe_status, descript)
  VALUES (F15C6_STA_SEQ.NEXTVAL, 'Final Approved', 'The Executive Director''s
  office has given final approval for the RFE and it may be implemented.');


----------- Initialization of Authentications in F15C6_AUT Table ---------------

INSERT INTO F15C6_AUT (auth_id, right)
  VALUES (F15C6_AUT_SEQ.NEXTVAL, 'Edit');

INSERT INTO F15C6_AUT (auth_id, right)
  VALUES (F15C6_AUT_SEQ.NEXTVAL, 'View');

INSERT INTO F15C6_AUT (auth_id, right)
  VALUES (F15C6_AUT_SEQ.NEXTVAL, 'View/Edit');

------------------ Initialization of Labs in F15C6_LAB Table -------------------

INSERT INTO F15C6_LAB (lab_id, lab_name)
  VALUES (F15C6_LAB_SEQ.NEXTVAL, 'Administrative Lab');

INSERT INTO F15C6_LAB (lab_id, lab_name)
  VALUES (F15C6_LAB_SEQ.NEXTVAL, 'Software Lab');

INSERT INTO F15C6_LAB (lab_id, lab_name)
  VALUES (F15C6_LAB_SEQ.NEXTVAL, 'NanoTec Lab');

INSERT INTO F15C6_LAB (lab_id, lab_name)
  VALUES (F15C6_LAB_SEQ.NEXTVAL, 'AI Lab');

INSERT INTO F15C6_LAB (lab_id, lab_name)
  VALUES (F15C6_LAB_SEQ.NEXTVAL, 'Neuroscience Lab');

------------------ Initialization of EMP in F15C6_EMP Table --------------------

-- Administrative Lab 101

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 101, 105, 'Mario Perez', 'mperez@arl.org',
  '000-000', 'A800', 'A', SYSDATE, 'N', 'N', 'Y', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 101, 105, 'Andrew Park', 'apark@arl.org',
  '000-000', 'Z901', 'A', SYSDATE, 'N', 'N', 'N', 'Y');

-- Software Lab 103

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 103, 105, 'Danny Varela', 'dvarela@arl.org',
  '000-000', 'Y161', 'A', SYSDATE, 'N', 'Y', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 103, 105, 'Andrew Gordo', 'agordo@arl.org',
  '000-000', 'G678', 'A', SYSDATE, 'Y', 'N', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 103, 105, 'Carlos Fernandez', 'cfer@arl.org',
  '000-000', 'H778', 'A', SYSDATE, 'N', 'N', 'N', 'N');

-- Nano Tec Lab 105

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 105, 105, 'Cristiano Ronaldo', 'cronaldo@arl.org',
  '000-000', 'Y161', 'A', SYSDATE, 'N', 'Y', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 105, 105, 'Lionel Messi', 'lmessi@arl.org',
  '000-000', 'G678', 'A', SYSDATE, 'Y', 'N', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 105, 103, 'Bruce Payne', 'bpayne@arl.org',
  '000-000', 'H778', 'A', SYSDATE, 'N', 'N', 'N', 'N');

-- AI Lab 107

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 107, 105, 'Maggie Psung', 'mpsung@arl.org',
  '000-000', 'A972', 'A', SYSDATE, 'N', 'Y', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 107, 105, 'Lorenzo Pul', 'lpul@arl.org',
  '000-000', 'R001', 'A', SYSDATE, 'Y', 'N', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 107, 103, 'Mark Lietner', 'mlietner@arl.org',
  '000-000', 'P343', 'A', SYSDATE, 'N', 'N', 'N', 'N');

-- Neuroscience Lab 109

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 109, 105, 'Peter Parker', 'pparker@arl.org',
  '000-000', 'L242', 'A', SYSDATE, 'N', 'Y', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 109, 105, 'John Smith', 'jsmith@arl.org',
  '000-000', 'I747', 'A', SYSDATE, 'Y', 'N', 'N', 'N');

INSERT INTO F15C6_EMP (emp_id, lab_id, auth_id, emp_name, emp_email, emp_phone,
  emp_office, active, eff_date, sys_ad, lab_dir, ch_per, ex_dir)
  VALUES (F15C6_EMP_SEQ.NEXTVAL, 109, 103, 'Maria Sharapova', 'mshara@arl.org',
  '000-000', 'P223', 'A', SYSDATE, 'N', 'N', 'N', 'N');
