CREATE TABLE clinic_sales (
    sale_id TEXT,
    sale_date TEXT,
    amount REAL,
    sales_channel TEXT
);

CREATE TABLE expenses (
    expense_id TEXT,
    expense_date TEXT,
    amount REAL
);

INSERT INTO clinic_sales VALUES
('s1','2021-10-05',500,'Online'),
('s2','2021-10-10',700,'Offline'),
('s3','2021-11-01',1200,'Online'),
('s4','2021-11-15',800,'Offline'),
('s5','2021-11-20',1000,'Online');

INSERT INTO expenses VALUES
('e1','2021-10-06',300),
('e2','2021-10-20',400),
('e3','2021-11-05',600),
('e4','2021-11-18',500);