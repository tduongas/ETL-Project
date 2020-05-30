-- Query school_grades records
SELECT * FROM school_grades;

-- Add grade score 
ALTER TABLE public.school_grades ADD COLUMN grade_score_2017 integer;

-- Get one sample for update check purposes
SELECT * FROM school_grades WHERE zip_code = 32641;

-- Update one zip code first to see if this works out
UPDATE school_grades SET 
grade_score_2017 = (CASE WHEN grade_2017='A' THEN 6
            			 WHEN grade_2017='B' THEN 5
						 WHEN grade_2017='C' THEN 4
						 WHEN grade_2017='D' THEN 3
						 WHEN grade_2017='E' THEN 2
            			ELSE 1
       				END)
WHERE zip_code = 32641;

-- Works so now update all
UPDATE school_grades SET 
grade_score_2017 = (CASE WHEN grade_2017='A' THEN 6
            			 WHEN grade_2017='B' THEN 5
						 WHEN grade_2017='C' THEN 4
						 WHEN grade_2017='D' THEN 3
						 WHEN grade_2017='E' THEN 2
            			ELSE 1
       				END);

-- Query census_data records
SELECT * FROM census_data;

-- Query zillow_house_value_index records
SELECT * FROM zillow_house_value_index;

-- Show joining of the 3 tables
SELECT sg.grade_2017, sg.school_name, cd.household_income, zhvi."2017_zhvi_avg"
FROM "census_data" cd, "school_grades" sg, "zillow_house_value_index" zhvi 
WHERE cd.zip_code = sg.zip_code
AND sg.zip_code = zhvi.zip_code

-- Question: does average household income affect the quality of schools? Answer is yes from the query below
SELECT sg.grade_2017, ROUND(AVG(cd.household_income)) as "average_household_income"
FROM "census_data" cd, "school_grades" sg
WHERE cd.zip_code = sg.zip_code
GROUP BY sg.grade_2017
ORDER BY sg.grade_2017

-- Top five household income by zip code in Florida
SELECT * FROM census_data WHERE household_income > 0 ORDER BY household_income DESC LIMIT 5;

-- Bottom five household income by zip code in Florida
SELECT * FROM census_data WHERE household_income > 0 ORDER BY household_income ASC LIMIT 5;

-- Bottom household income by zip codes and school grades
SELECT cd.zip_code, sg.school_name, sg.grade_2017, cd.population, cd.household_income 
FROM "census_data" cd, "school_grades" sg 
WHERE cd.household_income > 0
AND cd.zip_code = sg.zip_code
ORDER BY cd.household_income ASC LIMIT 100;

-- TOP household income grade scores
SELECT ROUND(AVG(cd.household_income)) as "household_income", ROUND(AVG(sg.grade_score_2017),1) as "average_grade_score"
FROM "census_data" cd, "school_grades" sg 
WHERE cd.household_income > 0
AND cd.zip_code = sg.zip_code
GROUP BY cd.zip_code, cd.household_income
ORDER BY cd.household_income DESC LIMIT 100;

-- Bottom household income grade scores
SELECT ROUND(AVG(cd.household_income)) as "household_income", ROUND(AVG(sg.grade_score_2017),1) as "average_grade_score"
FROM "census_data" cd, "school_grades" sg 
WHERE cd.household_income > 0
AND cd.zip_code = sg.zip_code
GROUP BY cd.zip_code, cd.household_income
ORDER BY cd.household_income ASC LIMIT 100;


-- Top household income by zip codes and school grades
SELECT cd.zip_code, sg.school_name, sg.grade_2017, cd.population, cd.household_income 
FROM "census_data" cd, "school_grades" sg 
WHERE cd.household_income > 0
AND cd.zip_code = sg.zip_code
ORDER BY cd.household_income DESC LIMIT 100;

-- Top average house price by zip code
SELECT zip_code, city, ROUND("2017_zhvi_avg") as zhvi_avg 
FROM zillow_house_value_index ORDER BY "2017_zhvi_avg" DESC;

-- Bottom average house price by zip code
SELECT zip_code, city, ROUND("2017_zhvi_avg") as zhvi_avg
FROM zillow_house_value_index ORDER BY "2017_zhvi_avg" ASC;

-- Max house price by zip code
SELECT zip_code, city,"2017_zhvi_max" as zhvi_max
FROM zillow_house_value_index ORDER BY "2017_zhvi_max" DESC LIMIT 100;

-- Min house price by zip code
SELECT zip_code, city,"2017_zhvi_min" as zhvi_min
FROM zillow_house_value_index ORDER BY "2017_zhvi_min" ASC LIMIT 100;

-- Top average house price by zip code and their school grades
SELECT zhvi.zip_code, city, ROUND("2017_zhvi_avg") as zhvi_avg, 
sg.school_name, sg.grade_2017   
FROM "zillow_house_value_index" zhvi, "school_grades" sg 
WHERE zhvi.zip_code = sg.zip_code 
ORDER BY "2017_zhvi_avg" DESC;

-- Bottom average house price by zip code and their school grades
SELECT zhvi.zip_code, city, ROUND("2017_zhvi_avg") as zhvi_avg, 
sg.school_name, sg.grade_2017, sg.grade_score_2017   
FROM "zillow_house_value_index" zhvi, "school_grades" sg 
WHERE zhvi.zip_code = sg.zip_code 
ORDER BY "2017_zhvi_avg" ASC;


