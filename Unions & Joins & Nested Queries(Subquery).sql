==Unions;
-- Finda a list of employee and branch names

SELECT supplier_name FROM branch_supplier
UNION
SELECT client_name FROM client;

-- Find a list of all money spent or earned by a company
SELECT SUM(salary) AS money_spent
FROM employee
UNION
SELECT SUM(total_sales) AS money_earned
FROM works_with;

===Joins;
INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL); 
SELECT * FROM branch;

--Find all branches and the names of their managers (JOIN=INNER JOIN)
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- Find employees who both manage and branch and which branch. (LEFT JOIN)
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

--Find all branch both with and without managers
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

===Nested Queries;
--Find names of all employees who have sold
--over 30,000 to a single client

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

--Find all clients who are handled by the branch 
--that Michael Scott manages
--Assume you know Michael's ID

SELECT client.client_id, client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
);



