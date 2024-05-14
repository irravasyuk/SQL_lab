-- CREATE TABLE Departments (
--     Id SERIAL PRIMARY KEY,
--     Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
--     Financing DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (Financing >= 0),
--     Name VARCHAR(100) NOT NULL
-- );

-- INSERT INTO Departments (Building, Financing, Name) VALUES
--     (1, 50000.00, 'Відділення терапії'),
--     (2, 75000.00, 'Відділення хірургії'),
--     (3, 60000.00, 'Відділення педіатрії'),
--     (4, 80000.00, 'Відділення акушерства та гінекології'),
--     (5, 70000.00, 'Відділення неврології');

-- CREATE TABLE Diseases (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(100) UNIQUE NOT NULL,
--     Severity INT NOT NULL DEFAULT 1 CHECK (Severity >= 1)
-- );

-- INSERT INTO Diseases (Name, Severity) VALUES
--     ('Грип', 3),
--     ('Гепатит', 2),
--     ('Діабет', 4),
--     ('Астма', 2),
--     ('Грижа', 3);

-- CREATE TABLE Doctors (
--     Id SERIAL PRIMARY KEY,
--     Name VARCHAR(255) NOT NULL,
--     Phone CHAR(10),
--     Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 0),
--     Surname VARCHAR(255) NOT NULL
-- );

-- INSERT INTO Doctors (Name, Phone, Salary, Surname) VALUES
--     ('Іван', '1234567890', 5000.00, 'Петров'),
--     ('Марія', '0987654321', 6000.00, 'Іванова'),
--     ('Олексій', '1112223333', 5500.00, 'Сидоров'),
--     ('Наталія', '4445556666', 7000.00, 'Коваленко'),
--     ('Павло', '7778889999', 6500.00, 'Мельник');

-- CREATE TABLE Examinations (
--     Id SERIAL PRIMARY KEY,
--     DayOfWeek INT NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
--     EndTime TIME NOT NULL,
--     Name VARCHAR(100) UNIQUE NOT NULL,
--     StartTime TIME NOT NULL CHECK (StartTime >= '08:00' AND StartTime <= '18:00')
-- );

-- INSERT INTO Examinations (DayOfWeek, EndTime, Name, StartTime) VALUES
--     (1, '10:30', 'Провірка артерій', '09:00'),
--     (2, '11:00', 'ЕКГ', '10:00'),
--     (3, '15:30', 'УЗД органів черевної порожнини', '14:00'),
--     (4, '12:30', 'Рентгенографія легень', '11:30'),
--     (5, '09:00', 'Аналіз крові', '08:00');

CREATE TABLE Wards (
    Id SERIAL PRIMARY KEY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Floor INT NOT NULL CHECK (Floor >= 1),
    Name VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO Wards (Building, Floor, Name) VALUES
    (1, 1, 'Палата 101'),
    (2, 2, 'Палата 202'),
    (3, 1, 'Палата 301'),
    (4, 3, 'Палата 403'),
    (5, 2, 'Палата 502')
