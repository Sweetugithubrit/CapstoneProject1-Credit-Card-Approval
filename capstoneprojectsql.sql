/*  data set (Credit_card_label.csv) contains two key pieces of information
ID: The joining key between application data and credit status data, same is Ind_ID
Label: 0 is application approved and 1 is application rejected. 
*/
/* -- firstly create database named credit_card_details*/
CREATE DATABASE CREDIT_CARD_DETAILS;

USE CREDIT_CARD_DETAILS;
/* --check the table information */
SELECT * FROM credit_card_info;
SELECT * FROM credit_card_label;

/*Group the customers based on their income type and find the average of their annual income.*/
SELECT type_income, AVG(annual_income) AS average_income FROM credit_card_info GROUP BY type_income;

/*Find the female owners of cars and property.*/
SELECT gender,Car_owner,Propert_owner FROM credit_card_info WHERE Gender= 'F';

/*Find the male customers who are staying with their families.*/
SELECT * FROM credit_card_info WHERE gender = 'M' AND housing_type = 'With parents';

/*Please list the top five people having the highest income.*/
SELECT * FROM credit_card_info ORDER BY Annual_income DESC LIMIT 5;

/*How many married people are having bad credit?*/
SELECT COUNT(*) AS num_married_bad_credit FROM credit_card_info JOIN credit_card_label ON credit_card_info.ind_id = credit_card_label.ind_id WHERE credit_card_info.marital_status = 'Married' AND credit_card_label.label = 1;

/*What is the highest education level and what is the total count?*/
SELECT education, COUNT(*) AS total_count FROM credit_card_info GROUP BY education ORDER BY total_count DESC LIMIT 1;

/*Between married males and females, who is having more bad credit? */
SELECT gender, marital_status, COUNT(*) AS num_bad_credit FROM credit_card_info JOIN credit_card_label ON credit_card_info.ind_id = credit_card_label.ind_id WHERE credit_card_label.label = 1 GROUP BY gender, marital_status;



