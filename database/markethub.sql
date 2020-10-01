-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 01, 2020 lúc 08:49 PM
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `name`, `banner`, `user_id`, `status`, `parent_id`, `create_date`, `update_date`) VALUES
(1, 'phone', 'xxx', 5, 1, 0, NULL, '2020-09-28 22:32:08'),
(2, 'tivi', '1546a4sdadadkkh', 3, 0, 0, '2020-09-26 11:31:46', '2020-09-26 11:31:46'),
(3, 'laptop', '1546a4sdadadkkh', 3, 0, 0, '2020-09-26 11:31:54', '2020-09-26 11:31:54'),
(4, 'tivi con', '1546a4sdadadkkh', 3, 0, 2, '2020-09-26 11:32:24', '2020-09-26 11:32:24'),
(5, 'tivi con nho', '1546a4sdadadkkh', 3, 0, 2, '2020-09-26 11:39:38', '2020-09-26 11:39:38'),
(6, 'tivi con lon', '1546a4sdadadkkh', 3, 1, 5, '2020-09-26 12:05:37', '2020-09-26 12:05:37');

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
  `shop_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `order_address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `order_phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `shop_id`, `total_price`, `order_address`, `order_phone`, `status`, `order_date`) VALUES
(45, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:23'),
(46, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:28'),
(47, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:29'),
(48, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:30'),
(49, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:31'),
(50, 4, 5, 2000, '351 llq', '0904735110', 1, '2020-09-28 18:32:32'),
(52, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 18:32:34'),
(53, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 19:37:43'),
(61, 4, 5, 2000, '351 llq', '0904735110', 0, '2020-09-28 22:53:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `price`, `quantity`, `total_discount`) VALUES
(67, 61, 38, 200, 10, 100),
(68, 61, 38, 200, 10, 100),
(69, 61, 38, 200, 10, 100);

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
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `category_id`, `short_description`, `long_description`, `discount`, `list_image`, `avatar`, `quantity`, `total_like`, `total_view`, `total_order`, `rate`, `status`, `user_id`, `create_date`, `update_date`) VALUES
(30, 'Bàn 001', 20000, 1, 'bàn 0001', 'hello', 10, 'x', 'y', 100, 6, 1, 0, 5, 1, 1, '2020-09-20 03:15:31', '2020-10-01 18:31:55'),
(32, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 2, 5, 0, 5, 0, 1, '2020-09-21 00:16:43', '2020-10-01 18:32:12'),
(33, 'vinh1', 100, 3, 'hello', 'cacban', 2, 'url', 'avatar', 3, -2, 1, NULL, 5, 1, 5, '2020-09-21 03:28:05', '2020-10-01 18:20:10'),
(34, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 1, 1, NULL, 5, 1, 1, '2020-09-21 02:53:00', '2020-10-01 17:17:02'),
(35, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, -4, 1, NULL, 5, 0, 1, '2020-09-23 19:38:56', '2020-10-01 18:25:25'),
(36, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 1, '2020-09-24 00:18:03', '2020-09-24 00:18:03'),
(37, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-25 03:42:21', '2020-09-25 03:42:21'),
(38, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', -210, 0, 1, 210, 5, 0, 5, '2020-09-25 03:43:36', '2020-09-29 10:53:09'),
(39, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-25 04:00:36', '2020-09-25 04:00:36'),
(40, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-25 04:00:52', '2020-09-25 04:00:52'),
(41, 'vinh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-25 20:09:11', '2020-09-25 20:09:11'),
(42, 'vĩnh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-27 05:13:36', '2020-09-27 05:13:36'),
(43, 'vịnh', 100, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-27 05:14:12', '2020-09-27 05:14:12'),
(44, 'vịnh', 100, 2, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-27 05:16:57', '2020-09-27 05:16:57'),
(45, 'vịnh', 200, 2, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 19:14:26', '2020-09-26 19:14:26'),
(46, 'vịnh', 201, 2, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 19:14:30', '2020-09-26 19:14:30'),
(47, 'vịnh', 201, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 20:18:34', '2020-09-26 20:18:34'),
(48, 'vịnh', 199, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 20:18:42', '2020-09-26 20:18:42'),
(49, 'vinh', 299, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 20:19:22', '2020-09-26 20:19:22'),
(50, 'vinh', 200, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 5, '2020-09-26 20:19:28', '2020-09-26 20:19:28'),
(51, 'vinh', 200, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 1, '2020-09-28 00:49:14', '2020-09-28 00:49:14'),
(52, 'vinh', 200, 1, 'hello', 'cacban', 2, 'url', 'avatar', 3, 0, 1, NULL, 5, 0, 1, '2020-09-28 02:12:46', '2020-09-28 02:12:46');

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
(1, 'vinh', 'vinhmai570@gmail.com', '0904735110', '4107eaebd361f3477b630f4ed7452418', NULL, NULL, 1, NULL, 1),
(3, 'thach', 'xxx', '023942034', '4f55d6dea8a3dc91c48ac7a382cb094a', NULL, NULL, 1, NULL, 1),
(4, 'test', 'test@test.com', '231324323', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 3, NULL, 0),
(5, 'editor', 'editor@gmail.com', '0132234232', '5aee9dbd2a188839105073571bee1b1f', NULL, NULL, 2, NULL, 0),
(7, 'vinh1', 'vinhmai510@gmail.com', '0904735110', '4107eaebd361f3477b630f4ed7452418', NULL, NULL, 1, NULL, 0),
(8, 'validate', 'vinh@f.com', '0987654311', '1974dfd3e58eae7bc0ea8a7b62ac0363', 'tfdwew', NULL, 3, 'hello', 1),
(11, 'hedllo', 'thanhvinh01082000@gmail.com', '0987654311', 'f80125bb7f60dbd47f1241404c6e0168', NULL, NULL, 3, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_like`
--

CREATE TABLE `user_like` (
  `user_like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `liked_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_like`
--

INSERT INTO `user_like` (`user_like_id`, `user_id`, `product_id`, `liked_at`) VALUES
(4, 1, 30, NULL),
(6, 1, 32, NULL),
(8, 1, 34, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_view`
--

CREATE TABLE `user_view` (
  `user_view_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `viewed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_view`
--

INSERT INTO `user_view` (`user_view_id`, `user_id`, `product_id`, `viewed_at`) VALUES
(1, 1, 30, '2020-10-02 01:31:55'),
(2, 1, 31, '2020-10-02 01:32:04'),
(3, 1, 32, '2020-10-02 01:32:12'),
(4, 1, 300, '2020-10-02 01:40:18');

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
-- Chỉ mục cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

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
-- Chỉ mục cho bảng `user_like`
--
ALTER TABLE `user_like`
  ADD PRIMARY KEY (`user_like_id`);

--
-- Chỉ mục cho bảng `user_view`
--
ALTER TABLE `user_view`
  ADD PRIMARY KEY (`user_view_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `group_user`
--
ALTER TABLE `group_user`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `user_like`
--
ALTER TABLE `user_like`
  MODIFY `user_like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user_view`
--
ALTER TABLE `user_view`
  MODIFY `user_view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
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
