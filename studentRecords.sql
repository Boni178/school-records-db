CREATE TABLE Department (
    departmentID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    head VARCHAR(100)
);

CREATE TABLE Course (
    courseID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) NOT NULL,
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    number VARCHAR(20),
    status VARCHAR(50)
);
CREATE TABLE Enrollment (
    enrollmentID INT PRIMARY KEY,
    studentID INT,
    courseID INT,
    date DATE,
    enrollment_type VARCHAR(50),
     UNIQUE(studentID, courseID)  
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID),
   
);
CREATE TABLE Lecturer (
    lecturerID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    number VARCHAR(20),
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE Password (
    passwordID INT PRIMARY KEY,
    studentID INT UNIQUE,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE Funding (
    fundingID INT PRIMARY KEY,
    fundingType VARCHAR(50),
    studentID INT,
    status VARCHAR(50),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Grades (
    studentID INT,
    courseID INT,
    grade VARCHAR(10),
    PRIMARY KEY (studentID, courseID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);
CREATE TABLE Fees (
    feesID INT PRIMARY KEY,
    status VARCHAR(50),
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Extracurriculars (
    activityID INT PRIMARY KEY,
    name VARCHAR(100),
    studentID INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE DisciplineRecords (
    incidentID INT PRIMARY KEY,
    studentID INT,
    incidentDate DATE,
    description TEXT,
    action_taken TEXT,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Books (
    bookID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    year_published YEAR,
    available_copies INT,
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE LibraryRecords (
    libraryID INT PRIMARY KEY,
    studentID INT,
    bookID INT,
    borrow_date DATE,
    due_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID)
);

