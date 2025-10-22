-- Membuat User Role
-- a. backend_dev → CRUD semua tabel
CREATE ROLE backend_dev LOGIN PASSWORD 'backend123';
GRANT CONNECT ON DATABASE postgres TO backend_dev;
GRANT USAGE ON SCHEMA SALAM TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- b. bi_dev → hanya read/select semua tabel/view
CREATE ROLE bi_dev LOGIN PASSWORD 'bidev123';
GRANT CONNECT ON DATABASE postgres TO bi_dev;
GRANT USAGE ON SCHEMA SALAM TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- c. data_engineer → CREATE, MODIFY, DROP semua object + CRUD semua tabel
CREATE ROLE data_engineer LOGIN PASSWORD 'dataeng123';
GRANT CONNECT ON DATABASE postgres TO data_engineer;
GRANT USAGE, CREATE ON SCHEMA SALAM TO data_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA SALAM TO data_engineer;
