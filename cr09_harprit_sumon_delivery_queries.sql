SELECT package.package_no, customer.customer_id FROM package JOIN customer on package.fk_customer = customer.customer_id;

SELECT customer.customer_id, customer.c_first_name, driver.d_first_name FROM customer, driver WHERE driver.d_first_name = 'Lukas';

