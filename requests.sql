-- 1. Вивести вміст таблиці палат.
--SELECT * FROM WARDS

-- 2. Вивести прізвища та телефони усіх лікарів.
--SELECT Surname, Phone
--FROM Doctors

-- 3. Вивести усі поверхи без повторень, де розміщуються палати.
--SELECT DISTINCT Floor
--FROM Wards

-- 4. Вивести назви захворювань під назвою « Name of
-- Disease» та ступінь їхньої тяжкості під назвою «Severity
-- of Disease».
--SELECT Name AS "Name of Disease", Severity AS "Severity of Disease"
--FROM Diseases

-- 5. Вивести назви відділень, які знаходяться у корпусі 5
-- з фондом фінансування меншим, ніж 30000.
-- SELECT Name
-- FROM Departments
-- WHERE Building = 5 AND Financing < 30000

-- 6. Вивести назви відділень, які знаходяться у корпусі 3 з
-- фондом фінансування у діапазоні від 12000 до 15000.
-- SELECT Name
-- FROM Departments
-- WHERE Building = 5 AND Financing BETWEEN 12000 AND 15000

-- 8. Вивести назви палат, які знаходяться у корпусах 4 та
-- 5 на 1-му поверсі.
-- SELECT Name
-- FROM Wards
-- WHERE (Building = 5 OR Building = 4) AND Floor = 1


-- 9. Вивести назви, корпуси та фонди фінансування відділень, які знаходяться у корпусах 3 або 6 та мають
-- фонд фінансування менший, ніж 11000 або більший
-- за 25000.
-- SELECT Name, Building, Financing
-- FROM Departments
-- WHERE (Building = 3 OR Building = 6) AND (Financing < 11000 OR Financing > 25000)

-- 10. Вивести прізвища лікарів, зарплата (сума ставки та
-- надбавки 120) яких перевищує 1500.
-- SELECT Surname
-- FROM Doctors
-- WHERE Salary + 120 > 1500

-- 11. Вивести прізвища лікарів, у яких половина зарплати
-- перевищує триразову надбавку у вигляді 500.
-- SELECT Surname
-- FROM Doctors
-- WHERE Salary / 2 > 500 * 3

-- 12. Вивести назви обстежень без повторень, які проводяться у перші три дні тижня з 12:00 до 15:00.
-- SELECT DISTINCT Name
-- FROM Examinations
-- WHERE DayOfWeek IN (1, 2, 3) AND StartTime >= '12:00' AND EndTime <= '15:00'

-- 13. Вивести назви та номери корпусів відділень, які знаходяться у корпусах 1, 3, 8 або 10.
-- SELECT Name, Id
-- FROM Departments
-- WHERE Building IN (1, 3, 8, 10)

-- 14. Вивести назви захворювань усіх ступенів тяжкості,
-- крім 1-го та 2-го.
-- SELECT Name
-- FROM Diseases
-- WHERE Severity NOT IN (1, 2)

-- 15. Вивести назви відділень, які не знаходяться у
-- першому або третьому корпусі.
-- SELECT Name
-- FROM Departments
-- WHERE Building NOT IN (1, 3)

-- 16. Вивести назви відділень, які знаходяться у першому
-- або третьому корпусі.
-- SELECT Name
-- FROM Departments
-- WHERE Building IN (1, 3)

-- 17. Вивести прізвища лікарів, що починаються з літери «N»
SELECT Surname
FROM Doctors
WHERE Surname LIKE 'С%'
