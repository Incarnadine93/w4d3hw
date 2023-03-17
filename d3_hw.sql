-- 1. List all customers who live in Texas (use JOINs)
--5
SELECT first_name, last_name, district
FROM address
left JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full Name
-- Peter Menard is our favorite customer
SELECT first_name, last_name, amount
FROM payment
left JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99


-- 3. Show all customers names who have made payments over $175(use  subqueries)
-- They don't exist
SELECT first_name, last_name, amount
FROM payment
left JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 175


-- 4. List all customers that live in Nepal (use the city table)
-- None
SELECT city, first_name, last_name
FROM address
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE city = 'Nepal'


-- 5. Which staff member had the most transactions?
-- Staff_id 1
SELECT staff_id, COUNT(staff_id)
from rental
GROUP BY staff_id
LIMIT 1;


-- 6. How many movies of each rating are there?
-- A lot
SELECT rating, count(title)
from film
GROUP BY rating
order by count(title) DESC;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--0 customers
SELECT first_name, last_name, amount
FROM customer
left JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99

-- 8. How many free rentals did our stores give away?
--14,574 rentals we lost money
SELECT COUNT(amount)
FROM payment
WHERE amount < '0'
--0 were given away for "free"(0)
SELECT COUNT(amount)
FROM payment
WHERE amount = '0'