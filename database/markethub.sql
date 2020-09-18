-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 18, 2020 lúc 06:29 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `markethub`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_user`
--

CREATE TABLE `group_user` (
  `group_id` int(11) NOT NULL,
  `group_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_order` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `order_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category_id` int(11) NOT NULL,
  `short_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `long_description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(2) DEFAULT NULL,
  `list_image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_like` int(11) DEFAULT NULL,
  `total_view` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `category_id`, `short_description`, `long_description`, `discount`, `list_image`, `avatar`, `quantity`, `total_like`, `total_view`, `rate`, `status`, `create_date`, `update_date`) VALUES
(1, '1', 100, 1, '1', 'cacban', 2, NULL, 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:02:35', '2020-09-18 04:02:35'),
(2, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:19:03', '2020-09-18 04:19:03'),
(3, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:30:13', '2020-09-18 04:30:13'),
(4, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:31:35', '2020-09-18 04:31:35'),
(5, '$name', 100, 1, '$shortDescription', '$longDescription', 2, '$listImage', '$avatar', 3, 4, 5, 6, 7, '2020-09-18 04:38:55', '2020-09-18 04:38:55'),
(6, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:39:56', '2020-09-18 04:39:56'),
(7, '$name', 100, 1, '$shortDescription', '$longDescription', 2, '$listImage', '$avatar', 3, 4, 5, 6, 7, '2020-09-18 04:50:03', '2020-09-18 04:50:03'),
(8, '$name', 100, 1, '$shortDescription', '$longDescription', 2, '$listImage', '$avatar', 3, 4, 5, 6, 7, '2020-09-18 04:50:10', '2020-09-18 04:50:10'),
(9, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:51:21', '2020-09-18 04:51:21'),
(10, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:19:03', '2020-09-18 04:19:03'),
(11, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:52:40', '2020-09-18 04:52:40'),
(12, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:19:03', '2020-09-18 04:19:03'),
(13, 'vinh', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:57:40', '2020-09-18 04:57:40'),
(14, '1', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 04:59:57', '2020-09-18 04:59:57'),
(15, 'vinh', 100, 1, '1', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 05:00:22', '2020-09-18 05:00:22'),
(16, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 4, 5, 6, 7, '2020-09-18 05:01:33', '2020-09-18 05:01:33'),
(17, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, 5, 0, '2020-09-18 05:55:11', '2020-09-18 05:55:11'),
(18, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, 5, 0, '2020-09-18 06:00:33', '2020-09-18 06:00:33'),
(19, 'vinh', 100, 11, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, 5, 0, '2020-09-18 06:00:53', '2020-09-18 06:00:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewed_products` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`group_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `group_user`
--
ALTER TABLE `group_user`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
