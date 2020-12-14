SELECT
    hr.employees.first_name,
    hr.employees.last_name,
    hr.departments.department_name
FROM
         hr.employees
    INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id