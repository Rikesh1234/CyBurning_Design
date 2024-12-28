-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 03:02 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `account`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `A_Id` int(11) NOT NULL,
  `A_Name` varchar(225) NOT NULL,
  `A_Type` varchar(225) NOT NULL,
  `U_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`A_Id`, `A_Name`, `A_Type`, `U_Id`) VALUES
(1, 'Capital', 'Cr', 1),
(2, 'Opening Stock', 'Cr', 1),
(3, 'Closing Stock', 'Dr', 1),
(4, 'Discount Received', 'Income', 1),
(5, 'Discount Allowed', 'Loss', 1),
(6, 'Account Receivable', 'Dr', 1),
(7, 'Account Payable', 'Cr', 1),
(8, 'Gain on sale of asset', 'Income', 1),
(9, 'Loss on the sale of asset', 'Loss', 1),
(10, 'Capital', 'Cr', 2),
(11, 'Opening Stock', 'Cr', 2),
(12, 'Closing Stock', 'Dr', 2),
(13, 'Discount Received', 'Income', 2),
(14, 'Discount Allowed', 'Loss', 2),
(15, 'Account Receivable', 'Dr', 2),
(16, 'Account Payable', 'Cr', 2),
(17, 'Gain on sale of asset', 'Income', 2),
(18, 'Loss on the sale of asset', 'Loss', 2);

-- --------------------------------------------------------

--
-- Table structure for table `commerce`
--

CREATE TABLE `commerce` (
  `SNO` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `NatureOfTranc` enum('Dr','Cr') DEFAULT NULL,
  `Type` varchar(25) NOT NULL,
  `Date` date NOT NULL,
  `InvoiceNO` varchar(225) NOT NULL,
  `Quantity` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `Discount` double DEFAULT NULL,
  `Credit` double DEFAULT NULL,
  `SalesPerson` varchar(225) DEFAULT NULL,
  `recordable` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commerce`
--

INSERT INTO `commerce` (`SNO`, `TransactionId`, `NatureOfTranc`, `Type`, `Date`, `InvoiceNO`, `Quantity`, `Amount`, `Discount`, `Credit`, `SalesPerson`, `recordable`) VALUES
(1, 'R0R001', 'Dr', 'purchase', '2023-11-18', '6543', '4', 160, 0, 0, NULL, 'yes'),
(2, 'R0R002', 'Dr', 'purchase', '2024-10-04', '5156', '2', 100, 0, 0, NULL, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `commerceasset`
--

CREATE TABLE `commerceasset` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `Date` date NOT NULL,
  `InvoiceNo` varchar(225) NOT NULL,
  `Item` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `Discount` double NOT NULL,
  `Credit` double NOT NULL,
  `state` enum('running','sold') DEFAULT NULL,
  `type` enum('normal','payable','payable-paid') DEFAULT NULL,
  `recordable` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commercegain`
--

CREATE TABLE `commercegain` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `recordable` enum('yes','no','','') NOT NULL,
  `Date` date NOT NULL,
  `Account` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `Discount` double NOT NULL,
  `Credit` double NOT NULL,
  `InvoiceNo` varchar(225) DEFAULT NULL,
  `Type` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commerceliabilities`
--

CREATE TABLE `commerceliabilities` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `recordable` enum('yes','no','','') NOT NULL,
  `Date` date NOT NULL,
  `Account` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `Discount` double NOT NULL,
  `state` enum('remaining','paid','remaining-paid','','') NOT NULL,
  `ContactNo` varchar(225) NOT NULL,
  `ADDRESS` varchar(225) NOT NULL,
  `credit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commercemiscellaneous`
--

CREATE TABLE `commercemiscellaneous` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `NatureOfTranc` enum('Dr','Cr','','') NOT NULL,
  `Date` date NOT NULL,
  `InvoiceNo` varchar(225) NOT NULL,
  `Account` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `discount` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `recordable` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commercemiscellaneous`
--

INSERT INTO `commercemiscellaneous` (`SNo`, `TransactionId`, `NatureOfTranc`, `Date`, `InvoiceNo`, `Account`, `Amount`, `discount`, `credit`, `recordable`) VALUES
(1, 'R8R001', 'Cr', '2023-11-18', '-', 'Capital', 1000000, 0, 0, 'yes'),
(2, 'R8R002', 'Dr', '2023-11-01', '--------', 'Opening Stock', 0, 0, 0, 'yes'),
(3, 'R8R003', 'Dr', '2023-10-31', '--------', 'Closing Stock', 0, 0, 0, 'yes'),
(4, 'R8R004', 'Dr', '2024-10-01', '--------', 'Opening Stock', 160, 0, 0, 'yes'),
(5, 'R8R005', 'Dr', '2024-09-30', '--------', 'Closing Stock', 160, 0, 0, 'yes'),
(6, 'R8R006', 'Cr', '2024-10-04', '-', 'Capital', 90000, 0, 0, 'yes'),
(7, 'R8R007', 'Dr', '2024-10-01', '--------', 'Opening Stock', 0, 0, 0, 'yes'),
(8, 'R8R008', 'Dr', '2024-09-30', '--------', 'Closing Stock', 0, 0, 0, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `commerseexpenses`
--

CREATE TABLE `commerseexpenses` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `Type` enum('Factory','Office','','') NOT NULL,
  `Date` date NOT NULL,
  `InvoiceNo` varchar(225) NOT NULL,
  `Account` varchar(225) NOT NULL,
  `Amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `recordable` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commerseloss`
--

CREATE TABLE `commerseloss` (
  `SNo` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `recordable` enum('yes','no','','') NOT NULL,
  `Date` date NOT NULL,
  `Account` varchar(225) NOT NULL,
  `Amount` double NOT NULL,
  `Discount` double NOT NULL,
  `Credit` double NOT NULL,
  `invoice` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `creates`
--

CREATE TABLE `creates` (
  `R_Id` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `TransactionCode` int(11) DEFAULT NULL,
  `type` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creates`
--

INSERT INTO `creates` (`R_Id`, `TransactionId`, `TransactionCode`, `type`) VALUES
(1, 'R8R001', 1, 'Capital'),
(2, 'R8R002', 2, 'Opening Stock'),
(3, 'R8R003', 3, 'Closing Stock'),
(4, 'R0R001', 1, 'purchase'),
(5, 'R8R004', 4, 'Opening Stock'),
(6, 'R8R005', 5, 'Closing Stock'),
(7, 'R8R006', 6, 'Capital'),
(8, 'R8R007', 7, 'Opening Stock'),
(9, 'R8R008', 8, 'Closing Stock'),
(10, 'R0R002', 2, 'purchase');

-- --------------------------------------------------------

--
-- Table structure for table `defines`
--

CREATE TABLE `defines` (
  `A_Id` int(11) NOT NULL,
  `TransactionId` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `defines`
--

INSERT INTO `defines` (`A_Id`, `TransactionId`) VALUES
(1, 'R8R001'),
(2, 'R8R002'),
(3, 'R8R003'),
(2, 'R8R004'),
(3, 'R8R005'),
(10, 'R8R006'),
(11, 'R8R007'),
(12, 'R8R008');

-- --------------------------------------------------------

--
-- Table structure for table `does`
--

CREATE TABLE `does` (
  `U_Id` int(13) NOT NULL,
  `TransactionId` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `does`
--

INSERT INTO `does` (`U_Id`, `TransactionId`) VALUES
(1, 'R8R001'),
(1, 'R8R002'),
(1, 'R8R003'),
(1, 'R0R001'),
(1, 'R8R004'),
(1, 'R8R005'),
(2, 'R8R006'),
(2, 'R8R007'),
(2, 'R8R008'),
(2, 'R0R002');

-- --------------------------------------------------------

--
-- Table structure for table `exportstock`
--

CREATE TABLE `exportstock` (
  `export_Id` int(13) NOT NULL,
  `stock_Id` int(13) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(8) NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `importstock`
--

CREATE TABLE `importstock` (
  `Import_Id` int(13) NOT NULL,
  `stock_Id` int(13) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(8) NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `importstock`
--

INSERT INTO `importstock` (`Import_Id`, `stock_Id`, `date`, `quantity`, `rate`, `amount`) VALUES
(1, 1, '2023-11-18', 4, 40, 160),
(2, 2, '2024-10-04', 2, 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `O_Id` int(13) NOT NULL,
  `O_Name` varchar(225) NOT NULL,
  `O_Address` varchar(225) NOT NULL,
  `O_Contact` varchar(20) NOT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `logo` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`O_Id`, `O_Name`, `O_Address`, `O_Contact`, `currency`, `logo`) VALUES
(1, 'R.Store', 'Maru, Tole', '9841221213', NULL, NULL),
(2, 'abc', 'ABC', '9841221213', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_Id` int(11) NOT NULL,
  `P_Name` varchar(225) NOT NULL,
  `Categories` varchar(225) NOT NULL,
  `U_ID` int(13) NOT NULL,
  `BarCode_Id` varchar(50) DEFAULT NULL,
  `PriceOfPurchase` double DEFAULT NULL,
  `PriceOfSales` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`P_Id`, `P_Name`, `Categories`, `U_ID`, `BarCode_Id`, `PriceOfPurchase`, `PriceOfSales`) VALUES
(1, 'coca-cola', 'drinks', 1, '', 40, 60),
(2, 'Coca-Cola', 'drinks', 2, '', 50, 60);

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `U_Id` int(13) NOT NULL,
  `S_Id` int(13) NOT NULL,
  `Unit_Id` int(13) NOT NULL,
  `P_Id` int(13) NOT NULL,
  `Stock_Id` int(13) NOT NULL,
  `TransactionId` varchar(225) DEFAULT NULL,
  `type` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`U_Id`, `S_Id`, `Unit_Id`, `P_Id`, `Stock_Id`, `TransactionId`, `type`) VALUES
(1, 1, 1, 1, 1, 'R0R001', 'purchase'),
(2, 3, 2, 2, 2, 'R0R002', 'purchase');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `R_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `particulars` varchar(225) NOT NULL,
  `Type` enum('Dr','Cr','','') NOT NULL,
  `Amount` double NOT NULL,
  `account` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`R_Id`, `Date`, `particulars`, `Type`, `Amount`, `account`) VALUES
(1, '2023-11-18', 'By starting the business', 'Dr', 1000000, 'Cash'),
(2, '2023-11-18', 'For Opening Stock a/c', 'Cr', 0, 'Cash'),
(3, '2023-11-18', 'For Closing Stock a/c', 'Cr', 0, 'Cash'),
(4, '2023-11-18', 'By purchasing the item', 'Cr', 160, 'Cash'),
(5, '2024-10-04', 'For Opening Stock a/c', 'Cr', 160, 'Cash'),
(6, '2024-10-04', 'For Closing Stock a/c', 'Cr', 160, 'Cash'),
(7, '2024-10-04', 'By starting the business', 'Dr', 90000, 'Cash'),
(8, '2024-10-04', 'For Opening Stock a/c', 'Cr', 0, 'Cash'),
(9, '2024-10-04', 'For Closing Stock a/c', 'Cr', 0, 'Cash'),
(10, '2024-10-04', 'By purchasing the item', 'Cr', 100, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `salesreport`
--

CREATE TABLE `salesreport` (
  `Sales_Id` int(11) NOT NULL,
  `Bill_No` varchar(225) NOT NULL,
  `TransactionId` varchar(225) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `Stock_Id` int(13) NOT NULL,
  `Item` varchar(225) NOT NULL,
  `quantity` int(8) NOT NULL,
  `U_Id` int(13) NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Stock_Id`, `Item`, `quantity`, `U_Id`, `rate`, `amount`) VALUES
(1, 'coca-cola', 4, 1, 40, 160),
(2, 'Coca-Cola', 2, 2, 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `sub_account`
--

CREATE TABLE `sub_account` (
  `Sub_A_Id` int(11) NOT NULL,
  `Sub_A_Name` varchar(225) NOT NULL,
  `A_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `S_Id` int(13) NOT NULL,
  `S_Name` varchar(225) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `U_Id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`S_Id`, `S_Name`, `contact`, `U_Id`) VALUES
(1, 'Rikesh', '9842445678', 1),
(2, 'Rikeshsss', '9842445678888', 1),
(3, 'rikesh', '9841221213', 2);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `U_Id` int(11) NOT NULL,
  `U_Name` varchar(225) NOT NULL,
  `U_Per` int(13) NOT NULL,
  `User_Id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`U_Id`, `U_Name`, `U_Per`, `User_Id`) VALUES
(1, 'piece', 1, 1),
(2, 'pcs', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_Id` int(13) NOT NULL,
  `name` varchar(225) NOT NULL,
  `U_Name` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `type` enum('admin','employee') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_Id`, `name`, `U_Name`, `password`, `Email`, `type`) VALUES
(1, 'Raj Karmacharya', 'raj123', '202CB962AC59075B964B07152D234B70', 'karmacharyar4@gmail.com', 'admin'),
(2, 'ABC', 'abc', '202CB962AC59075B964B07152D234B70', 'ABC', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `worksat`
--

CREATE TABLE `worksat` (
  `U_Id` int(13) NOT NULL,
  `O_Id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worksat`
--

INSERT INTO `worksat` (`U_Id`, `O_Id`) VALUES
(1, 1),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`A_Id`);

--
-- Indexes for table `commerce`
--
ALTER TABLE `commerce`
  ADD PRIMARY KEY (`SNO`,`TransactionId`);

--
-- Indexes for table `commerceasset`
--
ALTER TABLE `commerceasset`
  ADD PRIMARY KEY (`SNo`,`TransactionId`) USING BTREE;

--
-- Indexes for table `commercegain`
--
ALTER TABLE `commercegain`
  ADD PRIMARY KEY (`SNo`,`TransactionId`);

--
-- Indexes for table `commerceliabilities`
--
ALTER TABLE `commerceliabilities`
  ADD PRIMARY KEY (`SNo`,`TransactionId`);

--
-- Indexes for table `commercemiscellaneous`
--
ALTER TABLE `commercemiscellaneous`
  ADD PRIMARY KEY (`SNo`,`TransactionId`);

--
-- Indexes for table `commerseexpenses`
--
ALTER TABLE `commerseexpenses`
  ADD PRIMARY KEY (`SNo`,`TransactionId`) USING BTREE;

--
-- Indexes for table `commerseloss`
--
ALTER TABLE `commerseloss`
  ADD PRIMARY KEY (`SNo`,`TransactionId`);

--
-- Indexes for table `creates`
--
ALTER TABLE `creates`
  ADD KEY `report_Fk` (`R_Id`);

--
-- Indexes for table `defines`
--
ALTER TABLE `defines`
  ADD KEY `account_FK` (`A_Id`);

--
-- Indexes for table `does`
--
ALTER TABLE `does`
  ADD KEY `FK-user` (`U_Id`);

--
-- Indexes for table `exportstock`
--
ALTER TABLE `exportstock`
  ADD PRIMARY KEY (`export_Id`);

--
-- Indexes for table `importstock`
--
ALTER TABLE `importstock`
  ADD PRIMARY KEY (`Import_Id`),
  ADD KEY `FK-stock` (`stock_Id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`O_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_Id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`R_Id`);

--
-- Indexes for table `salesreport`
--
ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`Sales_Id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`Stock_Id`);

--
-- Indexes for table `sub_account`
--
ALTER TABLE `sub_account`
  ADD PRIMARY KEY (`Sub_A_Id`),
  ADD KEY `sub_Account_FK` (`A_Id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`S_Id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`U_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_Id`);

--
-- Indexes for table `worksat`
--
ALTER TABLE `worksat`
  ADD KEY `FK_USER` (`U_Id`),
  ADD KEY `FK_Organization` (`O_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `A_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `commerce`
--
ALTER TABLE `commerce`
  MODIFY `SNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commerceasset`
--
ALTER TABLE `commerceasset`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commercegain`
--
ALTER TABLE `commercegain`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commerceliabilities`
--
ALTER TABLE `commerceliabilities`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commercemiscellaneous`
--
ALTER TABLE `commercemiscellaneous`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `commerseexpenses`
--
ALTER TABLE `commerseexpenses`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commerseloss`
--
ALTER TABLE `commerseloss`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exportstock`
--
ALTER TABLE `exportstock`
  MODIFY `export_Id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `importstock`
--
ALTER TABLE `importstock`
  MODIFY `Import_Id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `O_Id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `R_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `Sales_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `Stock_Id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_account`
--
ALTER TABLE `sub_account`
  MODIFY `Sub_A_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `S_Id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `U_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_Id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creates`
--
ALTER TABLE `creates`
  ADD CONSTRAINT `report_Fk` FOREIGN KEY (`R_Id`) REFERENCES `report` (`R_Id`);

--
-- Constraints for table `defines`
--
ALTER TABLE `defines`
  ADD CONSTRAINT `account_FK` FOREIGN KEY (`A_Id`) REFERENCES `account` (`A_Id`);

--
-- Constraints for table `does`
--
ALTER TABLE `does`
  ADD CONSTRAINT `FK-user` FOREIGN KEY (`U_Id`) REFERENCES `user` (`U_Id`);

--
-- Constraints for table `importstock`
--
ALTER TABLE `importstock`
  ADD CONSTRAINT `FK-stock` FOREIGN KEY (`stock_Id`) REFERENCES `stock` (`Stock_Id`);

--
-- Constraints for table `sub_account`
--
ALTER TABLE `sub_account`
  ADD CONSTRAINT `sub_Account_FK` FOREIGN KEY (`A_Id`) REFERENCES `account` (`A_Id`);

--
-- Constraints for table `worksat`
--
ALTER TABLE `worksat`
  ADD CONSTRAINT `FK_Organization` FOREIGN KEY (`O_Id`) REFERENCES `organization` (`O_Id`),
  ADD CONSTRAINT `FK_USER` FOREIGN KEY (`U_Id`) REFERENCES `user` (`U_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
