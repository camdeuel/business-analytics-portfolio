-- Query 1

SELECT
actor.last_name as "Last Name",
actor.first_name as "First Name",
count(film.film_id) as "Films Been in"
from
sakila.actor
inner join
sakila.film_actor on actor.actor_id = film_actor.actor_id
inner join
sakila.film on film_actor.film_id = film.film_id
group by
actor.actor_id
order by
actor.last_name,
actor.first_name;


-- Query 2

SELECT
store.store_id as "Store",
count(inventory.film_id) as "Store's films",
sum(film.replacement_cost) as "Cost of Replacement"
FROM
sakila.store
INNER JOIN
sakila.inventory on store.store_id = inventory.store_id
INNER JOIN
sakila.film on inventory.film_id = film.film_id
GROUP BY
store.store_id;



-- Query 3

SELECT
category.name as "Category",
count(film_category.category_id) as "Films in Category",
sum(payment.amount) as "Total Revenue",
sum(payment.amount) / count(film_category.category_id) as "Average Revenue per Film"
FROM
sakila.category
INNER JOIN
sakila.film_category on category.category_id = film_category.category_id
INNER JOIN
sakila.film on film_category.film_id = film.film_id
INNER JOIN
sakila.inventory on film.film_id = inventory.film_id
INNER JOIN
sakila.rental on inventory.inventory_id = rental.inventory_id
INNER JOIN
sakila.payment on rental.rental_id = payment.rental_id
GROUP BY
category.name
ORDER BY
sum(payment.amount) / count(film_category.category_id) desc;


-- Query 4

SELECT
store.store_id as "Store Number",
count(rental.rental_id) as "Total Rentals",
sum(payment.amount) as "Total Payments",
sum(film.rental_rate) as "Expected Rental Amounts",
sum(payment.amount) - sum(film.rental_rate) as "Difference Between Payments and Expected Rental Amounts"
FROM
sakila.store
INNER JOIN
sakila.inventory on store.store_id = inventory.store_id
INNER JOIN
sakila.rental on inventory.inventory_id = rental.inventory_id
INNER JOIN
sakila.payment on rental.rental_id = payment.rental_id
INNER JOIN
sakila.film on inventory.film_id = film.film_id
GROUP BY
store.store_id
ORDER BY
store.store_id;


-- Query 5

SELECT
country.country as "Country",
count(customer.customer_id) as "Number of Customers"
FROM
sakila.customer
INNER JOIN
sakila.address on customer.address_id = address.address_id
INNER JOIN
sakila.city on address.city_id = city.city_id
INNER JOIN
sakila.country on city.country_id = country.country_id
WHERE
country.country <> "United States"
GROUP BY
country.country
HAVING
count(customer.customer_id) >= 10
ORDER BY
count(customer.customer_id) desc;


