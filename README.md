<H1>UCF Data Vizualization - ETL Project</H1>

<p>This project demostrates the team's ability to extract Census, School Grade and Zillow House Value Index (zhvi) datasets, transform that data using pandas dataframes/fuctions and then load the cleaned dataframes into three separate database tables. We decided to use a relational database in Postgres to load our data. Relational database made more sense since the datasets were from three separate sources sharing the same primary key (zip_code). This enabled us to easily join datasets from each of the three tables.</p>
<p>There were some adjustments done in SQL to help with school grade scores because the grade letters (A, B, C, etc) could not be used in aggregate SQL function.</p>

<br>
<H2>Team Members:</H2>
	<p>Dinh Duong, Joe Dahruj and Eduardo Panneflek</p>

<br>

<H2>Questions:</H2>
	<ul>
	<p><b>Question 1</b>: Does average household income affect the quality of schools?<p>
	<p><b>Question 2</b>: Bottom versus Top household income grade score average<p>
	<p><b>Question 3</b>: Bottom versus Top household income prices<p>
	<p><b>Question 4</b>: Bottom versus top average grade scores by city<p>
	</ul>	
<br>

<H2>How to run the project:</H2>
  	<ul>
	<p><b>Step 1.</b> Git pull the project into your working directory</p>
  	<p><b>Step 2.</b> Take the config.py in data/config.py and add your db_username and db_password, save it and put that in the root directory</p>
  	<p><b>Step 3.</b> Run etl_merged.ipynb to get tables census_data, school_grades and zillow_housing_value_index tables loaded</p>
  	<p><b>Step 4.</b> Execute database queries found in etl_database_queries.sql</p>
	</ul>

<br>

<H2>ETL Process:</H2>
	<ul>
	<p><b>Extract:</b> We used the datasets from our Project 1. We had CSV datasets for census data, school grades and zillow house value index. Using SQLAlchemy and Pandas we extracted columns from our CSV datasets specfically for 2017. This included, household income, school grades and house prices by zip code to name a few.</p>
	<p><b>Transform:</b> Additional columns were required for average, min and max for zhvi and rates for census data. We cleaned the data to only use 2017 data and making the column names follow the lowercase/underscore format.</p>
	<p><b>Load:</b> After cleaning up the census data, school grades and zhvi and associating these into respective dataframes, we used SQLAlchemy create_engine and db methods to get our dataframes loaded into Postres database tables. Then it was just a matter of experimenting with various SQL queries to answer our questions.</p>
	</ul>

<br>

<H2>Learnings:</H2>
	<ul>
		<li>Using config.py and gitignore in a project to not disclose database passwords.</li>		
		<li>The use of a case statement in SQL to update an additional column.</li>
		<li>Creating a database using SQLAlchemy db method.</li>
		<li>Individually working on a dataset and then merging that into the one database.</li>
	</ul>
<br>
<br>


# Guidelines for ETL Project

This document contains guidelines, requirements, and suggestions for Project 1.

## Team Effort

Due to the short timeline, teamwork will be crucial to the success of this project! Work closely with your team through all phases of the project to ensure that there are no surprises at the end of the week.

Working in a group enables you to tackle more difficult problems than you'd be able to working alone. In other words, working in a group allows you to **work smart** and **dream big**. Take advantage of it!

## Project Proposal

Before you start writing any code, remember that you only have one week to complete this project. View this project as a typical assignment from work. Imagine a bunch of data came in and you and your team are tasked with migrating it to a production data base.

Take advantage of your Instructor and TA support during office hours and class project work time. They are a valuable resource and can help you stay on track.

## Finding Data

Your project must use 2 or more sources of data. We recommend the following sites to use as sources of data:

* [data.world](https://data.world/)

* [Kaggle](https://www.kaggle.com/)

You can also use APIs or data scraped from the web. However, get approval from your instructor first. Again, there is only a week to complete this!

## Data Cleanup & Analysis

Once you have identified your datasets, perform ETL on the data. Make sure to plan and document the following:

* The sources of data that you will extract from.

* The type of transformation needed for this data (cleaning, joining, filtering, aggregating, etc).

* The type of final production database to load the data into (relational or non-relational).

* The final tables or collections that will be used in the production database.

You will be required to submit a final technical report with the above information and steps required to reproduce your ETL process.

## Project Report

At the end of the week, your team will submit a Final Report that describes the following:

* **E**xtract: your original data sources and how the data was formatted (CSV, JSON, pgAdmin 4, etc).

* **T**ransform: what data cleaning or transformation was required.

* **L**oad: the final database, tables/collections, and why this was chosen.

Please upload the report to Github and submit a link to Bootcampspot.

- - -

### Copyright

Coding Boot Camp © 2019. All Rights Reserved.
