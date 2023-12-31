--  Ben Nguyen

Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you 
profile and understand the data just like a data scientist would. For this first part of the assignment, 
you will be assessed both on the correctness of your findings, as well as the code you used to arrive at 
your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and 
comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of 
the data for a particular research question you want to answer. You will be required to prepare the dataset 
for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your 
code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, 
and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that 
your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, 
Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other 
page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
    Select  Count(*)
    From    tablelist

i.      Attribute table =   10000
ii.     Business table =    10000
iii.    Category table =    10000
iv.     Checkin table =     10000
v.      elite_years table = 10000
vi.     friend table =      10000
vii.    hours table =       10000
viii.   photo table =       10000
ix.     review table =      10000
x.      tip table =         10000
xi.     user table =        10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign 
keys are listed in the table, please specify which foreign key.

    SELECT  COUNT(DISTINCT(key))
	FROM    tablelist

i.      Attribute table:    business_id = 1115
ii.     Business table:     id = 10000
iii.    Category table:     business_id = 2643
iv.     Checkin table:      business_id = 493
v.      elite_years table:  user_id = 2780
vi.     friend table:       user_id = 11
vii.    hours table:        business_id = 1562
viii.   photo table:        id = 10000
ix.     review table:       id = 10000
x.      tip table:          user_id = 537
xi.     user table:         id = 10000

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: "no."
	
	
	SQL code used to arrive at answer:
	
	SELECT      COUNT(*)
	FROM        user
	WHERE       id IS NULL OR 
		        name IS NULL OR 
		        review_count IS NULL OR 
		        yelping_since IS NULL OR
		        useful IS NULL OR 
		        funny IS NULL OR 
		        cool IS NULL OR 
		        fans IS NULL OR 
		        average_stars IS NULL OR 
		        compliment_hot IS NULL OR 
		        compliment_more IS NULL OR 
		        compliment_profile IS NULL OR 
		        compliment_cute IS NULL OR 
		        compliment_list IS NULL OR 
		        compliment_note IS NULL OR 
		        compliment_plain IS NULL OR 
		        compliment_cool IS NULL OR 
		        compliment_funny IS NULL OR 
		        compliment_writer IS NULL OR 
		        compliment_photos IS NULL 

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average 
(mean) value for the following fields:

    SQL:    SELECT AVG(column)
		    FROM tablelist

            SELECT min(column)
		    FROM tablelist

            SELECT max(column)
		    FROM tablelist

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		    avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1 		max: 5		    avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		    avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		    avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

        SELECT  city,
			    SUM(review_count) AS reviews
	    FROM business
	    GROUP BY city
	    ORDER BY reviews DESC
	
	Copy and Paste the Result Below:
	
	    +-----------------+---------+
		| city            | reviews |
		+-----------------+---------+
		| Las Vegas       |   82854 |
		| Phoenix         |   34503 |
		| Toronto         |   24113 |
		| Scottsdale      |   20614 |
		| Charlotte       |   12523 |
		| Henderson       |   10871 |
		| Tempe           |   10504 |
		| Pittsburgh      |    9798 |
		| Montréal        |    9448 |
		| Chandler        |    8112 |
		| Mesa            |    6875 |
		| Gilbert         |    6380 |
		| Cleveland       |    5593 |
		| Madison         |    5265 |
		| Glendale        |    4406 |
		| Mississauga     |    3814 |
		| Edinburgh       |    2792 |
		| Peoria          |    2624 |
		| North Las Vegas |    2438 |
		| Markham         |    2352 |
		| Champaign       |    2029 |
		| Stuttgart       |    1849 |
		| Surprise        |    1520 |
		| Lakewood        |    1465 |
		| Goodyear        |    1155 |
		+-----------------+---------+
	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT  stars,
		SUM(review_count) AS count
FROM    business
WHERE   city == 'Avon'
GROUP BY stars	

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

			+-------+-------+
			| stars | count |
			+-------+-------+
			|   1.5 |    10 |
			|   2.5 |     6 |
			|   3.5 |    88 |
			|   4.0 |    21 |
			|   4.5 |    31 |
			|   5.0 |     3 |
			+-------+-------+	
	

ii. Beachwood

SQL code used to arrive at answer:

	SELECT  stars,
			SUM(review_count) AS count
    FROM    business
	WHERE   city == 'Beachwood'
	GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
		
			+-------+-------+
			| stars | count |
			+-------+-------+
			|   2.0 |     8 |
			|   2.5 |     3 |
			|   3.0 |    11 |
			|   3.5 |     6 |
			|   4.0 |    69 |
			|   4.5 |    17 |
			|   5.0 |    23 |
			+-------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
		SELECT  id,
			    name,
			    review_count
		FROM    user
		ORDER BY review_count DESC
		LIMIT 3	

	Copy and Paste the Result Below:
		
		+------------------------+--------+--------------+
		| id                     | name   | review_count |
		+------------------------+--------+--------------+
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
		| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
		| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
		+------------------------+--------+--------------+

8. Does posing more reviews correlate with more fans?

    Yes, The longer they have been yelping the more reviews they give has a higher fan count.

	Please explain your findings and interpretation of the results:
	
		SELECT id,
			   name,
			   review_count,
			   fans,
			   yelping_since
		FROM user
		ORDER BY fans DESC

		+------------------------+-----------+--------------+------+---------------------+
		| id                     | name      | review_count | fans | yelping_since       |
		+------------------------+-----------+--------------+------+---------------------+
		| -9I98YbNQnLdAmcYfb324Q | Amy       |          609 |  503 | 2007-07-19 00:00:00 |
		| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
		| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 | 2012-11-27 00:00:00 |
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 | 2012-12-16 00:00:00 |
		| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 | 2009-07-08 00:00:00 |
		| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 | 2009-10-05 00:00:00 |
		| -9bbDysuiWeo2VShFJJtcw | Cat       |          377 |  133 | 2009-02-05 00:00:00 |
		| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 | 2015-02-19 00:00:00 |
		| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 | 2012-04-05 00:00:00 |
		| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 | 2007-08-14 00:00:00 |
		| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 | 2009-05-31 00:00:00 |
		| -DmqnhW4Omr3YhmnigaqHg | Tiffany   |          408 |  111 | 2008-10-28 00:00:00 |
		| -cv9PPT7IHux7XUc9dOpkg | bernice   |          255 |  105 | 2007-08-29 00:00:00 |
		| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 | 2006-03-28 00:00:00 |
		| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 | 2010-10-01 00:00:00 |
		| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 | 2006-07-19 00:00:00 |
		| -4viTt9UC44lWCFJwleMNQ | Ben       |          307 |   96 | 2007-03-10 00:00:00 |
		| -3i9bhfvrM3F1wsC9XIB8g | Linda     |          584 |   89 | 2005-08-07 00:00:00 |
		| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 | 2012-10-08 00:00:00 |
		| -ePh4Prox7ZXnEBNGKyUEA | Jessica   |          220 |   84 | 2009-01-12 00:00:00 |
		| -4BEUkLvHQntN6qPfKJP2w | Greg      |          408 |   81 | 2008-02-16 00:00:00 |
		| -C-l8EHSLXtZZVfUAUhsPA | Nieves    |          178 |   80 | 2013-07-08 00:00:00 |
		| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 | 2009-09-07 00:00:00 |
		| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 | 2008-01-03 00:00:00 |
		| -0zEEaDFIjABtPQni0XlHA | Nicole    |          161 |   73 | 2009-04-30 00:00:00 |
		+------------------------+-----------+--------------+------+---------------------+
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: love has 1780, while hate has 232 only
        
	
	SQL code used to arrive at answer:

	    Select Count(*)
        From review
        Where text like "%love%"

        Select Count(*)
        From review
        Where text like "%hate%"
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
    	SELECT  id,
			    name,
			    fans
		FROM    user
		ORDER BY fans DESC
		LIMIT 10
	
	Copy and Paste the Result Below:

		+------------------------+-----------+------+
		| id                     | name      | fans |
		+------------------------+-----------+------+
		| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
		| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
		| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
		| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
		| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
		| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
		| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
		| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
		| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
		| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
		+------------------------+-----------+------+
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their 
overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the 
following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?

		The 4-5 star group seems to have shorter hours then the 2-3 star group. All the 4-5-star Shopping locations
		close before 5PM. However, 2-3-star Shopping Locations close at 10PM. The query only returns 3 
		businesses, not a good sample for analysis.

ii. Do the two groups you chose to analyze have a different number of reviews?
         
         Red Rock Canyon Visitor Center with 4-5 star rating has a lot more reviews than Walgreens and 
		 Red Rock Canyon Visitor Center because of the type of business.

iii. Are you able to infer anything from the location data provided between these two groups? Explain.

		No. There are only 3 businesses and all of them are in different zip codes.

SQL code used for analysis:

		SELECT 	business.name,
			   	business.review_count,
			   	hours.hours,
			   	business.postal_code,
			   	CASE
				  	WHEN hours LIKE "%monday%" THEN 1
				  	WHEN hours LIKE "%tuesday%" THEN 2
				  	WHEN hours LIKE "%wednesday%" THEN 3
				  	WHEN hours LIKE "%thursday%" THEN 4
				  	WHEN hours LIKE "%friday%" THEN 5
				  	WHEN hours LIKE "%saturday%" THEN 6
				  	WHEN hours LIKE "%sunday%" THEN 7
			   	END AS days,
			   	CASE
				  	WHEN business.stars BETWEEN 2 AND 3 THEN '2-3 stars'
				  	WHEN business.stars BETWEEN 4 AND 5 THEN '4-5 stars'
			   	END AS rating
		FROM business INNER JOIN hours
		ON business.id = hours.business_id
		INNER JOIN category
		ON category.business_id = business.id
		WHERE (business.city == 'Las Vegas'
		AND
		category.category LIKE 'Shopping')
		AND
		(business.stars BETWEEN 2 AND 3
		OR
		business.stars BETWEEN 4 AND 5)
		GROUP BY stars,days
		ORDER BY days,rating ASC
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you 
find between the ones that are still open and the ones that are closed? List at least two differences and 
the SQL code you used to arrive at your answer.
		
i. Difference 1:
         
		It can be easily seen that the open businesses have more review counts than the closed one.
         
ii. Difference 2:
         
         The open businesses only have the average star rating slightly above the closed one.
         
SQL code used for analysis:

		SELECT COUNT(DISTINCT(id)),
			   AVG(review_count),
			   SUM(review_count),
			   AVG(stars),
			   is_open
		FROM business
		GROUP BY is_open

+---------------------+-------------------+-------------------+---------------+---------+
| COUNT(DISTINCT(id)) | AVG(review_count) | SUM(review_count) |    AVG(stars) | is_open |
+---------------------+-------------------+-------------------+---------------+---------+
|                1520 |     23.1980263158 |             35261 | 3.52039473684 |       0 |
|                8480 |     31.7570754717 |            269300 | 3.67900943396 |       1 |
+---------------------+-------------------+-------------------+---------------+---------+
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on 
the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering 
businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, 
predicting the number of fans a user will have, and so on. These are just a few examples to get you started, 
so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, 
to all of the following:
	
i. Indicate the type of analysis you chose to do:
         
		Compare the number of business open status from different states based on the rating
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

		To compare the quality of the restaurants from states to states, I take the count(distinct) from the 
		id column in business table as the number of the restaurants. I defined the rating as (1) 2 and below as
		C Rating, (2) 4 and below as B rating and (3) more than 4 as A rating. 

		The Rating is divided into 3 types: A, B and C, which was defined by the SQL code below. It can be see clearly
		that North Carolina and Nevada restaurants are all A rating, which is outstanding. 

iii. Output of your finished dataset:
         
+------------------------------+-------+---------+----------+
| count(distinct(business.id)) | state | is_open | Rating   |
+------------------------------+-------+---------+----------+
|                            2 | NC    |       0 | A Rating |
|                           11 | NC    |       1 | A Rating |
|                            4 | NV    |       0 | A Rating |
|                           18 | NV    |       1 | A Rating |
|                            2 | PA    |       0 | A Rating |
|                            5 | WI    |       1 | A Rating |
|                           48 | AZ    |       1 | B Rating |
|                            3 | BW    |       1 | B Rating |
|                            2 | EDH   |       0 | B Rating |
|                            3 | EDH   |       1 | B Rating |
|                            1 | HLD   |       1 | B Rating |
|                            1 | NI    |       0 | B Rating |
|                            2 | OH    |       0 | B Rating |
|                           20 | OH    |       1 | B Rating |
|                           35 | ON    |       1 | B Rating |
|                            5 | PA    |       1 | B Rating |
|                            1 | QC    |       0 | B Rating |
|                            3 | QC    |       1 | B Rating |
|                            1 | WI    |       0 | B Rating |
|                           12 | AZ    |       0 | C Rating |
|                            1 | IL    |       0 | C Rating |
|                            4 | ON    |       0 | C Rating |
+------------------------------+-------+---------+----------+
         
iv. Provide the SQL code you used to create your final dataset:

		Select 	count(distinct(business.id)),
				business.state,
				business.is_open,
				Case 
					When business.stars <=2 						Then 'C Rating'
					When business.stars >2 and business.stars <= 4 	Then 'B Rating'
					When business.stars >4 							Then 'A Rating'
				End As Rating
		From business
		Inner Join category 
		on business.id = category.business_id
		Group By State, is_open
		Order By Rating, State