#to correct date format in csv cc_detils table---
ALTER TABLE cc_detail ADD COLUMN Week_Start_Date_temp DATE;
UPDATE cc_detail 
SET Week_Start_Date_temp = STR_TO_DATE(Week_Start_Date, '%d-%m-%Y');
ALTER TABLE cc_detail DROP COLUMN Week_Start_Date;
ALTER TABLE cc_detail CHANGE COLUMN Week_Start_Date_temp Week_Start_Date DATE;
UPDATE cc_detail 
SET Week_Start_Date_temp = STR_TO_DATE(Week_Start_Date, '%d-%m-%Y')
WHERE Client_Num IS NOT NULL;
