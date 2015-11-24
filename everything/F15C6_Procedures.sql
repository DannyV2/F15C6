create or replace PROCEDURE add_cmt
(
  cmt_param varchar2
)
AS
comment_id_param integer;
rfe_id_param integer;
contact_id_param integer;
entry_date_param date;

BEGIN

comment_id_param := F15C6_CMT_SEQ.nextval;

SELECT contact_id
INTO contact_id_param
FROM F15C6_CTC
WHERE F15C6_CTC.rfe_id = nv('P12_RFEID')
AND F15C6_CTC.emp_id = nv('P2_EMPID');

-- Insert Comment
  insert into F15C6_CMT (comment_id, rfe_id, contact_id, entry_date, cmt) values
  (comment_id_param, nv('P12_RFEID'), contact_id_param, sysdate, cmt_param);
  COMMIT;

END;

create or replace PROCEDURE add_fyi
(
  emp_id_param integer
)
AS
contact_id_param integer;

BEGIN
contact_id_param := F15C6_CTC_SEQ.nextval;

-- Add FYI_Reviewer
  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (contact_id_param, nv('P12_RFEID'), emp_id_param, 103);
  COMMIT;

END;

create or replace PROCEDURE add_task
(
  task_abv_param  varchar2,
  task_desc_param varchar2
)
AS
task_id_param integer;
eff_date_param date;

BEGIN

task_id_param := F15C6_TSK_SEQ.nextval;

-- Add Task
  insert into F15C6_TSK (task_id, eff_date, task__abv, task_desc) values
  (task_id_param, sysdate, task_abv_param, task_desc_param);
  COMMIT;

END;

create or replace PROCEDURE add_ttr
(
  task_id_param integer
)
AS
  rt_id_param  integer;
  rfe_id_param integer;

BEGIN

rt_id_param := F15C6_TRR_SEQ.nextval;

-- Add Task to RFE
  insert into F15C6_TRR (rt_id, rfe_id, task_id) values
  (rt_id_param, nv('P12_RFEID'), task_id_param);
  COMMIT;

END;

create or replace PROCEDURE create_doc
(
  doc_param varchar2
)
AS
doc_id_param integer;
contact_id_param integer;
real_doc_param blob;
BEGIN

SELECT blob_content
INTO real_doc_param
FROM wwv_flow_files
WHERE name = doc_param;
-- :P27_DOCUMENT_IMAGE
doc_id_param := F15C6_DOC_SEQ.nextval;


SELECT contact_id
INTO contact_id_param
FROM F15C6_CTC
WHERE F15C6_CTC.rfe_id = nv('P12_RFEID')
AND F15C6_CTC.emp_id = nv('P2_EMPID');

-- Insert Document
  insert into F15C6_DOC (doc_id, rfe_id, contact_id, doc) values
  (doc_id_param, nv('P12_RFEID'), contact_id_param, real_doc_param);
  COMMIT;

END;

create or replace PROCEDURE create_rfe
(
  exp_param varchar2,
  protection_param varchar2,
  lab_id integer,
  emp_id integer
)
AS
rfe_id_param integer;
sys_admin_param integer;
BEGIN
rfe_id_param := F15C6_RFE_SEQ.nextval;
-- Insert RFE

  insert into F15C6_RFE (rfe_id, status_id, app_rdate, exp, prot) values
  (rfe_id_param, 101 , null , exp_param, protection_param);
  COMMIT;
-- Insert Contacts

  --insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  --(F15C6_CTC_SEQ.nextval, 103, emp_id, 101);

  --insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  --(F15C6_CTC_SEQ.nextval, rfe_id_param, sys_admin_param , 105);
  --COMMIT;

END;
