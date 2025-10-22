-- test_constraints.sql

-- Menguji primary key, unique, dan check constraint
-- Insert data normal
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22117', 'Andhika Pratama', 21, 'andhika@example.com');

-- Uji Primary Key
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22117', 'Andi', 22, 'andi@example.com');

-- Uji UNIQUE constraint (email ganda)
-- Harus error
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22118', 'Andi Test', 22, 'andhika@example.com');

-- Uji CHECK constraint (umur tidak boleh 0)
-- Harus error
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22119', 'eko', 0, 'eko@example.com');
