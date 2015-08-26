--------------------------------------------------------
--  File created - Tuesday-August-25-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REVIEWS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."REVIEWS" 
   (	"ID" VARCHAR2(26 BYTE), 
	"RESTAURANT_ID" VARCHAR2(26 BYTE), 
	"USER_ID" VARCHAR2(26 BYTE), 
	"RATING" NUMBER(18,2), 
	"CONTENT" VARCHAR2(128 BYTE), 
	"REVIEW_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESTAURANTS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."RESTAURANTS" 
   (	"ID" VARCHAR2(3 BYTE), 
	"NAME" VARCHAR2(26 BYTE), 
	"STREETADDRESS" VARCHAR2(128 BYTE), 
	"CITY" VARCHAR2(26 BYTE), 
	"STATE" VARCHAR2(26 BYTE), 
	"ZIPCODE" VARCHAR2(7 BYTE), 
	"DESCRIPTION" VARCHAR2(128 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "TESTDB"."USERS" 
   (	"EMAIL_ID" VARCHAR2(26 BYTE), 
	"FIRSTNAME" VARCHAR2(26 BYTE), 
	"LASTNAME" VARCHAR2(26 BYTE), 
	"PASSWORD" VARCHAR2(26 BYTE), 
	"ZIPCODE" NUMBER(7,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TESTDB.REVIEWS
SET DEFINE OFF;
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('1','1','melissa.roy@yahoo.com',1,'Gross',to_date('02-OCT-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('2','1','lisa.bart@gmail.com',2,'Below expectation',to_date('04-MAR-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('3','1','debbie@aol.com',3,'Ok',to_date('07-AUG-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('4','2','melissa.roy@yahoo.com',4,'Really good',to_date('04-OCT-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('5','3','lisa.bart@gmail.com',5,'Perfect',to_date('02-OCT-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('6','4','debbie@aol.com',1,'Bad experience',to_date('04-MAR-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('7','5','melissa.roy@yahoo.com',2,'So bad',to_date('07-AUG-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('8','4','lisa.bart@gmail.com',3,'Ordinary',to_date('08-JAN-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('9','5','debbie@aol.com',4,'Real good',to_date('13-DEC-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('10','3','melissa.roy@yahoo.com',5,'Excellent',to_date('02-OCT-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('11','2','lisa.bart@gmail.com',4,'Quite good',to_date('08-JAN-15','DD-MON-RR'));
Insert into TESTDB.REVIEWS (ID,RESTAURANT_ID,USER_ID,RATING,CONTENT,REVIEW_DATE) values ('12','5','lisa.bart@gmail.com',3,'Regular',to_date('13-DEC-15','DD-MON-RR'));
REM INSERTING into TESTDB.RESTAURANTS
SET DEFINE OFF;
Insert into TESTDB.RESTAURANTS (ID,NAME,STREETADDRESS,CITY,STATE,ZIPCODE,DESCRIPTION) values ('1','Eugene Italian','94 Grant Street','Jackson','TX','75657.0','Old Italian place');
Insert into TESTDB.RESTAURANTS (ID,NAME,STREETADDRESS,CITY,STATE,ZIPCODE,DESCRIPTION) values ('2','Leo Thai','923 Murry Street','Virginia Beach','VA','23464.0','Best thai food in town');
Insert into TESTDB.RESTAURANTS (ID,NAME,STREETADDRESS,CITY,STATE,ZIPCODE,DESCRIPTION) values ('3','Vanessa''s Muffins','3958 Paul Wayne Haggerty Road','Kenner','LA','70065.0','Fresh muffins');
Insert into TESTDB.RESTAURANTS (ID,NAME,STREETADDRESS,CITY,STATE,ZIPCODE,DESCRIPTION) values ('4','57 Chinese','973 May Street','Virginia Beach','VA','23464.0','Awesome Chinese food');
Insert into TESTDB.RESTAURANTS (ID,NAME,STREETADDRESS,CITY,STATE,ZIPCODE,DESCRIPTION) values ('5','Corner Bakery','39 Haggerty Road','Kenner','LA','70065.0','Best place for breakfast');
REM INSERTING into TESTDB.USERS
SET DEFINE OFF;
Insert into TESTDB.USERS (EMAIL_ID,FIRSTNAME,LASTNAME,PASSWORD,ZIPCODE) values ('melissa.roy@yahoo.com','Melissa','Roy','melissa',75657);
Insert into TESTDB.USERS (EMAIL_ID,FIRSTNAME,LASTNAME,PASSWORD,ZIPCODE) values ('lisa.bart@gmail.com','Lisa','Bartolome','lisa',23464);
Insert into TESTDB.USERS (EMAIL_ID,FIRSTNAME,LASTNAME,PASSWORD,ZIPCODE) values ('debbie@aol.com','Debbie','Boynton','debbie',70065);
--------------------------------------------------------
--  Constraints for Table REVIEWS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."REVIEWS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESTAURANTS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."RESTAURANTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "TESTDB"."USERS" MODIFY ("EMAIL_ID" NOT NULL ENABLE);
