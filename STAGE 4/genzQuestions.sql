USE genzdataset;

SHOW Tables;

select * from manager_aspirations;
select * from learning_aspirations;
select * from mission_aspirations;
select * from personalized_info;




/* Q1: How many males have responded to the survey from India */
SELECT COUNT(Gender) AS Male_Count 
FROM personalized_info
WHERE Gender LIKE 'Male%' AND CurrentCountry LIKE 'India%';

/* Q2: How many females have responded to the survey from India */
SELECT COUNT(*) AS female_Count
FROM personalized_info
WHERE GENDER LIKE 'Female%' AND CurrentCountry LIKE 'India%' ; 

/* Q3: How many of the Gen Z are influenced by their parents in regards to the career choices in India */
SELECT COUNT(learning_aspirations.ResponseID) AS Genz_influenced_By_parents 
FROM learning_aspirations 
INNER JOIN personalized_info  ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%';

/* Q4: How many of the Male Gen Z are influenced by their parents in regards to the career choices in India */
SELECT COUNT(learning_aspirations.ResponseID) AS Male_Genz_influenced_By_parents 
FROM learning_aspirations 
INNER JOIN personalized_info  ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%' AND Gender LIKE 'Male%';


/* Q5: How many of the female Gen Z are influenced by their parents in regards to the career choices from India */
SELECT COUNT(learning_aspirations.ResponseID) AS Female_Genz_influenced_By_parents 
FROM learning_aspirations 
INNER JOIN personalized_info  ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%' AND Gender LIKE 'Female%';

/* Q6: How many of the Male and Female Gen Z (individually display in 2 columns )are influenced by their parents in regards to the career choices from India */
SELECT 
SUM(CASE WHEN Gender LIKE 'Male%' THEN 1 ELSE 0 END) AS Male_Genz_influenced_By_parents,
SUM(CASE WHEN Gender LIKE 'Female%' THEN 1 ELSE 0 END) AS Female_Genz_influenced_By_parents
FROM learning_aspirations INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'My Parents%' AND CurrentCountry LIKE 'India%';


/* Q7: How many  Gen Z are influenced by media and Influencers together in India */
SELECT COUNT(learning_aspirations.ResponseID) AS Genz_influenced_By_InfluencersAndMedia 
FROM learning_aspirations 
INNER JOIN personalized_info  ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'Influencers%' AND 'Social Media%' AND CurrentCountry LIKE 'India%';

/* Q8: How many  Gen Z are influenced by media and Influencers together in India */
SELECT 
SUM(CASE WHEN Gender LIKE 'Male%' THEN 1 ELSE 0 END) AS Male_Genz_influenced_By_InfluencersAndMedia,
SUM(CASE WHEN Gender LIKE 'Female%' THEN 1 ELSE 0 END) AS Female_Genz_influenced_By_InfluencersAndMedia
FROM learning_aspirations INNER JOIN personalized_info ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE CareerInfluenceFactor LIKE 'Influencers%' AND 'Social Media%' AND CurrentCountry LIKE 'India%';

/* Q9: How many of the Gen Z who are influenced by Social media are looking to go abroad */
SELECT COUNT(learning_aspirations.ResponseID) AS Genz_InfluencedBy_Media_goingAbroad
FROM learning_aspirations
WHERE CareerInfluenceFactor LIKE 'Social Media%' AND HigherEducationAbroad LIKE 'Yes%' ;

/* Q10: How many of the Gen Z who are influenced by People in their circle for career aspiration are looking to go abroad */
SELECT SUM(CASE WHEN CareerInfluenceFactor LIKE 'People from my circle' AND HigherEducationAbroad LIKE 'Yes%'  THen 1 ELSE 0 END) AS Genz_influencedBy_People_goingAbroad
FROM learning_aspirations;
