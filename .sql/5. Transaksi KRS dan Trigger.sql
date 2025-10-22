-- Fitur Tambahan Transaksi KRS dan Trigger log Aktivitas
-- Membuat tabel transaksi KRS
CREATE TABLE SALAM.transaksi_krs (
    id SERIAL PRIMARY KEY,
    nim VARCHAR(10) REFERENCES SALAM.mahasiswas(nim),
    kode_mk VARCHAR(10) NOT NULL,
    nama_mk VARCHAR(100) NOT NULL,
    semester INT CHECK (semester BETWEEN 1 AND 8),
    status_krs VARCHAR(10) DEFAULT 'aktif' CHECK (status_krs IN ('aktif','batal')),
    tanggal_pengambilan DATE DEFAULT CURRENT_DATE
);

-- Membuat tabel log aktivitas mahasiswa
CREATE TABLE SALAM.log_update_mahasiswa (
    id SERIAL PRIMARY KEY,
    nim VARCHAR(10),
    aksi VARCHAR(20),
    waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat fungsi trigger otomatis log aktivitas mahasiswa
CREATE OR REPLACE FUNCTION SALAM.fn_log_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO SALAM.log_update_mahasiswa (nim, aksi)
    VALUES (NEW.nim, TG_OP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger pada tabel mahasiswas untuk mencatat aktivitas
CREATE TRIGGER trg_log_update
AFTER INSERT OR UPDATE OR DELETE
ON SALAM.mahasiswas
FOR EACH ROW
EXECUTE FUNCTION SALAM.fn_log_update();

-- Pengujian Trigger

-- Tambah data mahasiswa (akan tercatat di log)
INSERT INTO SALAM.mahasiswas (nim, nama, umur, email)
VALUES ('22130', 'Test Mahasiswa', 22, 'test@example.com');

-- Update data mahasiswa (akan tercatat di log)
UPDATE SALAM.mahasiswas
SET umur = 23
WHERE nim = '22130';

-- Hapus data mahasiswa (akan tercatat di log)
DELETE FROM SALAM.mahasiswas
WHERE nim = '22130';

-- Lihat hasil log aktivitas
SELECT * FROM SALAM.log_update_mahasiswa;