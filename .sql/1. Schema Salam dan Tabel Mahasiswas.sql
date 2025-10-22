-- Membuat Schema SALAM
CREATE SCHEMA IF NOT EXISTS SALAM;
-- Membuat Tabel mahasiswas
CREATE TABLE IF NOT EXISTS SALAM.mahasiswas (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    umur INT CHECK (umur > 0),
    email VARCHAR(50) UNIQUE
);
