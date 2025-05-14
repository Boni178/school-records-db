CREATE TABLE Department (
    departmentID INT PRIMARY KEY,
    departmentName VARCHAR(300),
    departmentHead VARCHAR(300)
);

CREATE TABLE Course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(300),
    courseCode VARCHAR(300),
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    studentName VARCHAR(300),
    studentEmail VARCHAR(300),
    studentAddress VARCHAR(300),
    studentNumber VARCHAR(300),
    studentStatus VARCHAR(300)
);
CREATE TABLE Enrollment (
    enrollmentID INT PRIMARY KEY,
    studentID INT,
    courseID INT,
    enrollmentDate DATE,
    enrollmentType VARCHAR(300),
    UNIQUE(studentID, courseID)  
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID),
   
);
CREATE TABLE Lecturer (
    lecturerID INT PRIMARY KEY,
    lecturerName VARCHAR(300),
    lecturerEmail VARCHAR(300),
    lecturerNumber VARCHAR(300),
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE Password (
    passwordID INT PRIMARY KEY,
    studentID INT,
    password_hash VARCHAR(300),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE Funding (
    fundingID INT PRIMARY KEY,
    fundingType VARCHAR(300),
    studentID INT,
    fundingStatus VARCHAR(300),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Grades (
    studentID INT,
    courseID INT,
    grade VARCHAR(300),
    PRIMARY KEY (studentID, courseID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);
CREATE TABLE Fees (
    feesID INT PRIMARY KEY,
    feeStatus VARCHAR(300),
    studentID INT,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Extracurriculars (
    activityID INT PRIMARY KEY,
    activityName VARCHAR(300),
    studentID INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE DisciplineRecords (
    incidentID INT PRIMARY KEY,
    studentID INT,
    incidentDate DATE,
    incidentDescription VARCHAR(300),
    action_taken VARCHAR(300),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE Books (
    bookID INT PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    author VARCHAR(300),
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
    status VARCHAR(300),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID)
);

