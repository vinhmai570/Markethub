-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 24, 2020 lúc 09:09 AM
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
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_level_2` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_level_2`) VALUES
(1, 'book', NULL),
(2, 'table', NULL),
(3, 'phone', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_user`
--

CREATE TABLE `group_user` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `group_user`
--

INSERT INTO `group_user` (`group_id`, `group_name`) VALUES
(1, 'admin'),
(2, 'editor'),
(3, 'user');

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

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `total_price`, `quantity`, `product_order`, `status`, `order_date`) VALUES
(1, 4, 10000, 9, '[\r\n    {\r\n        \"id\":\"29\",\r\n        \"name\":\"vinh\",\r\n        \"price\":100,\r\n        \"avatar\":\"avatar\",\r\n        \"discount\":2,\r\n        \"user_id\":1,\r\n        \"quantity\":3\r\n    },\r\n    {\r\n        \"id\":\"31\",\r\n        \"name\":\"vinh\",\r\n        \"price\":100,\r\n        \"avatar\":\"avatar\",\r\n        \"discount\":2,\r\n        \"user_id\":1,\r\n        \"quantity\":3\r\n    }\r\n]', 1, 0);

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
  `total_order` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `category_id`, `short_description`, `long_description`, `discount`, `list_image`, `avatar`, `quantity`, `total_like`, `total_view`, `total_order`, `rate`, `status`, `user_id`, `create_date`, `update_date`) VALUES
(29, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', -3, 0, 1, 8, 5, 1, 1, '2020-09-20 10:15:14', '2020-09-20 10:15:14'),
(30, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 3, 0, 5, 1, 1, '2020-09-20 10:15:31', '2020-09-20 10:15:31'),
(31, 'vinh', 100, 1, 'hello', '<h1 style=\"color:red\"> hello </h1>', 2, 'url', 'avatar', -3, 0, 1, 8, 5, 1, 1, '2020-09-20 10:18:05', '2020-09-20 10:18:05'),
(32, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 5, 0, 5, 0, 1, '2020-09-21 07:16:43', '2020-09-21 07:16:43'),
(33, 'vinh1', 100, 3, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 1, 5, '2020-09-21 10:28:05', '2020-09-21 09:24:13'),
(34, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 1, 1, '2020-09-21 09:53:00', '2020-09-21 09:53:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewed_products` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `phone`, `password`, `address`, `viewed_products`, `group_id`, `avatar`, `active`) VALUES
(1, 'vinh', 'vinhmai570@gmail.com', '0904735110', '4107eaebd361f3477b630f4ed7452418', NULL, NULL, 1, NULL, 0),
(3, 'thach', 'xxx', '023942034', '4f55d6dea8a3dc91c48ac7a382cb094a', NULL, NULL, 1, NULL, 0),
(4, 'test', 'test@test.com', '231324323', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 3, NULL, 0),
(5, 'editor', 'editor@gmail.com', '0132234232', '5aee9dbd2a188839105073571bee1b1f', NULL, NULL, 2, NULL, 0),
(7, 'vinh1', 'vinhmai510@gmail.com', '0904735110', '4107eaebd361f3477b630f4ed7452418', NULL, NULL, NULL, NULL, 0);

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
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product` (`user_id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `fk_user_group_id` (`group_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `group_user`
--
ALTER TABLE `group_user`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group_user` (`group_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
