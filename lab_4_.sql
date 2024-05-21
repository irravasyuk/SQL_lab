-- 1. Виведіть повні імена лікарів та їх спеціалізації.
-- SELECT DOCTORS.SURNAME, DOCTORS.NAME, SPECIALIZATIONS.NAME
-- FROM DoctorsSpecializations
-- JOIN DOCTORS ON DoctorsSpecializations.DoctorId = DOCTORS.Id
-- JOIN SPECIALIZATIONS ON DoctorsSpecializations.SpecializationId = SPECIALIZATIONS.Id;

-- 2. Виведіть прізвища та зарплати (сума ставки та надбавки) лікарів, які не перебувають у відпустці.
-- SELECT DOCTORS.SURNAME, (DOCTORS.SALARY + DOCTORS.PREMIUM) AS TOTAL
-- FROM DOCTORS
-- WHERE DOCTORS.Id NOT IN (SELECT DoctorId 
-- 						 FROM VACATIONS 
-- 						 WHERE CURRENT_DATE BETWEEN StartDate AND EndDate
-- 						);


-- 3. Виведіть назви палат, які знаходяться у відділенні «Intensive Treatment».
-- SELECT WARDS.Name
-- FROM WARDS
-- WHERE DepartmentId = (SELECT Id FROM DEPARTMENTS 
-- 					  WHERE Name = 'Oncology');


-- 4. Виведіть назви відділень без повторень, які спонсоруються компанією «Umbrella Corporation».
-- SELECT DISTINCT DEPARTMENTS.Name
-- FROM DONATIONS
-- JOIN DEPARTMENTS ON DONATIONS.DepartmentId = DEPARTMENTS.Id
-- JOIN SPONSORS ON DONATIONS.SponsorId = SPONSORS.Id
-- WHERE SPONSORS.Name = 'Medical Aid Inc.';


-- 5. Виведіть усі пожертвування за останній місяць у вигляді: відділення, спонсор, сума пожертвування, дата
-- пожертвування.
-- SELECT DEPARTMENTS.Name, SPONSORS.Name, DONATIONS.Amount, DONATIONS.Date
-- FROM DONATIONS
-- JOIN DEPARTMENTS ON DONATIONS.DepartmentId = DEPARTMENTS.Id
-- JOIN SPONSORS ON DONATIONS.SponsorId = SPONSORS.Id
-- WHERE DONATIONS.Date >= CURRENT_DATE - INTERVAL '1 month';


-- 6. Виведіть прізвища лікарів із зазначенням відділень,
-- в яких вони проводять обстеження. Враховуйте обстеження, які проводяться лише у будні дні.
-- SELECT Doctors.Surname, Departments.Name AS Department
-- FROM Doctors
-- JOIN Departments ON Doctors.Id = Departments.Id
-- WHERE EXTRACT(DOW FROM CURRENT_DATE) BETWEEN 1 AND 5
-- ORDER BY Doctors.Surname;

-- 7. Виведіть назви відділень, які отримували пожертву-вання
-- у розмірі понад 100000, із зазначенням їх лікарів.
-- SELECT DISTINCT Departments.Name AS Department, Doctors.Surname
-- FROM Donations
-- JOIN Departments ON Donations.DepartmentId = Departments.Id
-- JOIN Doctors ON Departments.Id = Doctors.Id
-- WHERE Donations.Amount > 7500;


-- 8. Виведіть назви відділень, в яких лікарі не отримують
-- надбавки.
-- SELECT DISTINCT Departments.Name
-- FROM Departments
-- JOIN Doctors ON Departments.Id = Doctors.Id
-- WHERE Doctors.Premium = 0;


-- 9. Виведіть назви відділень і назви захворювань, обстеження з яких вони проводили за останні півроку
-- SELECT DISTINCT Departments.Name AS Department, Specializations.Name AS Specialization
-- FROM Departments
-- JOIN DoctorsSpecializations ON Departments.Id = DoctorsSpecializations.DoctorId
-- JOIN Specializations ON DoctorsSpecializations.SpecializationId = Specializations.Id
-- WHERE DoctorsSpecializations.Id IN (
--     SELECT DoctorsSpecializations.Id
--     FROM DoctorsSpecializations
--     WHERE CURRENT_DATE - INTERVAL '6 months' <= CURRENT_DATE
-- );
