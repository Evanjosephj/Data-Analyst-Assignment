-- Hotel Schema + Data

CREATE TABLE users (
    user_id TEXT PRIMARY KEY,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

CREATE TABLE items (
    item_id TEXT PRIMARY KEY,
    item_name TEXT,
    item_rate REAL
);

CREATE TABLE bookings (
    booking_id TEXT PRIMARY KEY,
    booking_date TEXT,
    room_no TEXT,
    user_id TEXT
);

CREATE TABLE booking_commercials (
    id TEXT PRIMARY KEY,
    booking_id TEXT,
    bill_id TEXT,
    bill_date TEXT,
    item_id TEXT,
    item_quantity REAL
);

INSERT INTO users VALUES
('21wrcxuy-67erfn', 'John Doe',   '9700000001', 'john.doe@example.com',  '10, Street A, Mumbai'),
('21wrcxuy-78abcd', 'Jane Smith', '9700000002', 'jane.smith@example.com','20, Street B, Delhi'),
('21wrcxuy-89efgh', 'Ravi Kumar', '9700000003', 'ravi.k@example.com',    '30, Street C, Chennai');

INSERT INTO items VALUES
('itm-a9e8-q8fu',  'Tawa Paratha', 18.00),
('itm-a07vh-aer8', 'Mix Veg',      89.00),
('itm-w978-23u4',  'Dal Fry',      75.00),
('itm-b123-xx01',  'Butter Naan',  35.00),
('itm-c456-yy02',  'Paneer Tikka', 150.00);

INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-q034-q4o',   '2021-10-05 10:00:00', 'rm-xyz1-0001',  '21wrcxuy-78abcd'),
('bk-r045-r5p',   '2021-10-15 14:00:00', 'rm-abc2-0002',  '21wrcxuy-67erfn'),
('bk-s056-s6q',   '2021-11-01 09:00:00', 'rm-def3-0003',  '21wrcxuy-89efgh'),
('bk-t067-t7r',   '2021-11-10 11:00:00', 'rm-ghi4-0004',  '21wrcxuy-78abcd'),
('bk-u078-u8s',   '2021-11-20 16:00:00', 'rm-jkl5-0005',  '21wrcxuy-67erfn');

INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu',  3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('134lr-oyfo8-3qk4','bk-q034-q4o',   'bl-34qhd-r7h8', '2021-10-05 12:05:37', 'itm-w978-23u4',  2),
('bc01-oct15-001',  'bk-r045-r5p',   'bl-oct15-b001', '2021-10-15 13:00:00', 'itm-b123-xx01',  4),
('bc02-oct15-002',  'bk-r045-r5p',   'bl-oct15-b001', '2021-10-15 13:00:00', 'itm-c456-yy02',  2),
('bc03-nov01-001',  'bk-s056-s6q',   'bl-nov01-b001', '2021-11-01 10:00:00', 'itm-a9e8-q8fu',  5),
('bc04-nov01-002',  'bk-s056-s6q',   'bl-nov01-b001', '2021-11-01 10:00:00', 'itm-a07vh-aer8', 3),
('bc05-nov10-001',  'bk-t067-t7r',   'bl-nov10-b002', '2021-11-10 12:00:00', 'itm-w978-23u4',  6),
('bc06-nov10-002',  'bk-t067-t7r',   'bl-nov10-b002', '2021-11-10 12:00:00', 'itm-c456-yy02',  5),
('bc07-nov20-001',  'bk-u078-u8s',   'bl-nov20-b003', '2021-11-20 17:00:00', 'itm-b123-xx01',  2),
('bc08-nov20-002',  'bk-u078-u8s',   'bl-nov20-b003', '2021-11-20 17:00:00', 'itm-c456-yy02',  8);