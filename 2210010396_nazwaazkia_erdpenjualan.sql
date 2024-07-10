-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2024 pada 08.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2210010396_nazwaazkia_erdpenjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID` int(8) NOT NULL,
  `BARKODE` int(20) DEFAULT NULL,
  `NAME` char(100) DEFAULT NULL,
  `HARGA JUAL` bigint(20) DEFAULT NULL,
  `HARGA BELI` bigint(20) DEFAULT NULL,
  `STOK` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`ID`, `BARKODE`, `NAME`, `HARGA JUAL`, `HARGA BELI`, `STOK`, `kategori_id`, `satuan_id`, `supplier_id`, `user_id`) VALUES
(1, 101010, 'pulpen joyko', 3000, 2000, 20, 1, 1, 1, 1),
(2, 111010, 'penghapus montana', 15000, 13000, 20, 5, 2, 2, 2),
(3, 101210, 'pensil faber castel', 70000, 68000, 25, 2, 5, 3, 3),
(4, 101310, 'buku tulis vision', 40000, 38000, 20, 3, 3, 4, 4),
(5, 101410, 'kertas hvs a4 sidu', 55000, 53000, 25, 4, 4, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'pulpen'),
(2, 'pensil'),
(3, 'buku'),
(4, 'kertas'),
(5, 'penghapus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kustomer`
--

CREATE TABLE `kustomer` (
  `ID` int(8) NOT NULL,
  `NIK` char(20) DEFAULT NULL,
  `NAME` char(100) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kustomer`
--

INSERT INTO `kustomer` (`ID`, `NIK`, `NAME`, `ALAMAT`, `TELP`) VALUES
(1, '6372620006', 'abida', 'jl Veteran', '081225735784'),
(2, '6372720007', 'erdia', 'jl Handil Bakti', '081275387483'),
(3, '6372820008', 'Haisha', 'jl keramat', '081208359835'),
(4, '6372920009', 'Uwais', 'jl antasan kecil timur', '081209899358'),
(5, '6373020000', 'Yumna', 'jl gatot subroto', '081294839076');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `total` bigint(50) DEFAULT NULL,
  `bayar` bigint(50) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `diskripsi` varchar(100) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `tanggal`, `supplier_id`, `diskripsi`, `user_id`) VALUES
(1, 'VB001', 100000, 100000, '2024-03-01 10:10:53', 1, 'pulpen joyko 50 pcs', 2),
(2, 'VB002', 455000, 450000, '2024-03-01 10:10:53', 2, 'penghapus montana 35 box', 3),
(3, 'VB003', 2040000, 2040000, '2024-03-02 10:21:13', 3, 'pensil faber castel 30 set', 3),
(4, 'VB004', 950000, 950000, '2024-03-01 10:21:13', 4, 'buku tulis vision 25 lusin', 2),
(5, 'VB005', 1590000, 1590000, '2024-03-02 10:27:01', 5, 'kertas hvs a4 sidu 30 rim', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian detail`
--

CREATE TABLE `pembelian detail` (
  `id` int(8) NOT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `harga` bigint(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `subtotal` bigint(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian detail`
--

INSERT INTO `pembelian detail` (`id`, `barang_id`, `pembelian_id`, `harga`, `qty`, `subtotal`) VALUES
(1, 1, 1, 2000, 50, 100000),
(2, 2, 2, 13000, 35, 455000),
(3, 3, 3, 68000, 30, 2040000),
(4, 4, 4, 38000, 25, 950000),
(5, 5, 5, 53000, 30, 1590000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `INVOICE` varchar(50) DEFAULT NULL,
  `TOTAL` bigint(50) DEFAULT NULL,
  `BAYAR` bigint(50) DEFAULT NULL,
  `KEMBALI` bigint(50) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `INVOICE`, `TOTAL`, `BAYAR`, `KEMBALI`, `TANGGAL`, `kustomer_id`, `user_id`) VALUES
(1, 'VJ001', 15000, 15000, 0, '2024-04-03 09:46:52', 1, 4),
(2, 'VJ002', 3000, 5000, 2000, '2024-04-15 09:46:52', 2, 5),
(3, 'VJ003', 70000, 100000, 30000, '2024-04-13 09:52:04', 3, 4),
(4, 'VJ004', 55000, 60000, 5000, '2024-04-17 09:52:04', 4, 5),
(5, 'VJ005', 40000, 50000, 10000, '2024-04-10 09:59:34', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan detail`
--

CREATE TABLE `penjualan detail` (
  `id` int(8) NOT NULL,
  `BARANG_ID` int(8) DEFAULT NULL,
  `PENJUALAN_ID` int(8) DEFAULT NULL,
  `harga` bigint(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `subtotal` bigint(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan detail`
--

INSERT INTO `penjualan detail` (`id`, `BARANG_ID`, `PENJUALAN_ID`, `harga`, `qty`, `subtotal`) VALUES
(1, 2, 1, 15000, 1, 15000),
(2, 1, 2, 3000, 1, 3000),
(3, 3, 3, 70000, 1, 70000),
(4, 5, 4, 55000, 1, 55000),
(5, 4, 5, 40000, 1, 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'pcs', 'per buah'),
(2, 'box', 'per 40 buah'),
(3, 'lusin', 'per 12 buah'),
(4, 'rim', 'per 500 lembar'),
(5, 'set', 'per 16 buah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(8) NOT NULL,
  `NIK` char(20) DEFAULT NULL,
  `NAME` char(100) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `perusahaan` varchar(100) DEFAULT NULL,
  `NAMABANK` varchar(100) DEFAULT NULL,
  `AKUNBANK` char(10) DEFAULT NULL,
  `NOAKUNBANK` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`ID`, `NIK`, `NAME`, `TELP`, `ALAMAT`, `EMAIL`, `perusahaan`, `NAMABANK`, `AKUNBANK`, `NOAKUNBANK`) VALUES
(1, '6373120001', 'Abiel', '081245853933', 'jl rawa sari', 'radenabiel@gmail.com', 'PT. Abadi Karya', 'BCA', 'akun_bca', '02042004'),
(2, '6373220002', 'Harsil', '081248928292', 'jl belitung', 'harshilandhika@gmail.com', 'PT. Kencana Indah', 'Mandiri', 'akun_mandi', '04082001'),
(3, '6373320003', 'Ilayya', '081243058301', 'jl kayutangi', 'ilayyacantik@gmail.com', 'PT. Melayu Biru', 'BNI', 'akun_bni', '09032004'),
(4, '6373420004', 'Freya', '081203902807', 'jl sutoyo s', 'freyfreya@gmail.com', 'PT. Cantika Abadi', 'bri', 'akun_bri', '03022003'),
(5, '6373520005', 'Nesta', '081238729874', 'jl sungai andai', 'nestagym@gmail.com', 'PT. Kumala Surya', 'BSI', 'akun_bsi', '04092004');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `ID` int(8) NOT NULL,
  `NIK` char(20) DEFAULT NULL,
  `USERNAME` char(100) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROLE` char(20) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID`, `NIK`, `USERNAME`, `FULL_NAME`, `PASSWORD`, `ROLE`, `TELP`, `EMAIL`, `ADDRESS`, `IS_ACTIVE`) VALUES
(1, '6372120001', 'nmalaa_', 'Nurmala Sari', 'malacantik', 'owner', '081123058435', 'nurmalasri@gmail.com', 'jl. veteran', 'yes'),
(2, '6372220002', 'alyanormda', 'Alya Normaida', 'yayalya', 'manajer', '081245830206', 'alyanormaida1@gmail.com', 'jl. trans kalimantan', 'yes'),
(3, '6372320003', 'marini24', 'Marini Islami', 'ririn', 'wakil manajer', '081273973478', 'marinirini@gmail.com', 'jl. kelayan A', 'yes'),
(4, '6372420004', 'jmzahraa', 'Jamilatuzzahra', 'gleamara', 'staff', '081248395709', 'jmzara@gmail.com', 'jl. kelayan B', 'yes'),
(5, '6372520005', 'nanazkia', 'Nazwa Azkia', 'azkiayaya', 'staff', '084850958467', 'azkianazwa@gmail.com', 'jl. Sungai Andai', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_supplier` (`supplier_id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userpembeli` (`user_id`),
  ADD KEY `fk_supplierbeli` (`supplier_id`);

--
-- Indeks untuk tabel `pembelian detail`
--
ALTER TABLE `pembelian detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembelianid` (`pembelian_id`),
  ADD KEY `fk_barangbeli` (`barang_id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kustomer` (`kustomer_id`),
  ADD KEY `fk_userjual` (`user_id`);

--
-- Indeks untuk tabel `penjualan detail`
--
ALTER TABLE `penjualan detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penjualan` (`PENJUALAN_ID`),
  ADD KEY `fk_barangjual` (`BARANG_ID`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembelian detail`
--
ALTER TABLE `pembelian detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan detail`
--
ALTER TABLE `penjualan detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`ID`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_supplierbeli` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`ID`),
  ADD CONSTRAINT `fk_userpembeli` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`);

--
-- Ketidakleluasaan untuk tabel `pembelian detail`
--
ALTER TABLE `pembelian detail`
  ADD CONSTRAINT `fk_barangbeli` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `fk_pembelianid` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_kustomer` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`ID`),
  ADD CONSTRAINT `fk_userjual` FOREIGN KEY (`user_id`) REFERENCES `user` (`ID`);

--
-- Ketidakleluasaan untuk tabel `penjualan detail`
--
ALTER TABLE `penjualan detail`
  ADD CONSTRAINT `fk_barangjual` FOREIGN KEY (`BARANG_ID`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `fk_penjualan` FOREIGN KEY (`PENJUALAN_ID`) REFERENCES `penjualan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
