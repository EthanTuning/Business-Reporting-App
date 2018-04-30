-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2018 at 04:40 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `business-reports-app-db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_invoice_totals` ()  BEGIN

UPDATE invoice INNER JOIN temp_invoice_totals ON invoice.invoice_num = temp_invoice_totals.invoice_num SET invoice.total = temp_invoice_totals.total;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sales_ytd` ()  BEGIN
	UPDATE customer INNER JOIN temp_sales_ytd ON Customer.cust_number = temp_sales_ytd.cust_number SET customer.sales_ytd = temp_sales_ytd.Sales_ytd
	WHERE ((temp_sales_ytd.year)=year(CURDATE()));
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_number` int(5) NOT NULL,
  `company` varchar(100) NOT NULL,
  `billing_address` varchar(100) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `sales_ytd` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_number`, `company`, `billing_address`, `shipping_address`, `contact`, `phone`, `sales_ytd`) VALUES
(19, 'Avista', '123 W. 1st St. Spokane, WA, 99205', '1123 N. Third Ave. Spokane, WA, 99205', 'billh@avista.com', 5096854487, 212000),
(21, 'Microsoft Seattle Branch', '17 N. 2nd St. Seattle, WA, 99132', '17 N. 2nd St. Seattle, WA, 99132', 'sales@microsoft.com', 5095664498, 36000),
(24, 'Apple Seattle Branch', '134 Front St. Seattle, WA, 78995', '232 Wall St. Cupertino, CA, 78995', 'contracts@apple.com', 4567888899, 30000),
(28, 'Google Seattle Branch', '1322 W. Mountain Ave. Seattle, WA, 95645', '1600 Amphitheatre Parkway Mountain View, CA 78898', 'phil@sales.google.com', 7894524455, 20000),
(30, 'WordPress Foundation', '123 Wall St. San Francisco, CA, 77884', '123 Wall St. San Francisco, CA, 77884', 'jonburge@wordpress.com', 7784524451, 1000),
(32, 'Adobe Seattle', '34 W. First St.', '34 W. First St.', 'josh@sales.adobe.com', 9986632563, 0),
(34, 'PayPal New York Branch', '958 Park Ave. New York, NY, 88459', '958 Park Ave. New York, NY, 88459', 'sarah@consulting.paypal.com', 4561232145, 45000),
(36, 'Cisco Seattle', '39 N. Rainer Ave. Seattle, WA, 99043', '39 N. Rainer Ave. Seattle, WA, 99043', 'jamie@cisco.com', 7895632214, 580000),
(38, 'H & H Law', '12 First Ave. Spokane, WA, 99201', '12 First Ave. Spokane, WA, 99201', 'nancy@hhlaw.com', 5095625648, 170000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `sku` int(5) NOT NULL,
  `description` varchar(100) NOT NULL,
  `qoh` int(50) NOT NULL,
  `unit_weight` bigint(50) NOT NULL,
  `unit_price` bigint(100) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`sku`, `description`, `qoh`, `unit_weight`, `unit_price`, `supplier_id`) VALUES
(1, 'Web Plugin', 100, 0, 1000, 17),
(2, 'Website Development', 1000, 0, 6000, 17),
(3, 'Website Strategy', 1000, 0, 2000, 12),
(4, 'Web Presence Help', 500, 0, 500, 12),
(5, 'Web Application Development', 10000, 0, 8000, 3),
(6, 'Web Hosting', 10000, 0, 100, 18),
(7, 'Desktop Application Development', 10000, 0, 1000, 3),
(8, 'Random Development Services', 1000, 0, 500, 21),
(9, 'Business Consulting', 100, 0, 1000, 7),
(10, 'Law Advice', 100, 0, 20000, 6),
(11, 'Branding', 1000, 0, 1000, 2),
(12, 'Re-Branding', 1000, 0, 5000, 2),
(13, 'Web Design Strategy', 1000, 0, 500, 2),
(14, 'Logo Creation', 1000, 0, 1000, 2),
(15, 'Application UX Strategy', 1000, 0, 5000, 2),
(16, 'Data Analytics Research', 2000, 0, 10000, 16),
(17, 'Market Research', 2000, 0, 10000, 16),
(18, 'Proof of Concept', 2000, 0, 100000, 15),
(19, 'Misc. Research', 5000, 0, 50000, 16),
(20, 'Market Strategy', 5000, 0, 10000, 15),
(21, 'Misc. Consulting', 10000, 0, 5000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_num` int(5) NOT NULL,
  `order_date` date NOT NULL,
  `shipped_date` date NOT NULL,
  `total` bigint(100) NOT NULL,
  `cust_number` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_num`, `order_date`, `shipped_date`, `total`, `cust_number`, `status`) VALUES
(1, '2018-04-04', '2018-04-24', 27000, 19, 'Filled'),
(3, '2018-04-02', '2018-04-30', 175000, 19, 'Filled'),
(5, '2018-02-13', '2018-04-13', 10000, 19, 'Filled'),
(7, '2018-01-16', '2018-04-19', 6000, 21, 'Filled'),
(9, '2018-02-12', '2018-03-13', 25000, 21, 'Filled'),
(11, '2017-11-21', '2018-01-25', 22000, 21, 'Filled'),
(13, '2017-12-11', '2018-03-13', 202500, 21, 'Filled'),
(15, '2018-04-01', '0000-00-00', 5000, 21, 'Open'),
(17, '2018-01-09', '0000-00-00', 30000, 24, 'Open'),
(19, '2018-04-02', '0000-00-00', 20000, 28, 'Open'),
(21, '2018-01-15', '2018-04-17', 1000, 30, 'Filled'),
(23, '2017-08-07', '2018-01-17', 60000, 32, 'Filled'),
(25, '2017-12-18', '2018-04-09', 34000, 32, 'Filled'),
(27, '2018-04-01', '2018-04-30', 40000, 34, 'Filled'),
(29, '2018-04-09', '2018-04-18', 5000, 34, 'Filled'),
(31, '2017-11-20', '2017-12-14', 6000, 38, 'Filled'),
(33, '2018-04-02', '2018-04-23', 170000, 38, 'Filled'),
(35, '2017-07-11', '2018-01-16', 20000, 38, 'Filled'),
(37, '2018-04-01', '0000-00-00', 580000, 36, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `line_item`
--

CREATE TABLE `line_item` (
  `line_num` int(5) NOT NULL,
  `invoice_num` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `line_item`
--

INSERT INTO `line_item` (`line_num`, `invoice_num`, `sku`, `quantity`) VALUES
(1, 1, 15, 3),
(2, 1, 11, 1),
(3, 1, 15, 2),
(4, 1, 11, 1),
(5, 27, 10, 2),
(6, 29, 7, 5),
(7, 3, 19, 3),
(8, 3, 12, 5),
(9, 7, 11, 4),
(10, 7, 14, 2),
(11, 9, 12, 5),
(12, 11, 4, 4),
(13, 11, 1, 10),
(14, 11, 6, 100),
(15, 13, 18, 2),
(16, 13, 8, 1),
(17, 13, 14, 2),
(18, 35, 10, 1),
(19, 33, 16, 12),
(20, 33, 19, 1),
(21, 31, 15, 1),
(22, 31, 8, 2),
(23, 21, 11, 1),
(24, 23, 21, 12),
(25, 25, 14, 1),
(26, 25, 15, 1),
(27, 25, 5, 1),
(28, 25, 16, 2),
(29, 19, 10, 1),
(30, 17, 20, 1),
(31, 17, 20, 2),
(32, 15, 12, 1),
(33, 37, 15, 2),
(34, 37, 16, 2),
(35, 37, 19, 5),
(36, 37, 18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `billing_address` varchar(100) NOT NULL,
  `shipping_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `company`, `contact`, `phone`, `billing_address`, `shipping_address`) VALUES
(2, 'Waterfall Design Firm', 'karen@wafterfalldesign.com', 5095698749, '12 River Rd. Spokane Valley, WA, 92381', '12 River Rd. Spokane Valley, WA, 92381'),
(3, 'Code Monkeys', 'joshtheboss@codemonks.com', 5094567895, '123 W. Frist Ave. Spokane, WA, 99432', '123 W. Frist Ave. Spokane, WA, 99432'),
(6, 'Johnson Law Firm', 'kayla@jlawfirm.com', 5097894562, '1 Fifth St. Seattle, WA, 49933', '1 Fifth St. Seattle, WA, 49933'),
(7, 'Kirby Business Accociates', 'jonkirby@kirbybusiness.com', 5095467874, '1234 Martin Ave. Spokane, WA, 98483', '1234 Martin Ave. Spokane, WA, 98483'),
(9, 'Jace Consulting', 'debjace@jaceconsult.com', 5078898514, '332 S. Ninth Ave. Boise, ID, 99344', '332 S. Ninth Ave. Boise, ID, 99344'),
(12, 'Valley Web Help', 'joshua@valleywebhelp.com', 5098964564, '3445 N. Northtown St. Spokane Valley, WA, 99484', '3445 N. Northtown St. Spokane Valley, WA, 99484'),
(15, 'Market Mob', 'damian@marketmob.com', 8573334985, '123 N. 1st St. New York, NY, 48948', '123 N. 1st St. New York, NY, 48948'),
(16, 'Eastern Wasnington R/D', 'bobjt@ewrd.com', 5094943333, '3423 Point Rd. Spokane, WA, 99208', '3423 Point Rd. Spokane, WA, 99208'),
(17, 'Spokane Web Development', 'margretf@swd.com', 5098964564, '123 W. Junction Rd. Spokane, WA, 99205', '123 W. Junction Rd. Spokane, WA, 99205'),
(18, 'Amazon Web Services', 'joe@aws.com', 6581237896, '13. W. Ninth St. Seattle, WA, 95645', '13. W. Ninth St. Seattle, WA, 95645'),
(21, 'Private Contracts', '', 0, '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `temp_invoice_totals`
-- (See below for the actual view)
--
CREATE TABLE `temp_invoice_totals` (
`total` decimal(65,0)
,`invoice_num` int(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `temp_sales_ytd`
-- (See below for the actual view)
--
CREATE TABLE `temp_sales_ytd` (
`sales_ytd` decimal(65,0)
,`year` varchar(4)
,`cust_number` int(5)
);

-- --------------------------------------------------------

--
-- Structure for view `temp_invoice_totals`
--
DROP TABLE IF EXISTS `temp_invoice_totals`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `temp_invoice_totals`  AS  select sum((`inventory`.`unit_price` * `line_item`.`quantity`)) AS `total`,`invoice`.`invoice_num` AS `invoice_num` from (`invoice` join (`inventory` join `line_item` on((`inventory`.`sku` = `line_item`.`sku`))) on((`invoice`.`invoice_num` = `line_item`.`invoice_num`))) group by `invoice`.`invoice_num` ;

-- --------------------------------------------------------

--
-- Structure for view `temp_sales_ytd`
--
DROP TABLE IF EXISTS `temp_sales_ytd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `temp_sales_ytd`  AS  select sum(`invoice`.`total`) AS `sales_ytd`,date_format(`invoice`.`order_date`,'%Y') AS `year`,`customer`.`cust_number` AS `cust_number` from (`customer` join `invoice` on((`customer`.`cust_number` = `invoice`.`cust_number`))) group by date_format(`invoice`.`order_date`,'%Y'),`customer`.`cust_number` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_number`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`sku`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD UNIQUE KEY `sku_2` (`sku`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_num`),
  ADD KEY `cust_number` (`cust_number`);

--
-- Indexes for table `line_item`
--
ALTER TABLE `line_item`
  ADD PRIMARY KEY (`line_num`),
  ADD UNIQUE KEY `line_num` (`line_num`),
  ADD KEY `invoice_num` (`invoice_num`),
  ADD KEY `sku` (`sku`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_number` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `sku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `line_item`
--
ALTER TABLE `line_item`
  MODIFY `line_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`cust_number`) REFERENCES `customer` (`cust_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `line_item`
--
ALTER TABLE `line_item`
  ADD CONSTRAINT `line_item_ibfk_1` FOREIGN KEY (`invoice_num`) REFERENCES `invoice` (`invoice_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `line_item_ibfk_2` FOREIGN KEY (`sku`) REFERENCES `inventory` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
