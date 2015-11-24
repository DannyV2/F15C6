-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-24 10:48:40 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE F15C6_BHOUSE
  (
    BHNO            INTEGER NOT NULL ,
    HNAME           VARCHAR2 (20) ,
    LOC             VARCHAR2 (20) ,
    F15C6_HOUSE_HNO INTEGER
  ) ;
ALTER TABLE F15C6_BHOUSE ADD CONSTRAINT F15C6_BHOUSE_PK PRIMARY KEY ( BHNO ) ;


CREATE TABLE F15C6_CAR
  (
    CNO             INTEGER NOT NULL ,
    CNAME           VARCHAR2 (20) ,
    JOB             VARCHAR2 (20) ,
    DEAD            VARCHAR2 (5) ,
    PIC             VARCHAR2 (5000) ,
    STORY           VARCHAR2 (10000) ,
    F15C6_HOUSE_HNO INTEGER
  ) ;
ALTER TABLE F15C6_CAR ADD CONSTRAINT F15C6_CAR_PK PRIMARY KEY ( CNO ) ;


CREATE TABLE F15C6_HOUSE
  (
    HNO   INTEGER NOT NULL ,
    HNAME VARCHAR2 (20) ,
    LOC   VARCHAR2 (20) ,
    MEN   INTEGER ,
    PIC   VARCHAR2 (5000) ,
    STORY VARCHAR2 (10000)
  ) ;
ALTER TABLE F15C6_HOUSE ADD CONSTRAINT F15C6_HOUSE_PK PRIMARY KEY ( HNO ) ;


ALTER TABLE F15C6_BHOUSE ADD CONSTRAINT F15C6_BHOUSE_F15C6_HOUSE_FK FOREIGN KEY ( F15C6_HOUSE_HNO ) REFERENCES F15C6_HOUSE ( HNO ) ;

ALTER TABLE F15C6_CAR ADD CONSTRAINT F15C6_CAR_F15C6_HOUSE_FK FOREIGN KEY ( F15C6_HOUSE_HNO ) REFERENCES F15C6_HOUSE ( HNO ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
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
