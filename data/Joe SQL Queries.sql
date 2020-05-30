SELECT * FROM school_grades;
SELECT * FROM census_data;
SELECT * FROM zillow_house_value_index;

SELECT sg.grade_2017, sg.school_name, cd.household_income, zhvi."2017_zhvi_avg"
FROM "census_data" cd, "school_grades" sg, "zillow_house_value_index" zhvi 
WHERE cd.zip_code = sg.zip_code
AND sg.zip_code = zhvi.zip_code

SELECT cd.zip_code, sg.grade_2017, cd.unemployment_count, cd.poverty_rate
FROM "census_data" cd, "school_grades" sg
WHERE cd.zip_code = sg.zip_code
ORDER BY cd.unemployment_count DESC LIMIT 100;

SELECT cd.zip_code, sg.grade_2017, cd.unemployment_count, cd.poverty_rate
FROM "census_data" cd, "school_grades" sg
WHERE cd.zip_code = sg.zip_code
ORDER BY cd.poverty_rate ASC LIMIT 100;

