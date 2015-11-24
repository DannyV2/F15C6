create or replace FUNCTION get_ch
RETURN integer
AS
  ch_id integer;
BEGIN
  select emp_id into ch_id from F15C6_EMP where ch_per = 'Y';
  return ch_id;
END;

create or replace FUNCTION get_dir
RETURN integer
AS
  dir_id integer;
BEGIN
  select emp_id into dir_id from F15C6_EMP where ex_dir = 'Y';
  return dir_id;
END;

create or replace FUNCTION get_lab_dir
(
  lab_id_param integer
)
RETURN integer
AS
  lab_dir_id integer;
BEGIN
  select emp_id into lab_dir_id from F15C6_EMP where lab_dir = 'Y' AND lab_id = lab_id_param;
  return lab_dir_id;
END;

create or replace FUNCTION get_lab_dir
(
  lab_id_param integer
)
RETURN integer
AS
  lab_dir_id integer;
BEGIN
  select emp_id into lab_dir_id from F15C6_EMP where lab_dir = 'Y' AND lab_id = lab_id_param;
  return lab_dir_id;
END;

create or replace FUNCTION get_role
(
  rfe_id_param integer,
  emp_id_param integer
)
RETURN varchar2
AS
  curr_role varchar2(30);
BEGIN
  select role_type into curr_role from F15C6_RFE join F15C6_CTC on F15C6_RFE.rfe_id = F15C6_CTC.rfe_id join
  F15C6_ROL on F15C6_ROL.role_id = F15C6_CTC.role_id where F15C6_RFE.rfe_id = rfe_id_param and F15C6_CTC.emp_id = emp_id_param;
  return curr_role ;
END;

create or replace FUNCTION get_sql_select
RETURN varchar2
AS
  dir_id integer;
  curr_emp varchar2(30):= get_role(nv('P12_RFEID'), nv('P2_EMPID'));
  v_sql varchar2(3000);
  status varchar2(30):= v('P12_STATUSID');
BEGIN
  IF curr_emp = 'Requestor' AND Status = 'Recalled' THEN
    v_sql := 'select rfe_status as d,
    status_id as r
    from F15C6_STA where rfe_status = '||'''Recalled''' || 'OR rfe_status = ' || '''Submitted''' || ' order by 1';
  ELSIF curr_emp = 'Requestor' AND status = 'Entered' THEN
    v_sql := 'select rfe_status as d,
     status_id as r
     from F15C6_STA where rfe_status = '||'''Submitted''' || 'OR rfe_status = ' || '''Entered''' || ' order by 1';
  ELSIF curr_emp = 'Requestor' AND status = 'Submitted' THEN
  v_sql := 'select rfe_status as d,
     status_id as r
     from F15C6_STA where rfe_status = '||'''Submitted''' || 'OR rfe_status = ' || '''Recalled''' || ' order by 1';
  ELSIF curr_emp = 'Requestor' THEN
  v_sql := 'select rfe_status as d,
     status_id as r
     from F15C6_STA where rfe_status = '||'''Submitted''' || 'OR rfe_status =' || '''Entered''' || 'OR rfe_status =' || '''Recalled''' ||' order by 1';
  ELSIF curr_emp = 'Sys Admin Approver' THEN
  v_sql := 'select rfe_status as d,
     status_id as r
     from F15C6_STA where rfe_status = '||'''Rejected''' || 'OR rfe_status =' || '''SA Approved''' ||' order by 1';
  ELSIF curr_emp = 'Lab Director Approver' THEN
  v_sql := 'select rfe_status as d,
        status_id as r
        from F15C6_STA where rfe_status = '||'''Rejected''' || 'OR rfe_status =' || '''LD Approved''' ||' order by 1';
  ELSIF curr_emp = 'Chairperson Approver' THEN
  v_sql := 'select rfe_status as d,
        status_id as r
        from F15C6_STA where rfe_status = '||'''Rejected''' || 'OR rfe_status =' || '''CH Approved''' ||' order by 1';
  ELSIF curr_emp = 'Exec Dir Approver' THEN
  v_sql := 'select rfe_status as d,
        status_id as r
        from F15C6_STA where rfe_status = '||'''Rejected''' || 'OR rfe_status =' || '''Final Approved''' ||' order by 1';
  ELSE
  v_sql := 'Nothing Found!';
END IF;

RETURN v_sql;
END;

create or replace FUNCTION get_sys_admin
(
  lab_id_param integer
)
RETURN integer
AS
  sys_admin_id integer;
BEGIN
  select emp_id into sys_admin_id from F15C6_EMP where sys_ad = 'Y' AND lab_id = lab_id_param;
  return sys_admin_id;
END;

create or replace FUNCTION hide_rfe_appr
RETURN boolean
AS
  sys_ad_v varchar2(1);
  lab_dir_v varchar2(1);
  ch_per_v varchar2(1);
  ex_dir_v varchar2(1);
  v_sql varchar2(3000);
BEGIN

  select sys_ad into sys_ad_v from F15C6_EMP where emp_id = nv('P2_EMPID');
  select lab_dir into lab_dir_v from F15C6_EMP where emp_id = nv('P2_EMPID');
  select ch_per into ch_per_v from F15C6_EMP where emp_id = nv('P2_EMPID');
  select ex_dir into ex_dir_v from F15C6_EMP where emp_id = nv('P2_EMPID');

  IF sys_ad_v = 'Y' THEN
  return true;
  ELSIF lab_dir_v = 'Y' THEN
  return true;
  ELSIF ch_per_v = 'Y' THEN
  return true;
  ELSIF ex_dir_v = 'Y' THEN
  return true;
  ELSE
  return false;
  END IF;

  return false;
END;
