-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 04:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bookborrow`
--

CREATE TABLE `tb_bookborrow` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `reader_id` int(10) UNSIGNED DEFAULT NULL,
                               `book_id` int(10) UNSIGNED DEFAULT NULL,
                               `borrow_time` date DEFAULT NULL,
                               `return_time` date DEFAULT NULL,
                               `operator` varchar(30) DEFAULT NULL,
                               `if_back` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_bookborrow`
--

INSERT INTO `tb_bookborrow` (`id`, `reader_id`, `book_id`, `borrow_time`, `return_time`, `operator`, `if_back`) VALUES
                                                                                                                  (1, 6, 10, '2020-01-30', '2020-03-03', 'xxbb', 1),
                                                                                                                  (2, 6, 9, '2020-01-31', '2021-01-10', 'root', 1),
                                                                                                                  (3, 6, 9, '2020-01-31', '2020-02-15', 'root', 1),
                                                                                                                  (4, 6, 9, '2020-01-31', '2020-02-15', 'root', 1),
                                                                                                                  (5, 6, 9, '2020-01-31', '2020-02-15', 'root', 1),
                                                                                                                  (7, 6, 9, '2020-02-04', '2020-02-19', 'root', 1),
                                                                                                                  (8, 6, 13, '2020-02-08', '2020-02-28', 'root', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bookcase`
--

CREATE TABLE `tb_bookcase` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_bookcase`
--

INSERT INTO `tb_bookcase` (`id`, `name`) VALUES
                                           (4, 'bookshelfA-1'),
                                           (5, 'bookshelfA-2'),
                                           (6, 'bookshelfA-1'),
                                           (8, 'bookshelfA-2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bookinfo`
--

CREATE TABLE `tb_bookinfo` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `barcode` varchar(30) DEFAULT NULL,
                             `book_name` varchar(70) DEFAULT NULL,
                             `type_id` int(10) UNSIGNED DEFAULT NULL,
                             `author` varchar(30) DEFAULT NULL,
                             `translator` varchar(30) DEFAULT NULL,
                             `ISBN` varchar(20) DEFAULT NULL,
                             `price` double(8,2) DEFAULT NULL,
  `page` int(10) UNSIGNED DEFAULT NULL,
  `bookcase` int(10) UNSIGNED DEFAULT NULL,
  `intime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `if_delete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_bookinfo`
--

INSERT INTO `tb_bookinfo` (`id`, `barcode`, `book_name`, `type_id`, `author`, `translator`, `ISBN`, `price`, `page`, `bookcase`, `intime`, `operator`, `if_delete`) VALUES
                                                                                                                                                                      (1, '123456', 'HTML/CSS/Javascript ', 4, 'Tran Hoang Thanh', 'wxy', '302', 128.00, 333, 6, '2020-02-03', 'root', 0),
                                                                                                                                                                      (7, '9787302210337', 'Java Web Advanced', 4, 'Nguyen Van A', 'wgh', '302', 89.00, 834, 4, '2011-02-24', 'root', 0),
                                                                                                                                                                      (8, '9787115195975', 'Java Web Basic', 4, 'Nguyen Van A', 'ws', '115', 89.00, 752, 5, '2011-02-24', 'root', 0),
                                                                                                                                                                      (9, '990821333', 'mysql From Basic To Advanced', 5, 'Le Van Ba', 'rc', '115', 11.00, 0, 4, '2011-02-24', 'mr', 0),
                                                                                                                                                                      (10, '990823444', 'SpringMVC Part 1', 4, 'Le Van Ba', 'rc', '111', 26.00, 0, 4, '2011-02-24', 'mr', 0),
                                                                                                                                                                      (13, '990823445', 'SpringMVC Part 2', 4, 'Le Van Ba', 'rc', '111', 26.00, 0, 4, '2020-02-08', 'root', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_bookreturn`
--

CREATE TABLE `tb_bookreturn` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `reader_id` int(10) UNSIGNED DEFAULT NULL,
                               `book_id` int(10) UNSIGNED DEFAULT NULL,
                               `return_time` date DEFAULT NULL,
                               `operator` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_bookreturn`
--

INSERT INTO `tb_bookreturn` (`id`, `reader_id`, `book_id`, `return_time`, `operator`) VALUES
                                                                                        (3, 4, 7, '2011-02-24', 'mr'),
                                                                                        (7, 6, 9, '2020-02-01', 'root'),
                                                                                        (8, 6, 9, '2020-02-01', 'root'),
                                                                                        (9, 6, 9, '2020-02-01', 'root'),
                                                                                        (10, 6, 9, '2020-02-04', 'root'),
                                                                                        (11, 6, 10, '2020-02-08', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `tb_booktype`
--

CREATE TABLE `tb_booktype` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `type_name` varchar(30) DEFAULT NULL,
                             `limited_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_booktype`
--

INSERT INTO `tb_booktype` (`id`, `type_name`, `limited_time`) VALUES
                                                                (4, 'network programming', 20),
                                                                (5, 'database development', 15),
                                                                (6, 'operating system', 90);

-- --------------------------------------------------------

--
-- Table structure for table `tb_library`
--

CREATE TABLE `tb_library` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(30) DEFAULT NULL,
                            `curator` varchar(255) DEFAULT NULL,
                            `telephone` varchar(255) DEFAULT NULL,
                            `email` varchar(255) DEFAULT NULL,
                            `introduce` varchar(255) DEFAULT NULL,
                            `url` varchar(255) DEFAULT NULL,
                            `create_date` date DEFAULT NULL,
                            `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_library`
--

INSERT INTO `tb_library` (`id`, `name`, `curator`, `telephone`, `email`, `introduce`, `url`, `create_date`, `address`) VALUES
  (1, 'Library Reader People', 'Ly Chien Thang', '0431-84978981', 'mingrisoft@mingsoft.com', 'The city has the library with the most computer books.', 'http:// www.KaerMorhen.xxbb.com', '2023-04-01', 'p. Linh Trung, TP. Thu Duc, TPHCM');

-- --------------------------------------------------------

--
-- Table structure for table `tb_manager`
--

CREATE TABLE `tb_manager` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(30) DEFAULT NULL,
                            `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_manager`
--

INSERT INTO `tb_manager` (`id`, `name`, `password`) VALUES
                                                      (1, 'root', '123456'),
                                                      (2, 'mr', '123456'),
                                                      (3, 'wgh', '123456'),
                                                      (4, 'admin', '123456'),
                                                      (5, 'xxbb', '123456'),
                                                      (6, 'aabb', '123456'),
                                                      (9, 'rick', '123456');

--
-- Triggers `tb_manager`
--
DELIMITER $$
CREATE TRIGGER `insert_trigger` AFTER INSERT ON `tb_manager` FOR EACH ROW insert into tb_purview(id) VALUES(new.id)
  $$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_parameter`
--

CREATE TABLE `tb_parameter` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `cost` int(10) UNSIGNED DEFAULT NULL,
                              `validity` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_parameter`
--

INSERT INTO `tb_parameter` (`id`, `cost`, `validity`) VALUES
  (1, 30, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tb_publishing`
--

CREATE TABLE `tb_publishing` (
                               `isbn` varchar(255) NOT NULL,
                               `publish_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_publishing`
--

INSERT INTO `tb_publishing` (`isbn`, `publish_name`) VALUES
                                                       ('111', '\r\nMechanical Industry Press'),
                                                       ('115', '\r\nPeople Post Press'),
                                                       ('302', '\r\nTsinghua University Press\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_purview`
--

CREATE TABLE `tb_purview` (
                            `id` int(11) NOT NULL,
                            `system_set` tinyint(1) DEFAULT 0,
                            `reader_set` tinyint(1) DEFAULT 0,
                            `book_set` tinyint(1) DEFAULT 0,
                            `borrow_set` tinyint(1) DEFAULT 1,
                            `system_query` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_purview`
--

INSERT INTO `tb_purview` (`id`, `system_set`, `reader_set`, `book_set`, `borrow_set`, `system_query`) VALUES
                                                                                                        (1, 1, 1, 1, 1, 1),
                                                                                                        (2, 0, 0, 1, 1, 1),
                                                                                                        (3, 0, 0, 1, 1, 1),
                                                                                                        (4, 0, 0, 0, 0, 1),
                                                                                                        (5, 0, 0, 1, 0, 1),
                                                                                                        (6, 0, 1, 0, 0, 0),
                                                                                                        (9, 1, 1, 1, 1, 1),
                                                                                                        (10, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reader`
--

CREATE TABLE `tb_reader` (
                           `id` int(10) UNSIGNED NOT NULL,
                           `name` varchar(20) DEFAULT NULL,
                           `sex` varchar(4) DEFAULT NULL,
                           `barcode` varchar(30) NOT NULL,
                           `vocation` varchar(50) DEFAULT NULL,
                           `birthday` date DEFAULT NULL,
                           `paper_type` varchar(10) DEFAULT NULL,
                           `paper_no` varchar(20) DEFAULT NULL,
                           `telephone` varchar(20) DEFAULT NULL,
                           `email` varchar(20) DEFAULT NULL,
                           `create_date` date DEFAULT NULL,
                           `operator` varchar(30) DEFAULT NULL,
                           `remark` text DEFAULT NULL,
                           `type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_reader`
--

INSERT INTO `tb_reader` (`id`, `name`, `sex`, `barcode`, `vocation`, `birthday`, `paper_type`, `paper_no`, `telephone`, `email`, `create_date`, `operator`, `remark`, `type_id`) VALUES
                                                                                                                                                                                   (4, 'test', 'fema', '20110224000001', 'student', '2010-07-10', 'ID card', '220104201007100001', '84978981', 'wgh717@sohu.com', '2011-02-24', 'mr', 'none', 4),
                                                                                                                                                                                   (5, 'wgh', 'fema', '20110224000002', 'programmer', '1980-07-10', '\r\nWork Per', '20010228', '84978981', 'wgh717@sohu.com', '2011-02-24', 'mr', 'none', 4),
                                                                                                                                                                                   (6, 'admin', 'male', '8866', 'operation and maintenance\r\n', '2020-01-16', 'ID card\r\n', '362426xxxx', '337845818', '337845818', '2011-02-24', 'mr', 'Administrator！！！', 1),
                                                                                                                                                                                   (8, 'librarian', 'male', '20200202', 'librarian', '2020-02-02', 'ID card\r\n', '3362426yyy', '18870', '18870', '2020-02-03', 'root', '\r\nWelcome to Dreamers! ! !', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tb_readertype`
--

CREATE TABLE `tb_readertype` (
                               `id` int(10) UNSIGNED NOT NULL,
                               `name` varchar(50) DEFAULT NULL,
                               `allow_borrow_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tb_readertype`
--

INSERT INTO `tb_readertype` (`id`, `name`, `allow_borrow_amount`) VALUES
                                                                    (1, 'admin', 100),
                                                                    (4, 'student', 5),
                                                                    (12, 'citizens', 10),
                                                                    (17, 'staff', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bookborrow`
--
ALTER TABLE `tb_bookborrow`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_book_id` (`book_id`) USING BTREE,
  ADD KEY `fk_reader_id` (`reader_id`) USING BTREE;

--
-- Indexes for table `tb_bookcase`
--
ALTER TABLE `tb_bookcase`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_bookinfo`
--
ALTER TABLE `tb_bookinfo`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_book_type_id` (`type_id`) USING BTREE,
  ADD KEY `fk_isbn` (`ISBN`) USING BTREE,
  ADD KEY `fk_bookcase_id` (`bookcase`) USING BTREE;

--
-- Indexes for table `tb_bookreturn`
--
ALTER TABLE `tb_bookreturn`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_book_id_return` (`book_id`) USING BTREE,
  ADD KEY `fk_reader_id_return` (`reader_id`) USING BTREE;

--
-- Indexes for table `tb_booktype`
--
ALTER TABLE `tb_booktype`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_library`
--
ALTER TABLE `tb_library`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_manager`
--
ALTER TABLE `tb_manager`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_parameter`
--
ALTER TABLE `tb_parameter`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_publishing`
--
ALTER TABLE `tb_publishing`
  ADD PRIMARY KEY (`isbn`) USING BTREE;

--
-- Indexes for table `tb_purview`
--
ALTER TABLE `tb_purview`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tb_reader`
--
ALTER TABLE `tb_reader`
  ADD PRIMARY KEY (`id`,`barcode`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `fk_reader_type` (`type_id`) USING BTREE;

--
-- Indexes for table `tb_readertype`
--
ALTER TABLE `tb_readertype`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bookborrow`
--
ALTER TABLE `tb_bookborrow`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_bookcase`
--
ALTER TABLE `tb_bookcase`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_bookinfo`
--
ALTER TABLE `tb_bookinfo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_bookreturn`
--
ALTER TABLE `tb_bookreturn`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_booktype`
--
ALTER TABLE `tb_booktype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_manager`
--
ALTER TABLE `tb_manager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tb_purview`
--
ALTER TABLE `tb_purview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `tb_reader`
--
ALTER TABLE `tb_reader`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_readertype`
--
ALTER TABLE `tb_readertype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_bookborrow`
--
ALTER TABLE `tb_bookborrow`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `tb_bookinfo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reader_id` FOREIGN KEY (`reader_id`) REFERENCES `tb_reader` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_bookinfo`
--
ALTER TABLE `tb_bookinfo`
  ADD CONSTRAINT `fk_book_type_id` FOREIGN KEY (`type_id`) REFERENCES `tb_booktype` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookcase_id` FOREIGN KEY (`bookcase`) REFERENCES `tb_bookcase` (`id`) ON UPDATE CASCADE,
                                                                                                                                                                                                            ADD CONSTRAINT `fk_isbn` FOREIGN KEY (`ISBN`) REFERENCES `tb_publishing` (`isbn`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_bookreturn`
--
ALTER TABLE `tb_bookreturn`
  ADD CONSTRAINT `fk_book_id_return` FOREIGN KEY (`book_id`) REFERENCES `tb_bookinfo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reader_id_return` FOREIGN KEY (`reader_id`) REFERENCES `tb_reader` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tb_reader`
--
ALTER TABLE `tb_reader`
  ADD CONSTRAINT `fk_reader_type` FOREIGN KEY (`type_id`) REFERENCES `tb_readertype` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
