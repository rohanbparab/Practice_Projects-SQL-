use mavenmovies;

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

SELECT
	first_name,
    last_name,
    email,
    store_id
FROM staff;







/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 


SELECT store_id, 
		COUNT(inventory_id) AS Count_of_inventory_items 
FROM inventory
GROUP BY store_id;







/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/

SELECT store_id, 
	   COUNT(customer_id) AS Active_Customers
FROM customer
WHERE active = 1
GROUP BY 
	store_id;


/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/


SELECT 
	COUNT(email) AS Customer_email_addresses
FROM customer;




/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/


SELECT
	store_id,
	COUNT(DISTINCT film_id) AS Unique_films 
FROM inventory
GROUP BY store_id;


SELECT 
	COUNT(DISTINCT category_id) AS Unique_categories
FROM category;








/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

SELECT MIN(replacement_cost) AS Minimum_Replacement_Cost,
	   MAX(replacement_cost) AS Maximum_Replacement_Cost, 
       ROUND(AVG(replacement_cost),2) AS Average_Replacement_Cost
FROM film;







/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/


SELECT 
	ROUND(AVG(amount),2) AS Average_Payment_Processed,
	MAX(amount) AS Maximum_Payment_Processed
FROM payment;







/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

SELECT customer_id, 
	   COUNT(rental_id) AS count_of_rentals
FROM rental
GROUP BY 
	customer_id
ORDER BY 
	COUNT(rental_id) DESC;



