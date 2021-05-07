--1)La base de données ne contient actuellement que des employés en postes. Il a été choisi de garder en base une liste des anciens collaborateurs de l'entreprise parti en retraite. Il va donc vous falloir ajouter une ligne dans la table posts pour référencer les employés à la retraite.
INSERT into posts (pos_libelle) 
VALUES ('retraité')

--2)Modifié le poste de Madame HANAH entant que retraité:

update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité') 
WHERE emp_lastname='HANNAH' 
AND emp_firstname='Amity';

--3)Ecrire les requêtes correspondant à ces opéarations
--Trouver les employers de Arras:

SELECT * FROM `employees` WHERE emp_city = 'Arras'

--=-- AMAR Yann seras celui qui succederas à HANAH Amity --=--

--5) changer le poste de de l'employé de pépiniériste a manager:
UPDATE employees
set emp_pos_id = '2'
where emp_id = 7

--6) modifier de + 5 % le salare de AMAR Yann:

UPDATE employees 
set emp_salary = emp_salary * 1.05
where emp_id = 7

--7) anciens collègues pépiniéristes passent sous sa direction.

UPDATE employees 
set emp_superior_id = 7
WHERE emp_pos_id = 14

--8) écrire la transaction

START transaction;
INSERT INTO posts (pos_libelle) VALUES ('retraité');
update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité') 
WHERE emp_lastname='HANNAH' 
AND emp_firstname='Amity';
SELECT * FROM `employees` WHERE emp_city = 'Arras';
UPDATE employees
set emp_pos_id = '2'
where emp_id = 7;
UPDATE employees 
set emp_salary = emp_salary * 1.05
where emp_id = 7;
UPDATE employees 
set emp_superior_id = 7
WHERE emp_pos_id = 14;

commit




