create or replace TRIGGER after_rfe
AFTER INSERT ON F15C6_RFE
FOR EACH ROW
DECLARE
  sys_admin_param integer;
  lab_dir_param integer;
  chair_param integer;
  exec_dir_param integer;
  contact_id_param integer;
BEGIN
  sys_admin_param := get_sys_admin(v('P2_LABID'));
  lab_dir_param := get_lab_dir(v('P2_LABID'));
  chair_param := get_ch();
  exec_dir_param := get_dir();
  contact_id_param := F15C6_CTC_SEQ.nextval;


  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (contact_id_param, F15C6_RFE_SEQ.currval , v('P2_EMPID'), 101);

  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (F15C6_CTC_SEQ.nextval, F15C6_RFE_SEQ.currval, sys_admin_param, 105);

  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (F15C6_CTC_SEQ.nextval, F15C6_RFE_SEQ.currval, lab_dir_param, 107);

  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (F15C6_CTC_SEQ.nextval, F15C6_RFE_SEQ.currval, chair_param, 109);

  insert into F15C6_CTC (contact_id, rfe_id, emp_id, role_id) values
  (F15C6_CTC_SEQ.nextval, F15C6_RFE_SEQ.currval, exec_dir_param, 111);

END;

create or replace TRIGGER after_stat_change
AFTER UPDATE OF status_id ON F15C6_RFE
DECLARE
  hist_id_param integer;
  contact_id_param integer;
  status_id_param integer;
  eff_date_param date;
BEGIN
	hist_id_param := F15C6_HIS_SEQ.nextval;

	SELECT contact_id
	INTO contact_id_param
	FROM F15C6_CTC
	WHERE F15C6_CTC.rfe_id = nv('P12_RFEID')
	AND F15C6_CTC.emp_id = nv('P2_EMPID');

	SELECT status_id 
	INTO status_id_param
	FROM F15C6_RFE
	WHERE F15C6_RFE.rfe_id = nv('P12_RFEID');

	INSERT INTO F15C6_HIS (hist_id, rfe_id, contact_id, status_id, eff_date)
	VALUES (hist_id_param, nv('P12_RFEID'), contact_id_param, status_id_param, sysdate);

    IF status_id_param = 117 THEN
    UPDATE F15C6_RFE SET app_rdate = SYSDATE WHERE F15C6_RFE.rfe_id = nv('P12_RFEID');
    END IF;

END;
