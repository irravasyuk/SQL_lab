-- CREATE TABLE Departments (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );
-- INSERT INTO Departments (Name) VALUES
-- ('Cardiology'),
-- ('Neurology'),
-- ('Oncology'),
-- ('Pediatrics');

-- CREATE TABLE Doctors (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR NOT NULL,
--     Surname VARCHAR NOT NULL,
--     Premium NUMERIC(10, 2) NOT NULL DEFAULT 0 CHECK (Premium >= 0),
--     Salary NUMERIC(10, 2) NOT NULL CHECK (Salary > 0)
-- );

-- INSERT INTO Doctors (Name, Surname, Premium, Salary) VALUES
-- ('John', 'Doe', 500.00, 5000.00),
-- ('Jane', 'Smith', 300.00, 4500.00),
-- ('Emily', 'Johnson', 0.00, 4000.00),
-- ('Michael', 'Brown', 200.00, 4800.00);

-- CREATE TABLE Specializations (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO Specializations (Name) VALUES
-- ('Cardiologist'),
-- ('Neurologist'),
-- ('Oncologist'),
-- ('Pediatrician');

-- CREATE TABLE DoctorsSpecializations (
--     Id SERIAL PRIMARY KEY,
--     DoctorId INT NOT NULL,
--     SpecializationId INT NOT NULL,
--     FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
--     FOREIGN KEY (SpecializationId) REFERENCES Specializations(Id)
-- );

-- INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId) VALUES
-- (1, 1),  
-- (2, 2),  
-- (3, 3),  
-- (4, 4);  

-- CREATE TABLE Sponsors (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO Sponsors (Name) VALUES
-- ('Health Foundation'),
-- ('Medical Aid Inc.'),
-- ('Wellness Trust'),
-- ('Care Givers Org.');

-- CREATE TABLE Donations (
--     Id SERIAL PRIMARY KEY,
--     Amount NUMERIC(10, 2) NOT NULL CHECK (Amount > 0),
--     Date DATE NOT NULL DEFAULT CURRENT_DATE CHECK (Date <= CURRENT_DATE),
--     DepartmentId INT NOT NULL,
--     SponsorId INT NOT NULL,
--     FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
--     FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
-- );

-- INSERT INTO Donations (Amount, Date, DepartmentId, SponsorId) VALUES
-- (10000.00, '2023-05-01', 1, 1),
-- (5000.00, '2023-06-15', 2, 2),
-- (7500.00, '2023-07-20', 3, 3),
-- (2000.00, '2023-08-30', 4, 4);

-- CREATE TABLE Vacations (
--     Id SERIAL PRIMARY KEY,
--     StartDate DATE NOT NULL,
--     EndDate DATE NOT NULL CHECK (EndDate > StartDate),
--     DoctorId INT NOT NULL,
--     FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
-- );

-- INSERT INTO Vacations (StartDate, EndDate, DoctorId) VALUES
-- ('2023-12-01', '2023-12-15', 1),
-- ('2024-01-10', '2024-01-25', 2),
-- ('2024-02-05', '2024-02-20', 3),
-- ('2024-03-01', '2024-03-15', 4);

CREATE TABLE Wards (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(20) NOT NULL UNIQUE,
    DepartmentId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

INSERT INTO Wards (Name, DepartmentId) VALUES
('Ward A', 1),
('Ward B', 2),
('Ward C', 3),
('Ward D', 4);