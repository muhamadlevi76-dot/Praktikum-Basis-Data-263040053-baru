-- Menggunakan database TokoRetailDB
USE TokoRetailDB;
GO

-- Memastikan tabel belum memiliki data
IF EXISTS (SELECT 1 FROM dbo.Produk)
   OR EXISTS (SELECT 1 FROM dbo.Pelanggan)
BEGIN
    THROW 50001, 'Tabel masih memiliki data. Jangan hapus tabel.', 1;
END;
GO

-- Menghapus tabel lama
DROP TABLE dbo.Pelanggan;
DROP TABLE dbo.Produk;
GO

-- LATIHAN 1: MEMBUAT TABEL PRODUK
CREATE TABLE Produk (
    ProdukID INT PRIMARY KEY,
    SKU VARCHAR(15) NOT NULL UNIQUE,
    NamaProduk VARCHAR(100),
    Harga DECIMAL(10,2),
    Stok INT
);
GO

-- LATIHAN 2: MEMBUAT TABEL PELANGGAN
CREATE TABLE Pelanggan (
    PelangganID INT IDENTITY(1,1) PRIMARY KEY,
    NamaDepan VARCHAR(50) NOT NULL,
    NamaBelakang VARCHAR(50) NULL,
    Email VARCHAR(100) UNIQUE,
    TanggalDaftar DATE NOT NULL
        DEFAULT GETDATE()
);
GO