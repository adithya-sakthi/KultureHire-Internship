USE genzdataset;

SHOW tables;
select * from manager_aspirations;
select * from learning_aspirations;
select * from mission_aspirations;
select * from personalized_info;
SELECT DISTINCT(PreferredWorkSetup) FROM manager_aspirations;

/*Query 1*/
SELECT (COUNT(ResponseID) / (SELECT COUNT(*) FROM learning_Aspirations)) * 100 AS Percentage
FROM learning_Aspirations
WHERE PreferredWorkingEnvironment LIKE 'Every Day Office Environment%';

/*Query 2*/
SELECT ROUND((COUNT(ResponseID) / (SELECT COUNT(*) FROM learning_Aspirations)) * 100,2) AS Percentage
FROM learning_Aspirations
WHERE ClosestAspirationalCareer LIKE 'Business Operations%' AND CareerInfluenceFactor LIKE 'My Parents';

/*Query 3*/
SELECT 
     ROUND((COUNT(CASE WHEN p.gender like 'Male%' THEN 1 END) / COUNT(*)) * 100,2) AS Male_aspirants,
     ROUND((COUNT(CASE WHEN p.gender like 'Female%' THEN 1 END) / COUNT(*)) * 100,2) AS Female_aspirants
FROM personalized_info p
INNER JOIN learning_aspirations l
ON p.ResponseID = l.ResponseID
WHERE HigherEducationAbroad LIKE 'Yes%';

/*Query 4*/
SELECT 
     (COUNT(CASE WHEN p.gender like 'Male%' THEN 1 END) / COUNT(*)) * 100 AS Male_genz,
     (COUNT(CASE WHEN p.gender like 'Female%' THEN 1 END) / COUNT(*)) * 100 AS Female_genz
FROM personalized_info p
INNER JOIN mission_aspirations m
ON p.ResponseID = m.ResponseID
WHERE m.MisalignedMissionLikelihood LIKE 'Will work%';

SELECT 
     (COUNT(CASE WHEN p.gender like 'Male%' THEN 1 END) / COUNT(*)) * 100 AS Male_genz,
     (COUNT(CASE WHEN p.gender like 'Female%' THEN 1 END) / COUNT(*)) * 100 AS Female_genz
FROM personalized_info p
INNER JOIN mission_aspirations m
ON p.ResponseID = m.ResponseID
WHERE m.MisalignedMissionLikelihood LIKE 'Will not work%';

/*Query 5*/
SELECT DISTINCT(learning_aspirations.PreferredWorkingEnvironment)
FROM learning_aspirations
INNER JOIN personalized_info
ON learning_aspirations.ResponseID = personalized_info.ResponseID
WHERE personalized_info.Gender LIKE 'Female%';

/*Query 6*/
SELECT COUNT(CASE WHEN p.Gender LIKE 'Female%'THEN 1 END) AS female_genz
FROM personalized_info p 
INNER JOIN learning_aspirations l ON p.ResponseID = l.ResponseID
INNER JOIN mission_aspirations  m ON p.ResponseID = m.ResponseID
WHERE  m.NoSocialImpactLikelihood BETWEEN 1 AND 5;

/*Query 7*/
SELECT COUNT(p.ResponseID) AS Male_GenZ
FROM personalized_info p
INNER JOIN learning_aspirations l ON p.ResponseID = l.ResponseID
WHERE p.Gender LIKE 'Male%' AND l.CareerInfluenceFactor LIKE 'My Parents' 
AND l.HigherEducationAbroad LIKE 'Yes, I wil%';

/*Query 8*/
SELECT
    ROUND((COUNT(CASE WHEN p.Gender like 'Male%' THEN 1 END) / COUNT(*)) * 100, 2) AS Male_aspirants,
    ROUND((COUNT(CASE WHEN p.Gender like 'Female%' THEN 1 END) / COUNT(*)) * 100, 2) AS Female_aspirants
FROM Personalized_info p
INNER JOIN mission_aspirations m ON p.ResponseID=m.ResponseID
INNER JOIN learning_aspirations l ON p.ResponseID=l.ResponseID
WHERE m.NoSocialImpactLikelihood BETWEEN 8 AND 10
AND l.HigherEducationAbroad like 'Yes%';

/*Query 9*/
-- Overall count of genz who prefer to work with team
SELECT COUNT(CASE WHEN p.Gender LIKE 'male%' THEN 1 END) AS male_genz,
	   COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) AS female_genz,
       COUNT(CASE WHEN p.Gender LIKE 'transgender%' THEN 1 END) AS trans_genz
FROM personalized_info p
INNER JOIN manager_aspirations m ON p.ResponseID = m.ResponseID
WHERE m.PreferredWorkSetup LIKE '%team%';

-- Overall percentage of genz who prefer to work with team
SELECT ROUND((COUNT(CASE WHEN p.Gender LIKE 'male%' THEN 1 END) / COUNT(*)) * 100,2) AS male_percentage,
       ROUND((COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) / COUNT(*)) * 100,2) AS female_percentage,
       ROUND((COUNT(CASE WHEN p.Gender LIKE 'transgender%' THEN 1 END) / COUNT(*)) * 100,2) AS trans_percentage
FROM personalized_info p
INNER JOIN manager_aspirations m ON p.ResponseID = m.ResponseID
WHERE m.PreferredWorkSetup LIKE '%team%';

/*Query 10*/
SELECT p.gender,m.WorkLikelihood3Years
FROM manager_aspirations m
INNER JOIN personalized_info p ON p.ResponseID = m.ResponseID;

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_will_work
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'Will work%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_will_be_hard
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'This will%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_No_way
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'No way'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Female_No_way_crazy
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Female%' AND ma.WorkLikelihood3Years LIKE 'No way%'; 

/* Now for Male */
SELECT COUNT(ma.WorkLikelihood3Years) AS Male_will_work
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'Will work%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_will_be_hard
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'This will%'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_No_way
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'No way'; 

SELECT COUNT(ma.WorkLikelihood3Years) AS Male_No_way_crazy
FROM manager_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID
WHERE p.Gender LIKE 'Male%' AND ma.WorkLikelihood3Years LIKE 'No way%'; 

/*Query 11*/
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary3Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary_3years_mark
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/*Query 12*/
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary5Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary_5years_mark
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/*Query 13*/
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary3Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary_3years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/* Query 14 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary5Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary_5years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
GROUP BY p.Gender;

/* Query 15 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary3Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary_3years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;

/* Query 16 */
SELECT p.Gender,
    AVG(CAST(SUBSTRING_INDEX(ExpectedSalary5Years, 'k', 1) AS SIGNED)) AS Avg_Starting_Salary_5years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;

/*Query 17*/
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary3Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary_3years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;

/* Query 18 */
SELECT p.Gender,
       AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ExpectedSalary5Years,'to',-1),'k',1) AS SIGNED)) AS Avg_Higherbar_Salary_5years
FROM personalized_info p
INNER JOIN mission_aspirations m2 
ON p.ResponseID = m2.ResponseID
WHERE p.CurrentCountry LIKE 'India%'
GROUP BY p.Gender;

/* Query 19 */
-- people who will work for companies even if the mission is misaligned
SELECT 
     COUNT(CASE WHEN p.Gender LIKE 'Male%' THEN 1 END) AS Male_GenZ,
     COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) AS Female_GenZ
FROM mission_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID 
WHERE p.CurrentCountry LIKE 'India%' AND ma.MisalignedMissionLikelihood LIKE 'Will work%';

-- people who will not work for companies whose mission is misaligned     
SELECT 
     COUNT(CASE WHEN p.Gender LIKE 'Male%' THEN 1 END) AS Male_GenZ,
     COUNT(CASE WHEN p.Gender LIKE 'Female%' THEN 1 END) AS Female_GenZ
FROM mission_aspirations ma
INNER JOIN personalized_info p ON ma.ResponseID = p.ResponseID 
WHERE p.CurrentCountry LIKE 'India%' AND ma.MisalignedMissionLikelihood LIKE 'Will NOT%';