


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    published_year INT,
    available_copies INT
);
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    join_date DATE
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    returned bit DEFAULT 0,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);


-- Books
INSERT INTO Books VALUES
(1, '1984', 'George Orwell', 'Dystopian', 1949, 3),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960, 2),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 1);

-- Members
INSERT INTO Members VALUES
(101, 'Alice Smith', 'alice@example.com', '2023-01-15'),
(102, 'Bob Johnson', 'bob@example.com', '2023-02-10');

-- Loans
INSERT INTO Loans VALUES
(1001, 1, 101, '2024-12-01', NULL, 0),
(1002, 2, 102, '2024-12-05', '2024-12-20', 1);


SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM LOANS;

---LIST ALL BOOKS AVAILABLE

SELECT *,AVAILABLE_COPIES FROM BOOKS WHERE AVAILABLE_COPIES > 0;

---List all members and their current loans:

SELECT M.NAME,L.LOAN_ID ,L.LOAN_DATE FROM MEMBERS M INNER JOIN LOANS L ON M.MEMBER_ID= L.MEMBER_ID
SELECT M.NAME,L.LOAN_ID FROM MEMBERS M LEFT JOIN LOANS L ON M.MEMBER_ID= L.MEMBER_ID
SELECT M.NAME,L.LOAN_ID FROM MEMBERS M RIGHT JOIN LOANS L ON M.MEMBER_ID= L.MEMBER_ID
SELECT M.NAME,L.LOAN_ID FROM MEMBERS M FULL JOIN LOANS L ON M.MEMBER_ID= L.MEMBER_ID

--CORRECT
SELECT M.name, B.title, L.loan_date
FROM Loans L
JOIN Members M ON L.member_id = M.member_id
JOIN Books B ON L.book_id = B.book_id
WHERE L.returned = 0;


---Count how many books each member has borrowed:

SELECT M.NAME, COUNT(*) AS TOTAL_COUNT FROM MEMBERS M
INNER JOIN LOANS L ON M.MEMBER_ID=L.member_id
GROUP BY NAME

UPDATE Loans
SET return_date = GETDATE(), returned = 1
WHERE loan_id = 1001;

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 1;






