-- Test Role
-- Pastikan sudah berada di database postgres dan schema SALAM aktif
SET search_path TO SALAM;

-- TEST 1: Role backend_dev (CRUD)
SET ROLE backend_dev;

-- SELECT → Harus berhasil
SELECT * FROM SALAM.mahasiswas;

-- INSERT → Harus berhasil
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22120', 'Backend Test', 21, 'backend@test.com');

-- UPDATE → Harus berhasil
UPDATE SALAM.mahasiswas
SET umur = 22
WHERE nim = '22120';

-- DELETE → Harus berhasil
DELETE FROM SALAM.mahasiswas
WHERE nim = '22120';

RESET ROLE;

-- TEST 2: Role bi_dev (Read Only)
SET ROLE bi_dev;

-- SELECT → Harus berhasil
SELECT * FROM SALAM.mahasiswas;

-- INSERT → Harus GAGAL (akan muncul error permission denied)
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22121', 'BI Test', 20, 'bi@test.com');

RESET ROLE;

-- TEST 3: Role data_engineer (CREATE, MODIFY, DROP + CRUD)
SET ROLE data_engineer;

-- CREATE TABLE → Harus berhasil
CREATE TABLE SALAM.test_roles (
    id SERIAL PRIMARY KEY,
    deskripsi TEXT
);

-- INSERT → Harus berhasil
INSERT INTO SALAM.test_roles (deskripsi)
VALUES ('Data Engineer test berhasil.');

-- SELECT → Harus berhasil
SELECT * FROM SALAM.test_roles;

-- DROP TABLE → Harus berhasil
DROP TABLE SALAM.test_roles;

RESET ROLE;

-- Kembali ke role postgres
SET ROLE postgres;