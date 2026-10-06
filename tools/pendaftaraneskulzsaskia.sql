-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2026 at 03:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendaftaraneskulzsaskia`
--

-- --------------------------------------------------------

--
-- Table structure for table `ekskul`
--

CREATE TABLE `ekskul` (
  `idekskul` int NOT NULL,
  `namaekskul` varchar(50) NOT NULL,
  `pembina` varchar(50) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` time NOT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ekskul`
--

INSERT INTO `ekskul` (`idekskul`, `namaekskul`, `pembina`, `hari`, `jam`, `foto`) VALUES
(1, 'pramuka', 'rajaalam', 'selasa', '00:00:15', 'pramuka.png'),
(2, 'padus', 'maya', 'sabtu', '00:00:14', 'padus.png'),
(3, 'padus', 'pramuka', 'senin', '00:00:15', 'paskibra.png');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `idpendaftaran` int NOT NULL,
  `idsiswa` int NOT NULL,
  `idekskul` int NOT NULL,
  `iduser` int NOT NULL,
  `tanggaldaftar` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`idpendaftaran`, `idsiswa`, `idekskul`, `iduser`, `tanggaldaftar`, `status`) VALUES
(1, 1, 1, 2, '2026-08-14', 'diterima'),
(2, 2, 2, 1, '2026-05-16', 'tidakditerima'),
(3, 1, 1, 3, '2026-09-18', 'diterima');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `idsiswa` int NOT NULL,
  `namasiswa` varchar(50) NOT NULL,
  `nisn` varchar(10) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `jeniskelamin` char(10) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`idsiswa`, `namasiswa`, `nisn`, `kelas`, `jeniskelamin`, `foto`, `alamat`) VALUES
(1, 'zsaskia', '1234567890', 'X RPL2', 'perempuan', 'zsaskia.png', 'alurbaung'),
(2, 'ekalisa', '0987654321', 'X RPL2', 'perempuan', 'ekalisa.png', 'terban'),
(3, 'mariescha', '0123458967', 'X RPL2', 'perempuan', 'mariescha.png', 'kebuntengah');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `namauser` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nohp` char(14) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `username`, `password`, `nohp`, `foto`, `alamat`) VALUES
(1, 'juliani', 'juli', '1234567890', '081264739512', 'juliani.png', 'alurbaung'),
(2, 'novajelita', 'nova', '0987654321', '082295987313', 'novajelita.png', 'acehtamiang'),
(3, 'fiza', 'fiza123', '2345678901', '083190209532', 'fiza.png', 'desabundar'),
(4, ' lisa', ' ilsa2', ' 333', ' 089999999', ' lisa.png', ' terban');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`idekskul`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`idpendaftaran`),
  ADD KEY `idsiswa` (`idsiswa`),
  ADD KEY `idekskul` (`idekskul`),
  ADD KEY `iduser` (`iduser`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`idsiswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ekskul`
--
ALTER TABLE `ekskul`
  MODIFY `idekskul` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `idpendaftaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `idsiswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `idekskul` FOREIGN KEY (`idekskul`) REFERENCES `ekskul` (`idekskul`),
  ADD CONSTRAINT `idsiswa` FOREIGN KEY (`idsiswa`) REFERENCES `siswa` (`idsiswa`),
  ADD CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
