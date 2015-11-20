-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-19 21:40:24 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE F15C6_AUT
  ( auth_id INTEGER NOT NULL , RIGHT VARCHAR2 (10)
  ) ;
ALTER TABLE F15C6_AUT ADD CONSTRAINT F15C6_AUT_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15C6_CMT
  (
    comment_id           INTEGER NOT NULL ,
    F15C6_RFE_rfe_id     INTEGER ,
    F15C6_CTC_contact_id INTEGER NOT NULL ,
    entry_date           DATE ,
    "comment"            VARCHAR2 (4000)
  ) ;
ALTER TABLE F15C6_CMT ADD CONSTRAINT F15C6_CMT_PK PRIMARY KEY ( comment_id ) ;


CREATE TABLE F15C6_CTC
  (
    contact_id        INTEGER NOT NULL ,
    F15C6_RFE_rfe_id  INTEGER NOT NULL ,
    F15C6_EMP_emp_id  INTEGER NOT NULL ,
    F15C6_ROL_role_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15C6_CTC ADD CONSTRAINT F15C6_CTC_PK PRIMARY KEY ( contact_id ) ;


CREATE TABLE F15C6_DOC
  (
    doc_id               INTEGER NOT NULL ,
    F15C6_RFE_rfe_id     INTEGER ,
    F15C6_CTC_contact_id INTEGER NOT NULL ,
    doc BLOB
  ) ;
ALTER TABLE F15C6_DOC ADD CONSTRAINT F15C6_DOC_PK PRIMARY KEY ( doc_id ) ;


CREATE TABLE F15C6_EMP
  (
    emp_id            INTEGER NOT NULL ,
    F15C6_LAB_lab_id  INTEGER ,
    F15C6_AUT_auth_id INTEGER ,
    emp_name          VARCHAR2 (30) ,
    emp_email         VARCHAR2 (100) ,
    emp_phone         VARCHAR2 (8) ,
    emp_office        VARCHAR2 (12) ,
    active            VARCHAR2 (1) ,
    eff_date          DATE
  ) ;
ALTER TABLE F15C6_EMP ADD CONSTRAINT F15C6_EMP_PK PRIMARY KEY ( emp_id ) ;


CREATE TABLE F15C6_HIS
  (
    hist_id              INTEGER NOT NULL ,
    F15C6_RFE_rfe_id     INTEGER ,
    F15C6_CTC_contact_id INTEGER NOT NULL ,
    F15C6_STA_status_id  INTEGER ,
    eff_date             DATE
  ) ;
ALTER TABLE F15C6_HIS ADD CONSTRAINT F15C6_HIS_PK PRIMARY KEY ( hist_id ) ;


CREATE TABLE F15C6_LAB
  ( lab_id INTEGER NOT NULL , lab_name VARCHAR2 (30)
  ) ;
ALTER TABLE F15C6_LAB ADD CONSTRAINT F15C6_LAB_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15C6_RFE
  (
    rfe_id              INTEGER NOT NULL ,
    F15C6_STA_status_id INTEGER ,
    app_rdate           DATE ,
    exp                 VARCHAR2 (4000) ,
    protection          VARCHAR2 (4000)
  ) ;
ALTER TABLE F15C6_RFE ADD CONSTRAINT F15C6_RFE_PK PRIMARY KEY ( rfe_id ) ;


CREATE TABLE F15C6_ROL
  (
    role_id   INTEGER NOT NULL ,
    role_type VARCHAR2 (30) NOT NULL ,
    "desc"    VARCHAR2 (500) NOT NULL
  ) ;
ALTER TABLE F15C6_ROL ADD CONSTRAINT F15C6_ROL_PK PRIMARY KEY ( role_id ) ;


CREATE TABLE F15C6_STA
  (
    status_id  INTEGER NOT NULL ,
    rfe_status VARCHAR2 (30) ,
    "desc"     VARCHAR2 (500)
  ) ;
ALTER TABLE F15C6_STA ADD CONSTRAINT F15C6_STA_PK PRIMARY KEY ( status_id ) ;


CREATE TABLE F15C6_TRR
  (
    rt_id             INTEGER NOT NULL ,
    F15C6_RFE_rfe_id  INTEGER NOT NULL ,
    F15C6_TSK_task_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15C6_TRR ADD CONSTRAINT F15C6_TRR_PK PRIMARY KEY ( rt_id ) ;


CREATE TABLE F15C6_TSK
  (
    task_id   INTEGER NOT NULL ,
    eff_date  DATE ,
    task__abv VARCHAR2 (15) ,
    task_desc VARCHAR2 (4000)
  ) ;
ALTER TABLE F15C6_TSK ADD CONSTRAINT F15C6_TSK_PK PRIMARY KEY ( task_id ) ;


ALTER TABLE F15C6_CMT ADD CONSTRAINT F15C6_CMT_F15C6_CTC_FK FOREIGN KEY ( F15C6_CTC_contact_id ) REFERENCES F15C6_CTC ( contact_id ) ;

ALTER TABLE F15C6_CMT ADD CONSTRAINT F15C6_CMT_F15C6_RFE_FK FOREIGN KEY ( F15C6_RFE_rfe_id ) REFERENCES F15C6_RFE ( rfe_id ) ;

ALTER TABLE F15C6_CTC ADD CONSTRAINT F15C6_CTC_F15C6_EMP_FK FOREIGN KEY ( F15C6_EMP_emp_id ) REFERENCES F15C6_EMP ( emp_id ) ;

ALTER TABLE F15C6_CTC ADD CONSTRAINT F15C6_CTC_F15C6_RFE_FK FOREIGN KEY ( F15C6_RFE_rfe_id ) REFERENCES F15C6_RFE ( rfe_id ) ;

ALTER TABLE F15C6_CTC ADD CONSTRAINT F15C6_CTC_F15C6_ROL_FK FOREIGN KEY ( F15C6_ROL_role_id ) REFERENCES F15C6_ROL ( role_id ) ;

ALTER TABLE F15C6_DOC ADD CONSTRAINT F15C6_DOC_F15C6_CTC_FK FOREIGN KEY ( F15C6_CTC_contact_id ) REFERENCES F15C6_CTC ( contact_id ) ;

ALTER TABLE F15C6_DOC ADD CONSTRAINT F15C6_DOC_F15C6_RFE_FK FOREIGN KEY ( F15C6_RFE_rfe_id ) REFERENCES F15C6_RFE ( rfe_id ) ;

ALTER TABLE F15C6_EMP ADD CONSTRAINT F15C6_EMP_F15C6_AUT_FK FOREIGN KEY ( F15C6_AUT_auth_id ) REFERENCES F15C6_AUT ( auth_id ) ;

ALTER TABLE F15C6_EMP ADD CONSTRAINT F15C6_EMP_F15C6_LAB_FK FOREIGN KEY ( F15C6_LAB_lab_id ) REFERENCES F15C6_LAB ( lab_id ) ;

ALTER TABLE F15C6_HIS ADD CONSTRAINT F15C6_HIS_F15C6_CTC_FK FOREIGN KEY ( F15C6_CTC_contact_id ) REFERENCES F15C6_CTC ( contact_id ) ;

ALTER TABLE F15C6_HIS ADD CONSTRAINT F15C6_HIS_F15C6_RFE_FK FOREIGN KEY ( F15C6_RFE_rfe_id ) REFERENCES F15C6_RFE ( rfe_id ) ;

ALTER TABLE F15C6_HIS ADD CONSTRAINT F15C6_HIS_F15C6_STA_FK FOREIGN KEY ( F15C6_STA_status_id ) REFERENCES F15C6_STA ( status_id ) ;

ALTER TABLE F15C6_RFE ADD CONSTRAINT F15C6_RFE_F15C6_STA_FK FOREIGN KEY ( F15C6_STA_status_id ) REFERENCES F15C6_STA ( status_id ) ;

ALTER TABLE F15C6_TRR ADD CONSTRAINT F15C6_TRR_F15C6_RFE_FK FOREIGN KEY ( F15C6_RFE_rfe_id ) REFERENCES F15C6_RFE ( rfe_id ) ;

ALTER TABLE F15C6_TRR ADD CONSTRAINT F15C6_TRR_F15C6_TSK_FK FOREIGN KEY ( F15C6_TSK_task_id ) REFERENCES F15C6_TSK ( task_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
