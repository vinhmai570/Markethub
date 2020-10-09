-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 09, 2020 lúc 09:01 PM
-- Phiên bản máy phục vụ: 10.3.24-MariaDB-log-cll-lve
-- Phiên bản PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `maitrong_markethub`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product` text COLLATE utf8_unicode_ci NOT NULL,
  `shop_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product`, `shop_id`, `create_at`) VALUES
(5, 69, '[{\"productID\":162,\"quantity\":1}]', 26, '2020-10-09 04:17:06'),
(6, 69, '[{\"productID\":89,\"quantity\":1},{\"productID\":95,\"quantity\":1},{\"productID\":64,\"quantity\":2}]', 27, '2020-10-09 04:26:15'),
(9, 1, '[{\"productID\":65,\"quantity\":3},{\"productID\":66,\"quantity\":1}]', 28, '2020-10-09 08:22:00'),
(10, 1, '[{\"productID\":66,\"quantity\":100}]', 25, '2020-10-09 08:24:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` text COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `name`, `banner`, `parent_id`, `create_date`, `update_date`) VALUES
(1, 'Điện Thoại & Phụ Kiện', 'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-1-600x600.jpg', 0, '2020-10-01 09:16:00', '2020-10-01 09:16:00'),
(2, 'Laptop & Máy Tính', 'https://maytinhnhapkhau.com.vn/wp-content/uploads/2018/12/MacBook-Air-2018.png', 0, '2020-10-01 09:29:16', '2020-10-01 09:29:16'),
(18, 'Thời Trang Nam', 'https://i.ebayimg.com/images/g/dnsAAOSwgSJdVEcC/s-l500.jpg', 0, '2020-10-01 08:56:45', '2020-10-01 08:56:45'),
(19, 'Thời Trang Nữ', 'https://images-na.ssl-images-amazon.com/images/I/410gdMa6jmL.jpg', 0, '2020-10-01 09:06:12', '2020-10-01 09:06:12'),
(21, 'Mẹ & Bé', 'https://image.voso.vn/users/vosoimage/images/2929d243b3f230c4ea8826f1a13e9752?t%5B0%5D=compress%3Alevel%3D100&accessToken=d58bc5552842be24f1aaa624a8c0f77b9a3afdf9161b2aab0234f85f27f1403c', 0, '2020-10-01 09:19:42', '2020-10-01 09:19:42'),
(22, 'Thiết Bị Điện Tử', 'https://my-test-11.slatic.net/p/51e012cdebc34642cd987a337851493d.jpg_720x720q80.jpg_.webp', 0, '2020-10-01 09:22:27', '2020-10-01 09:22:27'),
(23, 'Nhà Cửa & Đời Sống', 'https://vn-test-11.slatic.net/p/b0461405ff734d64426c2e9ffbe65007.jpg_720x720q80.jpg_.webp', 0, '2020-10-01 09:27:19', '2020-10-01 09:27:19'),
(25, 'Sức Khỏe & Sắc Đẹp', 'https://ffebe6927cf334b.kcdn.vn/wp-content/uploads/2017/12/order-my-pham-trung-quoc-2.jpg', 0, '2020-10-01 09:37:29', '2020-10-06 06:45:47'),
(28, 'Đồng Hồ', 'https://product.hstatic.net/1000269795/product/l4.821.2.11.7_30da1f5f1a2a45dfa74af48973a6d71c_master.jpg', 0, '2020-10-01 09:45:21', '2020-10-01 09:45:21'),
(29, 'Túi Ví', 'https://img.yes24.vn/Upload/ProductImage/letin201605/1888338_L.jpg', 0, '2020-10-01 09:47:57', '2020-10-01 09:47:57'),
(30, 'Giày Dép Nữ', 'https://vn-test-11.slatic.net/p/2868f4742484751a71d59626ac2d9535.jpg', 0, '2020-10-01 09:49:02', '2020-10-01 09:49:02'),
(31, 'Giày Dép Nam', 'https://img.zanado.com/media/catalog/product/cache/all/thumbnail/700x817/7b8fef0172c2eb72dd8fd366c999954c/1/_/giay_tay_nam_da_bong_sang_trong_dbe5.jpg', 0, '2020-10-01 09:50:28', '2020-10-01 09:50:28'),
(32, 'Thiết Bị Gia Dụng', 'https://cdn.tgdd.vn/Files/2014/01/06/534101/6-nguyen-ta-c-ca-n-luu-y-khi-mua-sa-n-pha-m-gia-du-ng-mo-i-5851389008664-600x400.jpg', 0, '2020-10-01 09:51:34', '2020-10-01 09:51:34'),
(33, 'Bách Hóa Online', 'https://img.alicdn.com/imgextra/i1/686428993/TB2G_OWrP7nBKNjSZLeXXbxCFXa_!!686428993.jpg_400x400.jpg', 0, '2020-10-01 09:53:22', '2020-10-01 09:53:22'),
(34, 'Thể Thao & Du Lịch', 'https://ancu.me/images/201910/cac-dung-cu-tap-gym-tai-nha-co-ban-duoc-nhieu-nguoi-lua-chon/cac-dung-cu-tap-gym-tai-nha-co-ban-duoc-nhieu-nguoi-lua-chon.jpg', 0, '2020-10-01 09:55:52', '2020-10-06 07:04:23'),
(35, 'Ô Tô - Xe Máy - Xe Đạp', 'https://suaxedapdientainha.com/wp-content/uploads/2017/06/sua-chua-xe-dap-dien-xe-may-dien-Yen-Anh.jpg', 0, '2020-10-01 09:57:57', '2020-10-06 07:08:30'),
(36, 'Nhà Sách', 'https://hiepsi.top/wp-content/uploads/2019/07/sach-bat-dong-san.jpg', 0, '2020-10-01 09:59:10', '2020-10-01 09:59:10'),
(37, 'Đồ Chơi', 'https://www.cuahangdochoi.vn/wp-content/uploads/2019/04/b%E1%BB%99-%C4%91%E1%BB%93-ch%C6%A1i-l%E1%BA%AFp-r%C3%A1p-chuy%E1%BB%83n-%C4%91%E1%BB%99ng-c%C3%B3-b%C3%A1nh-r%C4%83ng.png', 0, '2020-10-01 10:01:53', '2020-10-01 10:01:53'),
(38, 'Giặt Giũ & Chăm Sóc', 'https://image.thanhnien.vn/768/uploaded/hoangnam/2015_09_24/image001_wlnk.jpg', 0, '2020-10-01 10:03:22', '2020-10-01 10:03:22'),
(39, 'Áo Thun', 'https://salt.tikicdn.com/cache/550x550/ts/product/73/31/8f/0d2df2f2799036d45c6ed06b946d361e.png', 18, '2020-10-01 10:06:56', '2020-10-01 10:06:56'),
(40, 'Áo Sơ Mi', 'https://thoitrangoutlet.com/1300280-home_default/ao-so-mi-dai-tay-owen-as90773dt.jpg', 18, '2020-10-01 10:08:40', '2020-10-01 10:08:40'),
(41, 'Áo Khoác & Áo Vest', 'https://img.zanado.com/media/catalog/product/cache/all/thumbnail/360x420/7b8fef0172c2eb72dd8fd366c999954c/1/_/ao_vest_co_tru_nam_tinh_3c17.jpg', 18, '2020-10-01 10:10:09', '2020-10-01 10:10:09'),
(42, 'Áo Đôi', 'https://cf.shopee.vn/file/3dd69945f3c8073f37da9c480f43b6e8', 18, '2020-10-01 10:12:06', '2020-10-01 10:12:06'),
(43, 'Đồ Bộ', 'https://scontent1.webpluscnd.net/photos-df/a-0/1912-2031783-1/bo-do-nam-uniqlo-mr08.png?atk=1100717f9e3b11f8f12c34990bf84fda', 18, '2020-10-01 10:13:37', '2020-10-01 10:13:37'),
(44, 'Áo Len', 'https://thoitrangoutlet.com/1245220-home_default/ao-len-nam-mong-co-lo-8tt17w001.jpg', 18, '2020-10-01 10:14:56', '2020-10-01 10:14:56'),
(45, 'Phụ Kiện Nam', 'https://vn-test-11.slatic.net/p/13fc9c28b22faa1d2e7a98298fe1d773.jpg_720x720q80.jpg_.webp', 18, '2020-10-01 10:16:52', '2020-10-01 10:16:52'),
(46, 'Trang Sức Nam', 'https://dd3haw32msy74.cloudfront.net/full/4111dece1f7b8ace3be5795a92c9b068265a508e.jpg', 18, '2020-10-01 10:18:52', '2020-10-01 10:18:52'),
(47, 'Mắt Kính Nam', 'https://4menshop.com/images/thumbs/2015/09/mat-kinh-den-nam-mk98-4982-slide-1.jpg', 18, '2020-10-01 10:19:49', '2020-10-01 10:19:49'),
(55, 'Áo', 'https://cf.shopee.vn/file/bb42f647b71e8273ebae271b8a26ce9e', 19, '2020-10-06 06:22:53', '2020-10-06 06:22:53'),
(56, 'Đầm', 'https://media3.scdn.vn/img3/2019/6_16/8RlpiS_simg_de2fe0_500x500_maxb.jpg', 19, '2020-10-06 06:23:04', '2020-10-06 06:23:04'),
(57, 'Chân váy', 'https://cf.shopee.vn/file/79397a2f1419c9137a5c0467149d808c', 19, '2020-10-06 06:23:15', '2020-10-06 06:23:15'),
(58, 'Quần', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUMfa1Gyb5nW5Gkzxqr_Af8RIJso5XLzqiYw&usqp=CAU', 19, '2020-10-06 06:23:24', '2020-10-06 06:23:24'),
(59, 'Set trang phục & Jumpsuit', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTJFwa8YNSSAylZre9pQjKeyE6WJqdWBce5ew&usqp=CAU', 19, '2020-10-06 06:23:47', '2020-10-06 06:23:47'),
(60, 'Đồ đôi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGxqrUS72pPJYt0tCAU4i0uow434cTjl3L_A&usqp=CAU', 19, '2020-10-06 06:23:58', '2020-10-06 06:23:58'),
(61, 'Đồ lót, Đồ ngủ & Đồ mặc nhà', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTF8A71QVITfpyo_cEt3lGamcTSIN_yM3k61w&usqp=CAU', 19, '2020-10-06 06:24:27', '2020-10-06 06:24:27'),
(62, 'Đồ bơi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ4MWVaLEpmjtX9PCP5Gb-5HyHDT3CNSMmfgw&usqp=CAU', 19, '2020-10-06 06:24:36', '2020-10-06 06:24:36'),
(63, 'Trang phục thể thao', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvKqedZTJNH5miSk5-fcGg_pZMbVsBq4GErA&usqp=CAU', 19, '2020-10-06 06:24:48', '2020-10-06 06:24:48'),
(64, 'Phụ kiện may mặc', 'https://ae01.alicdn.com/kf/HTB1em5fav1H3KVjSZFHq6zKppXaj.jpg_q50.jpg', 19, '2020-10-06 06:25:00', '2020-10-06 06:25:00'),
(65, 'Thời trang trung niên', 'https://www.zanado.com/media/catalog/product/cache/all/thumbnail/700x817/7b8fef0172c2eb72dd8fd366c999954c/5/_/ao_trung_nien_nu_dinh_hat_sang_trong_alx_41_5cc1.jpg', 19, '2020-10-06 06:25:13', '2020-10-06 06:25:13'),
(66, 'Áo khoác & Áo vest nữ', 'https://ferosh.vn/uploads/07-12-2016/420x630/ha-truong-vest-dai-tay-dang-peplum.jpg', 19, '2020-10-06 06:25:41', '2020-10-06 06:25:41'),
(67, 'Trang phục đông', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCFAyZPcMjL9Aa9TRE9k1Unl0dwxFW9RC4og&usqp=CAU', 19, '2020-10-06 06:25:54', '2020-10-06 06:25:54'),
(68, 'Thời trang bà bầu & Sau sinh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTmEki9ktu4s-3unDgPQue7IX_0Brod271qsg&usqp=CAU', 19, '2020-10-06 06:26:18', '2020-10-06 06:26:18'),
(69, 'Đồ dùng cho bé', 'https://hd1.hotdeal.vn//hinhanh/HN/65046_body_1.jpg', 21, '2020-10-06 06:28:13', '2020-10-06 06:28:13'),
(70, 'Tã & Bỉm', 'https://bibomart.com.vn/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/t/a/ta-dan-so-sinh-huggies-size-s-56-mieng.jpeg', 21, '2020-10-06 06:28:31', '2020-10-06 06:28:31'),
(71, 'Ghế, Nôi, Cũi, Xe đẩy & Địu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRiAugnOAd4ijg0Vx7pRE_aOKtFWUjSLBvDbQ&usqp=CAU', 21, '2020-10-06 06:29:53', '2020-10-06 06:29:53'),
(72, 'Vitamin & đồ dùng cho mẹ', 'https://product.hstatic.net/1000362683/product/nature-made-prenatal-multi-dha-150-vien-mau-moi_eb6239baf04449a7b0939fe9827b0fcc_large.jpg', 21, '2020-10-06 06:30:14', '2020-10-06 06:30:14'),
(73, 'Sữa công thức 0-24 tháng tuổi', 'https://cf.shopee.vn/file/31ce3116474865cc90e0c9f97a45b722', 21, '2020-10-06 06:30:35', '2020-10-06 06:30:35'),
(74, 'Thực phẩm bổ sung cho trẻ dưới 6 tháng tuổi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfb3aH2S2IlhDRps5xbt10t5leY7FNCqMZ1667Uy4L2E0AUU0MDp6p73LkVeYU4z39NUJ-9-c&usqp=CAc', 21, '2020-10-06 06:31:04', '2020-10-06 06:31:04'),
(75, 'Sữa trên 24 tháng tuổi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdR6d_MYuhCyfN0doZ9pqKXH9awmu3BmE8KA&usqp=CAU', 21, '2020-10-06 06:31:28', '2020-10-06 06:31:28'),
(76, 'Thực phẩm cho bé từ 6 tháng tuổi', 'https://nhatban.vn/wp-content/uploads/2020/03/optimum-gold-so-1.jpg', 21, '2020-10-06 06:31:47', '2020-10-06 06:31:47'),
(77, 'vitamin thực phẩm bổ sung và đồ dùng cho mẹ', 'https://cms.domy.vn/images/image/01-06-2020/Vitamin-cho-con-bu-Postnatal-Multi-DHA/00.jpg', 21, '2020-10-06 06:32:17', '2020-10-06 06:32:17'),
(78, 'Thiết bị âm thanh', 'https://cf.shopee.vn/file/127dba72d47bc482e1061fafa9443769', 22, '2020-10-06 06:33:02', '2020-10-06 06:33:02'),
(79, 'Thẻ nhớ', 'https://cf.shopee.vn/file/52000439c16bf295012d5c711aafa08b', 22, '2020-10-06 06:33:13', '2020-10-06 06:33:13'),
(80, 'Camera giám sát & Webcam', 'https://idmart.com.vn/wp-content/uploads/2019/01/1463851986camera-ip-1.jpg', 22, '2020-10-06 06:33:30', '2020-10-06 06:33:30'),
(81, 'Máy ảnh DSLR', 'https://reviewed.vn/wp-content/uploads/2019/03/750d-3-1.jpg', 22, '2020-10-06 06:33:44', '2020-10-06 06:33:44'),
(82, 'Máy ảnh không gương lật', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRr1_ANbmVUClVp9yS70i9BOx_SkwxJ4SNJdA&usqp=CAU', 22, '2020-10-06 06:34:01', '2020-10-06 06:34:01'),
(83, 'Máy quay phim', 'https://binhminhdigital.com/storedata/images/product/may-quay-sony-xdcam-pxwz90.jpg', 22, '2020-10-06 06:34:10', '2020-10-06 06:34:10'),
(84, 'Phụ kiện máy ảnh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS7xBAP_S6MRZyUaDjKlqEHgJ2_2zm6sVF2Qw&usqp=CAU', 22, '2020-10-06 06:34:23', '2020-10-06 06:34:23'),
(85, 'Dụng cụ & Thiết bị tiện ích', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQuSpTZjYsDmu62uGJedZ0N78351d5UEX_zCw&usqp=CAU', 23, '2020-10-06 06:35:03', '2020-10-06 06:35:03'),
(86, 'Đồ dùng nhà bếp & phòng ăn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTZGSoM9xRfyAuQVdixhPiVabNtECXkwBKtkw&usqp=CAU', 23, '2020-10-06 06:35:35', '2020-10-06 06:35:35'),
(87, 'Chăn, Ga, Gối & Niệm', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6ae4-KCOV1PPW0kXGne83nxJ0VcJzI0nlMw&usqp=CAU', 23, '2020-10-06 06:35:53', '2020-10-06 06:35:53'),
(88, 'Tủ đựng & Hộp lưu trữ', 'https://cf.shopee.vn/file/cc6c0ff02a97a0f48ec91928cda31b40', 23, '2020-10-06 06:36:12', '2020-10-06 06:36:12'),
(89, 'Trang trí nhà cửa', 'https://salt.tikicdn.com/ts/product/45/f7/b6/e8c0b878cb841434184512179c7767d2.png', 23, '2020-10-06 06:36:22', '2020-10-06 06:36:22'),
(90, 'Đồ dùng phòng tắm', 'https://cf.shopee.vn/file/9b6b4cc409a01cb6eb6d969d95d91c36', 23, '2020-10-06 06:36:35', '2020-10-06 06:36:35'),
(91, 'Đồ nội thất', 'https://image.sggp.org.vn/Uploaded/2020/nkdkswkqoc/original/2014/08/images512666_1.jpg', 23, '2020-10-06 06:36:48', '2020-10-06 06:36:48'),
(92, 'Đèn', 'https://denviet.com.vn/upload/sanpham/large/8452-den-chum-kieu-y-thiet-ke-don-gian-hien-dai-trang-tri-phong-khach-1.jpg', 23, '2020-10-06 06:37:00', '2020-10-06 06:37:00'),
(93, 'Ngoài trời & Sân vườn', 'https://noithatanhphat.vn/wp-content/uploads/2019/11/xd8.jpg', 23, '2020-10-06 06:37:16', '2020-10-06 06:37:16'),
(94, 'Dụng cụ cầm tay', 'https://my-test-11.slatic.net/p/b9812a3428216d3b6c1f62ec8d911682.jpg_720x720q80.jpg_.webp', 23, '2020-10-06 06:37:27', '2020-10-06 06:37:27'),
(95, 'Laptop', 'https://phucanhcdn.com/media/product/37568_laptop_asus_a412fa_ek734t_2.png', 2, '2020-10-06 06:38:04', '2020-10-06 06:38:04'),
(96, 'Máy Tính Bàn', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/306/444/products/bo-may-tinh-de-ban-dell-optiplex-790-3.jpg?v=1577274221660', 2, '2020-10-06 06:38:16', '2020-10-06 06:38:16'),
(97, 'Linh kiện máy tính', 'https://maytinhlmc.vn/wp-content/uploads/2020/05/51243_xigmatek_winpower_pro_33.jpg', 2, '2020-10-06 06:38:35', '2020-10-06 06:38:35'),
(98, 'Chuột & Bàn phím', 'https://vn-test-11.slatic.net/p/9c5975d3dcf2b22032f048d043ba1b6f.jpg_720x720q80.jpg_.webp', 2, '2020-10-06 06:38:50', '2020-10-06 06:38:50'),
(99, 'Thiết bị mạng', 'https://vneconomy.mediacdn.vn/zoom/480_270/2018/5/30/thietbimang1-1527639150322225207581-0-0-399-710-crop-152763917880431088235.jpg', 2, '2020-10-06 06:39:00', '2020-10-06 06:39:00'),
(100, 'USB & Ổ cứng', 'https://my-test-11.slatic.net/p/07610d3f26222821a72817f07de76067.jpg_720x720q80.jpg_.webp', 2, '2020-10-06 06:39:15', '2020-10-06 06:39:15'),
(101, 'Máy in, Máy Scan & Máy Chiếu', 'https://mayinhanoi.vn/Uploads/Share/Product/2018/12/13/MF267dw-panel-closeup-3q-d_540510.jpg', 2, '2020-10-06 06:39:55', '2020-10-06 06:39:55'),
(102, 'Phần Mềm', 'https://gmosstore.vn/wp-content/uploads/2019/12/tai-unikey-moi-nhat-1.png', 2, '2020-10-06 06:40:07', '2020-10-06 06:40:07'),
(103, 'Phụ Kiện Máy Tính Khác', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR2YwKp_LK9BDcYmp7SAYG5am4_TsoGLC4ZDQ&usqp=CAU', 2, '2020-10-06 06:40:21', '2020-10-06 06:40:21'),
(104, 'Audio & Video Accessories', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSySd86__SB6jlzz1SC1UZPHc6-iBkw2L4aBw&usqp=CAU', 2, '2020-10-06 06:40:46', '2020-10-06 06:40:46'),
(105, 'Son & Chăm sóc môi', 'https://hathorbeauty.vn/pub/media/catalog/product/cache/4a191ed7c8408b176180793acbceb258/h/a/hathor-beauty-lipstick.jpg', 25, '2020-10-06 06:41:43', '2020-10-06 06:41:43'),
(106, 'Chăm sóc da', 'https://riorikorea.vn/wp-content/uploads/2018/06/bo-san-pham-cham-soc-da-mat-co-ban-riori.jpg', 25, '2020-10-06 06:42:03', '2020-10-06 06:42:03'),
(107, 'Trang điểm da', 'https://salt.tikicdn.com/ts/product/39/a1/e2/676ddaa0c5433d817c335d2b7cb52799.jpg', 25, '2020-10-06 06:42:16', '2020-10-06 06:42:16'),
(108, 'Trang điểm mắt', 'https://www.kosmebox.com/image/data/SETDALE20-10/SETLE05/bo-trang-diem-mat-hang-ngay-mascara-4d-04.jpg', 25, '2020-10-06 06:42:25', '2020-10-06 06:42:25'),
(109, 'Mỹ phẩm nam', 'https://www.boshop.vn/uploads/2020/03/19/5e732fcd6737c-gel-tam-goi-cho-nam-bath-body-works-whitewater-rush-295ml-boshop.jpg', 25, '2020-10-06 06:42:35', '2020-10-06 06:42:35'),
(110, 'Tắm & Chăm sóc cơ thể', 'https://cdn.tgdd.vn/Products/Images/2444/80857/bhx/st-lifebouy-xanh-tui-4-700x467.jpg', 25, '2020-10-06 06:42:53', '2020-10-06 06:42:53'),
(111, 'Chăm sóc tóc', 'https://salt.tikicdn.com/cache/w390/media/catalog/product/5/5/55.u2409.d20161129.t093311.431421_1.jpg', 25, '2020-10-06 06:43:04', '2020-10-06 06:43:04'),
(112, 'Chăm sóc răng miệng', 'https://luatviettin.com/wp-content/uploads/2019/06/4ed9da37c81b84c38d7943c02f1c9efa.jpg', 25, '2020-10-06 06:43:13', '2020-10-06 06:43:13'),
(113, 'Máy massage', 'https://i-shop.vnecdn.net/resize/560/560/images/2020/03/19/5e72fb1b72662-nov45bl_1.jpg', 25, '2020-10-06 06:43:35', '2020-10-06 06:43:35'),
(114, 'Thiết bị y tế', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTIA2I74uJwn1A038UkZ4TiUvbigDEsM575eA&usqp=CAU', 25, '2020-10-06 06:43:47', '2020-10-06 06:43:47'),
(115, 'Dụng cụ làm đẹp', 'https://www.zanado.com/media/catalog/product/cache/all/thumbnail/700x817/7b8fef0172c2eb72dd8fd366c999954c/1/2/bo_dung_cu_lam_toc_tien_dung_7aa8.jpg', 25, '2020-10-06 06:43:57', '2020-10-06 06:43:57'),
(116, 'Vệ sinh phụ nữ & Hỗ trợ tình dục', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/294/996/products/shecare-ddvs-phu-nu.jpg?v=1520498725617', 25, '2020-10-06 06:44:22', '2020-10-06 06:44:22'),
(117, 'Nước hoa', 'https://oky.vn/wp-content/uploads/2019/02/nuoc-hoa-gucci-bloom-edp-2.jpg', 25, '2020-10-06 06:44:30', '2020-10-06 06:44:30'),
(118, 'Vitamin & Thực phẩm chức năng', 'https://salt.tikicdn.com/cache/w390/ts/product/ee/e4/e9/5e53d40ac7336494a28a74e90dca1570.jpg', 25, '2020-10-06 06:44:48', '2020-10-06 06:44:48'),
(119, 'Hóa mỹ phẩm & Khác', 'https://i2.wp.com/blogdeptunhien.com/wp-content/uploads/2019/08/my-pham-neutrogena-co-tot-khong.jpg?resize=500%2C350', 25, '2020-10-06 06:45:04', '2020-10-06 06:45:04'),
(120, 'Giày cao gót', 'https://www.zstyle.vn/library/module_new/giay-cao-got-nu-cgn034-mau-trang_s1412.jpg', 30, '2020-10-06 06:47:03', '2020-10-06 06:47:03'),
(121, 'Giày đế bằng', 'https://ae01.alicdn.com/kf/He301905fedce4cfda54eab85311f2c748/Aiyuqi-2020-M-i-Ch-nh-Th-c-Ph-N-Da-Th-t-Da-N-Gi.jpg_q50.jpg', 30, '2020-10-06 06:47:14', '2020-10-06 06:47:14'),
(122, 'Sandal', 'https://ae01.alicdn.com/kf/HTB1_RM5cfWG3KVjSZFgq6zTspXal/Skechers-D-lites-Gi-y-Sandal-N-Gi-y-Sandal-N-Med-G-t-Xu.jpg_640x640.jpg', 30, '2020-10-06 06:47:20', '2020-10-06 06:47:20'),
(123, 'Giày cao gót/ Giày đế xuồng', 'https://cf.shopee.vn/file/4f1a68fa24a26a34171150c1ccbf7b5d', 30, '2020-10-06 06:47:56', '2020-10-06 06:47:56'),
(124, 'Bốt', 'https://salt.tikicdn.com/ts/product/e1/bb/e8/126f4cd859470a91f3e1e73c409aa9d4.jpg', 30, '2020-10-06 06:48:06', '2020-10-06 06:48:06'),
(125, 'Guốc & Dép nữ', 'https://erosska.vn/wp-content/uploads/2019/11/D-600x600.jpg', 30, '2020-10-06 06:48:16', '2020-10-06 06:48:16'),
(126, 'Giày sneaker và Giày thể thao', 'https://saigonsneaker.com/wp-content/uploads/2018/09/5_276356b3-0887-4ab9-8712-3ef7a3c211ef.jpg', 30, '2020-10-06 06:48:34', '2020-10-06 06:48:34'),
(127, 'Phụ kiện giày', 'https://my-test-11.slatic.net/original/ada60d14cee6d33cf4c0064fcf635af2.jpg', 30, '2020-10-06 06:48:44', '2020-10-06 06:48:44'),
(128, 'Đồng hồ nam', 'https://casiovietnam.net/upload/product/dong-ho-casio/EQB-500RBB-2AER-0.jpg', 28, '2020-10-06 06:49:07', '2020-10-06 06:49:07'),
(129, 'Đồng hồ nữ', 'https://my-test-11.slatic.net/p/5311f4d3600a18d0219c03730d3b1a15.jpg_720x720q80.jpg_.webp', 28, '2020-10-06 06:49:12', '2020-10-06 06:49:12'),
(130, 'Đồng hồ trẻ em', 'https://salt.tikicdn.com/cache/w390/ts/product/32/27/77/e0f58922b4ad92cd53f66f56ed7d536c.jpg', 28, '2020-10-06 06:49:18', '2020-10-06 06:49:18'),
(131, 'Phụ kiện đồng hồ', 'https://3bforerunner.com/wp-content/uploads/2019/12/IMG_7297-450x450.jpg', 28, '2020-10-06 06:49:37', '2020-10-06 06:49:37'),
(132, 'Túi đeo chéo nữ', 'https://i-shop.vnecdn.net/resize/560/560/images/2019/06/04/5cf643d01904a-7Z0A1156.jpg', 29, '2020-10-06 06:50:04', '2020-10-06 06:50:04'),
(133, 'Túi xách nữ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvuXqLAv6k6bosUJlNnzy8bksUzipvpr1I1Q&usqp=CAU', 29, '2020-10-06 06:50:10', '2020-10-06 06:50:10'),
(134, 'Balo thời trang', 'https://product.hstatic.net/1000284478/product/50b_32bg10911_2_671ea032f3e94f2bbe1cb40f23ffc464_1024x1024.jpg', 29, '2020-10-06 06:50:38', '2020-10-06 06:50:38'),
(135, 'Ví/Bóp nữ', 'https://quatangtanthegioi.com/image/top-bop-vi-cam-tay-nu-di-du-tiec-cao-cap-sang-trong-hang-hieu-1064j.jpg', 29, '2020-10-06 06:50:52', '2020-10-06 06:50:52'),
(136, 'Cặp văn phòng', 'https://tuixachda.net/wp-content/uploads/2016/12/cap-da-van-phong-cao-cap-cho-nam-018-3.jpg', 29, '2020-10-06 06:51:02', '2020-10-06 06:51:02'),
(137, 'Túi đựng tiện ích', 'https://pucamart.com/wp-content/uploads/2019/10/DGD095-2-600x600.jpg', 29, '2020-10-06 06:51:14', '2020-10-06 06:51:14'),
(138, 'Túi vải/Túi tote', 'https://top10tphcm.com/wp-content/uploads/2019/02/top-shop-ban-tui-vai-tote-dep-nhat-hcm-696x524.jpg', 29, '2020-10-06 06:51:28', '2020-10-06 06:51:28'),
(139, 'Phụ kiện túi ví khác', 'https://hangdocgiare.net/upload/data/images/product/medium/phu-kien-lam-tui-vi-handmade-nguyen-lieu-handmade-1.jpg', 29, '2020-10-06 06:51:41', '2020-10-06 06:51:41'),
(140, 'Giày thể thao Sneakers', 'https://vn-test-11.slatic.net/p/d4f2f390afd5d24330880647e85f0e60.jpg_720x720q80.jpg_.webp', 31, '2020-10-06 06:58:25', '2020-10-06 06:58:25'),
(141, 'Giày lười', 'https://vidatuixachlouiskimmi.com/wp-content/uploads/2019/12/Gi%C3%A0y-l%C6%B0%E1%BB%9Di-nam-da-b%C3%B2-h%C3%A0ng-hi%E1%BB%87u-Louis-Vuitton.jpg', 31, '2020-10-06 06:58:31', '2020-10-06 06:58:31'),
(142, 'Giày tây', 'https://4menshop.com/images/thumbs/2016/08/giay-tay-da-nau-g85-7417.jpg', 31, '2020-10-06 06:58:38', '2020-10-06 06:58:38'),
(143, 'Giày xăng-đan', 'https://salegiagoc.com/wp-content/uploads/2018/10/1540899568-4374-xanh-xam-sd05025-1-master.jpg', 31, '2020-10-06 06:58:51', '2020-10-06 06:58:51'),
(144, 'Giày dép Unisex', 'https://cdn.muabannhanh.com/asset/frontend/img/gallery/2019/11/19/5dd399695d441_1574148457.jpg', 31, '2020-10-06 06:58:59', '2020-10-06 06:58:59'),
(145, 'Dép', 'https://cdn.vortexs.io/api/images/b8ddf4a0-4e2d-44b6-9b67-cb5b61853928/375/w/hang-chinh-hang-dep-nike-benassi-jdi-particle-rose-2019.jpeg', 31, '2020-10-06 06:59:10', '2020-10-06 06:59:10'),
(146, 'Phụ kiện giày dép', 'https://salt.tikicdn.com/ts/product/ac/10/f3/ebc81442251c1234594ad23a7dea07fb.jpg', 31, '2020-10-06 06:59:23', '2020-10-06 06:59:23'),
(147, 'Đồ gia dụng nhà bếp', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTsfBYK0A5Fn9o4wZNgP2yZ1k8rrFL5q2JAow&usqp=CAU', 32, '2020-10-06 07:00:35', '2020-10-06 07:00:35'),
(148, 'Quạt & máy nóng lạnh', 'https://onemart.vn/wp-content/uploads/2018/10/Quat-dieu-hoa-2-chieu-nong-lanh-Huipu-LRG04-12ER-2.jpg', 32, '2020-10-06 07:00:48', '2020-10-06 07:00:48'),
(149, 'Thiết bị chăm sóc quần áo', 'https://cdn.mediamart.vn/Product/-F8JE4l.png', 32, '2020-10-06 07:01:00', '2020-10-06 07:01:00'),
(150, 'Máy hút bụi & Thiết bị làm sạch', 'https://cdn.tgdd.vn/Files/2019/07/05/1177446/may-hut-bui-knh6.jpg', 32, '2020-10-06 07:01:20', '2020-10-06 07:01:20'),
(151, 'Đồ gia dụng lớn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSqdsgofT7iF376wsHSvkaBEfEz4eNKhR_Yyg&usqp=CAU', 32, '2020-10-06 07:01:31', '2020-10-06 07:01:31'),
(152, 'Khác', 'https://chandat.net/testx/wp-content/uploads/2018/11/Dien-nang-tieu-thu-cua-cac-thiet-bi-dien-gia-dung-1.jpg', 32, '2020-10-06 07:01:38', '2020-10-06 07:01:38'),
(153, 'Ăn vặt & Bánh kẹo', 'https://cms.domy.vn/images/image/01-12-2017/keo-chocolate-m-tong-hop/keo-chocolate-m-tong-hop.jpg', 33, '2020-10-06 07:02:08', '2020-10-06 07:02:08'),
(154, 'Đồ uống', 'https://douongnhapkhau.com/wp-content/uploads/2020/07/bia-sol.png', 33, '2020-10-06 07:02:16', '2020-10-06 07:02:16'),
(155, 'Đồ hộp & Đóng gói', 'https://vn-test-11.slatic.net/p/fe8d472f73fa1e108d91f16b079adf0b.jpg_720x720q80.jpg_.webp', 33, '2020-10-06 07:02:31', '2020-10-06 07:02:31'),
(156, 'Nấu ăn & Làm bánh', 'https://classiccoffee.com.vn/upload/f5EXDxbp6Gr325n1hob1Gs5batnMttEIzjG.jpg', 33, '2020-10-06 07:02:42', '2020-10-06 07:02:42'),
(157, 'Đậu & Hạt', 'https://suckhoexanh.vn/uploads/shops/2020_06/hanh-nhan-tu-nhien-100g.jpg', 33, '2020-10-06 07:02:51', '2020-10-06 07:02:51'),
(158, 'Đặc sản Việt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ1YnLdP0yG0JxF5Pkk3VroETLpyjQTW74FXA&usqp=CAU', 33, '2020-10-06 07:03:02', '2020-10-06 07:03:02'),
(159, 'Quà biếu', 'https://vn.235wine.com/wp-content/uploads/2019/11/hop-ruou-qua-tet-1.jpg', 33, '2020-10-06 07:03:13', '2020-10-06 07:03:13'),
(160, 'Đồ uống có cồn', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRg1ATe27ZnataQQOMqYCvcWIlv9XgHYiawlw&usqp=CAU', 33, '2020-10-06 07:03:24', '2020-10-06 07:03:24'),
(161, 'Sữa', 'https://lh3.googleusercontent.com/proxy/8HDyj2rpdXvek9juNFpCtSQ82jdU0lFl2iGTuoA38sNqq5vJUhnzRIFfbBm-aKq-I5zmjmUTmW7rcPiQf1odkDLkYP8crboDQTinz3SZvswp64N6FkV3-x3_sBVq', 33, '2020-10-06 07:03:31', '2020-10-06 07:03:31'),
(162, 'Giày thể thao', 'https://salt.tikicdn.com/cache/w390/ts/product/e7/38/e8/fd3ea5fd6759b27da6f920302d5367d5.jpg', 34, '2020-10-06 07:04:57', '2020-10-06 07:04:57'),
(163, 'Phụ kiện thể thao', 'https://salt.tikicdn.com/cache/w390/ts/product/f4/af/f2/5adc63f1de9681df10210f00bff5c9fc.jpg', 34, '2020-10-06 07:05:07', '2020-10-06 07:05:07'),
(164, 'Thể thao & Thể hình', 'https://cf.shopee.vn/file/80e4b281379d6fee7aff60d89c66d682', 34, '2020-10-06 07:05:21', '2020-10-06 07:05:21'),
(165, 'Thể thao ngoài trời', 'https://i.pinimg.com/originals/a0/e2/38/a0e238f430e1cb71e268c4b60133b306.png', 34, '2020-10-06 07:05:32', '2020-10-06 07:05:32'),
(166, 'Indoor Sports', 'https://vn-test-11.slatic.net/p/a85bb4cfafbb501c420989b720285fae.jpg_720x720q80.jpg_.webp', 34, '2020-10-06 07:05:45', '2020-10-06 07:05:45'),
(167, 'Thể thao dưới nước', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSp8rwHEGCTeFtOUM9mX0YGoYOwIl3l7yc-iQ&usqp=CAU', 34, '2020-10-06 07:05:58', '2020-10-06 07:05:58'),
(168, 'Các môn thể thao khác', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGwuVZ_K14GzmIZkd5x8teeVGU2lZG_7-sAw&usqp=CAU', 34, '2020-10-06 07:06:09', '2020-10-06 07:06:09'),
(169, 'Vali/Hành lý', 'https://cf.shopee.vn/file/fd1ddf271be91c0c54873bca589380fd', 34, '2020-10-06 07:06:22', '2020-10-06 07:06:22'),
(170, 'Hoạt động dã ngoại', 'https://bingbong.vn/fckeditor/userfiles/kinh-nghiem-chon-mua-leu-cam-trai-du-lich-da-ngoai-1-lop,-2-lop.png', 34, '2020-10-06 07:06:39', '2020-10-06 07:06:39'),
(171, 'Balo/Túi', 'https://maybalocapxach.com/wp-content/uploads/2019/05/1-9-600x551.jpg', 34, '2020-10-06 07:06:56', '2020-10-06 07:06:56'),
(172, 'Mô tô, xe máy', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0SDvjZtjhovmPnggG9gw9E96JYxGTknJR-Q&usqp=CAU', 35, '2020-10-06 07:09:35', '2020-10-06 07:09:35'),
(173, 'Xe đạp, xe điện', 'https://hkbike.com.vn/wp-content/uploads/2019/05/Xe-%C4%91%E1%BA%A1p-%C4%91i%E1%BB%87n-dkbike-18d.jpg', 35, '2020-10-06 07:09:47', '2020-10-06 07:09:47'),
(174, 'Chăm sóc, sửa chữa xe', 'https://tamsonshop.vn/wp-content/uploads/2020/07/v%E1%BB%87-sinh-ch%E1%BA%BF-h%C3%B2a-kh%C3%AD-b%C3%ACnh-x%C4%83ng-con-%C3%B4-t%C3%B4-onzca-mc307-500ml-1.jpg', 35, '2020-10-06 07:10:05', '2020-10-06 07:10:05'),
(175, 'Chăm sóc ô tô', 'https://lh3.googleusercontent.com/proxy/EPUpyZm0Hd9y5oapMLga2W6M2hGmPxFq7nh-mA4mVCFMNWATGYLS3iCVf0VftRBn1tWjbW8zI8EZ8pBlSa4rTzanPHAnCZAIIN3El6QwpwAUCZIbVpwYIwX6dCq8qHeWJGzMFoyuuHb2717Fzs63_fZtQMP8IUc_1LHAGA', 35, '2020-10-06 07:10:14', '2020-10-06 07:10:14'),
(176, 'Mũ bảo hiểm', 'https://media3.scdn.vn/img2/2018/11_30/aCTZR8_simg_b5529c_800x800_maxb.jpg', 35, '2020-10-06 07:10:25', '2020-10-06 07:10:25'),
(177, 'Phụ kiện xe máy', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS455ISFBOc7kay26KMAerDyrEY4u6PHCy65w&usqp=CAU', 35, '2020-10-06 07:10:34', '2020-10-06 07:10:34'),
(178, 'Phụ tùng xe máy', 'https://cdn.imotorbike.vn/images/oem-oem-dia-recto-cho-xe-exciter-150-fz150i-42-43-44-rang-0cf2e346-8c82-40b4-b33f-b6a3e12a1f03.webp', 35, '2020-10-06 07:10:42', '2020-10-06 07:10:42'),
(179, 'Chăm sóc xe máy', 'https://salt.tikicdn.com/cache/w390/ts/product/7a/d8/0a/d33f054664a0b882577db833d930005c.jpg', 35, '2020-10-06 07:10:53', '2020-10-06 07:10:53'),
(180, 'Phụ tùng, phụ kiện xe đạp xe đạp điện', 'https://storage.googleapis.com/cdn.nhanh.vn/store/13829/ps/20180504/gio___di__a_5_cha____u_fix_gear_1_704x704.jpg', 35, '2020-10-06 07:11:12', '2020-10-06 07:11:12'),
(181, 'Xe Ô tô', 'https://i.pinimg.com/originals/cf/9f/c6/cf9fc6b06a51363fa2e25e48727c233d.jpg', 35, '2020-10-06 07:11:27', '2020-10-06 07:11:27'),
(182, 'Sách tiếng việt', 'https://img.sosanhgia.com/images/500x0/88f87acbcf1348b6bee66bc01d831c5c/on-luyen-tieng-viet-cuoi-tieu-hoc-(tap-1-2).jpeg', 36, '2020-10-06 07:11:52', '2020-10-06 07:11:52'),
(183, 'Sách ngoại văn', 'https://cf.shopee.vn/file/e9dd52344ad09449f07414effac28d23', 36, '2020-10-06 07:11:58', '2020-10-06 07:11:58'),
(184, 'Văn phòng phẩm', 'https://vpphuyhoang.com/wp-content/uploads/2016/11/sotay0021.jpg', 36, '2020-10-06 07:12:08', '2020-10-06 07:12:08'),
(185, 'Flashcards', 'https://www.flashcards.com.sg/wp-content/uploads/2017/09/pastedImage-1-1.png', 36, '2020-10-06 07:12:17', '2020-10-06 07:12:17'),
(186, 'Nhạc cụ', 'https://lh3.googleusercontent.com/proxy/GxjVGEp-GptpKqHZSR1gWrXHiy2Ki02-7B6VfZA4I_xmAXwAhmf5a9KITw8TQGGnj_ex7_qbwbe8QG2k7Pw3uRiUNDoaQiMKDFNkQ_iZ_ImVzeQT5XlbFeY', 36, '2020-10-06 07:12:26', '2020-10-06 07:12:26'),
(187, 'Quà lưu niệm', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQmpPn1mUlk3VDbAZ_V4V8E5_10lKWlbm_uxA&usqp=CAU', 36, '2020-10-06 07:12:33', '2020-10-06 07:12:33'),
(188, 'Đồ chơi cho trẻ sơ sinh & trẻ nhỏ', 'https://vn-live-03.slatic.net/p/50cdcbf7cf299de30aee4f0f34fb9846.jpg', 37, '2020-10-06 07:13:00', '2020-10-06 07:13:00'),
(189, 'Đồ chơi giáo dục', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbmzNH7xDbNAYE9ksespDkzRjLYooQrsQ4Ew&usqp=CAU', 37, '2020-10-06 07:13:11', '2020-10-06 07:13:11'),
(190, 'Đồ chơi vận động', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrq6B2BYJyOLKF7zD665m1hCncwP2xyn3PeQ&usqp=CAU', 37, '2020-10-06 07:13:21', '2020-10-06 07:13:21'),
(191, 'Búp bê & Đồ chơi nhồi bông', 'https://gd4.alicdn.com/imgextra/i2/682780803/TB2TIEcmNBmpuFjSZFsXXcXpFXa_!!682780803.jpg', 37, '2020-10-06 07:13:39', '2020-10-06 07:13:39'),
(192, 'Đồ chơi mô hình', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/325/593/products/htb1nstnqstybenjsspaq6yoofxat.jpg?v=1537169109877', 37, '2020-10-06 07:13:51', '2020-10-06 07:13:51'),
(193, 'Đồ chơi giải trí', 'https://cf.shopee.vn/file/66e60cd80e72c9cd2e7efa30e1df434b', 37, '2020-10-06 07:14:00', '2020-10-06 07:14:00'),
(194, 'Giặt giũ', 'https://gd1.alicdn.com/imgextra/i1/10771667/TB2IJiUoYtlpuFjSspoXXbcDpXa_!!10771667.jpg', 38, '2020-10-06 07:15:08', '2020-10-06 07:15:08'),
(195, 'Giấy vệ sinh, khăn giấy', 'https://trangdangtin.com/htdocs/data/users/images/products/2019/11/27/5dde2b8d04658_giay-ve-sinh-cuon-lon-giay-ve-sinh-lucky-tai-ca-mau.png', 38, '2020-10-06 07:15:23', '2020-10-06 07:15:23'),
(196, 'Vệ sinh nhà cửa', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSpTwB3mpzbB67mmsmilmQsReb9lsonHTlCQQ&usqp=CAU', 38, '2020-10-06 07:15:32', '2020-10-06 07:15:32'),
(197, 'Vệ sinh bát đĩa', 'https://vn-test-11.slatic.net/p/11/nuoc-rua-chen-bat-sunlight-tra-xanh-amp-chanh-750ml-2507-99523543-07f482df6edd5e281506a6da4ba38e04-catalog.jpg_720x720q80.jpg_.webp', 38, '2020-10-06 07:15:40', '2020-10-06 07:15:40'),
(198, 'Dụng cụ vệ sinh', 'https://dungcunhahangkhachsan.vn/wp-content/uploads/2020/06/dung-cu-ve-sinh.jpg', 38, '2020-10-06 07:15:50', '2020-10-06 07:15:50'),
(199, 'Chất khử mùi, làm thơm', 'https://vn-test-11.slatic.net/p/c6b2358212cca12222015589974b5cb4.jpg_720x720q80.jpg_.webp', 38, '2020-10-06 07:16:02', '2020-10-06 07:16:02'),
(200, 'Thuốc diệt côn trùng', 'https://cf.shopee.vn/file/31fecdccc942ad3cc8dad356ec81b160', 38, '2020-10-06 07:16:13', '2020-10-06 07:16:13'),
(201, 'Túi, màng bọc thực phẩm', 'https://cf.shopee.vn/file/451b9bfa5fd3154e41be83a25185b192', 38, '2020-10-06 07:16:30', '2020-10-06 07:16:30'),
(202, 'Bao bì, túi đựng rác', 'https://lh3.googleusercontent.com/proxy/t7mlfqeI32u0jVuJUz1fbNmRSvZ3PcChFbRfuMlqkeJoqTcfOz2t7mk-PoGDRDxFgK8nap8HRqvKKGBpPhbAQqIThP_yvRbGvhGZ_oaaxNOzdHw7KjWd', 38, '2020-10-06 07:16:42', '2020-10-06 07:16:42'),
(203, 'Mục Khác', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTU33_ybY-Cc2GImt7vk08oI18hRO_ODSukLQ&usqp=CAU', 38, '2020-10-06 07:16:59', '2020-10-06 07:16:59'),
(204, 'Điện thoại', 'https://product.hstatic.net/200000144777/product/iphone-12-pro-max-600x600_b76ea35ce1e94036a27f84d4cd7cbb09_master.jpg', 1, '2020-10-06 07:19:01', '2020-10-06 07:19:01'),
(205, 'Máy tính bảng', 'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/ipad-pro-2020-34.jpg', 1, '2020-10-06 07:19:11', '2020-10-06 07:19:11'),
(206, 'Vỏ, Bao & Ốp lưng', 'https://i.pinimg.com/originals/1f/53/d1/1f53d1ef1f28b586f5200ffe52fd2857.jpg', 1, '2020-10-06 07:19:26', '2020-10-06 07:19:26'),
(207, 'Miếng dán màn hình', 'https://salt.tikicdn.com/cache/w390/ts/product/35/44/59/825719767da2ea90c5146d3395e8041c.jpg', 1, '2020-10-06 07:19:37', '2020-10-06 07:19:37'),
(208, 'Pin sạc dự phòng', 'https://pinduphongtot.com/upload/images/tintuc/asus-power-10050mah/pin-sac-du-phong-asus-10050mah.jpg', 1, '2020-10-06 07:19:45', '2020-10-06 07:19:45'),
(209, 'Pin, Cáp & Bộ sạc', 'https://vn-test-11.slatic.net/p/2/pin-sac-du-phong-10-000mah-adata-pt100-4250-5462694-12c969d164df535b3b4eaf66aeefd84e.jpg_500x500Q80.jpg', 1, '2020-10-06 07:19:59', '2020-10-06 07:19:59'),
(210, 'Giá đỡ & Kẹp', 'https://images.khobansi.vn/image/upload/TSfPzBq5i', 1, '2020-10-06 07:20:13', '2020-10-06 07:20:13'),
(211, 'Gậy chụp hình', 'https://product.hstatic.net/1000269689/product/2445973gay-chup-hinh-z06-4.jpg', 1, '2020-10-06 07:20:23', '2020-10-06 07:20:23'),
(212, 'Sim', 'https://www.truesmart.com.vn/img/p/dia-chi-ban-sim-ghep-iphone-11-11-pro-va-11-pro-max-uy-tin-gia-re-p6136.jpg', 1, '2020-10-06 07:20:29', '2020-10-06 07:20:29');

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
  `voucher` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `order_phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `shop_id`, `total_price`, `voucher`, `order_address`, `order_phone`, `status`, `order_date`) VALUES
(2, 1, 0, 10000, NULL, 'jksld', '090493723', 1, '2020-09-28 09:12:05'),
(3, 1, 5, 2000, NULL, '351 llq', '0904735110', 1, '2020-09-28 09:47:58'),
(8, 4, 5, 2000, NULL, '351 llq', '0904735110', 1, '2020-09-28 17:05:08'),
(12, 4, 5, 2000, NULL, '351 llq', '0904735110', 0, '2020-09-29 02:09:54'),
(13, 3, 5, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-01 21:44:46'),
(14, 3, 5, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-02 02:27:06'),
(15, 3, 27, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-05 20:15:20'),
(16, 3, 27, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-05 20:15:26'),
(17, 3, 27, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-05 21:26:33'),
(18, 3, 27, 2000, NULL, '351 llq', '0904735110', 0, '2020-10-05 21:41:28'),
(19, 3, 27, 2000, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-05 21:47:57'),
(20, 3, 27, 2000, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-05 21:48:36'),
(21, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-07 21:37:23'),
(22, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-07 21:37:45'),
(23, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 1, '2020-10-09 09:13:01'),
(24, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-07 21:51:45'),
(25, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-07 21:52:33'),
(26, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-07 21:55:57'),
(27, 3, 27, 297500, '', '351 llq', '0904735110', 0, '2020-10-07 22:01:24'),
(28, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-09 02:18:22'),
(29, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-09 02:20:10'),
(40, 1, 26, 2432500, NULL, '351 llq', '0326566821', 1, '2020-10-09 09:42:45'),
(41, 1, 26, 81550000, NULL, '351 llq', '0326566821', 0, '2020-10-08 19:33:53'),
(42, 3, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-08 19:42:57'),
(43, 69, 27, 282700, 'LLAK7PS0', '351 llq', '0904735110', 0, '2020-10-08 20:42:47'),
(44, 1, 27, 29800, NULL, '351', '090239329', 0, '2020-10-09 00:42:47'),
(45, 1, 27, 29800, NULL, '351', '090239329', 0, '2020-10-09 00:42:47'),
(46, 1, 27, 29800, NULL, '351', '090239329', 0, '2020-10-09 00:50:33'),
(47, 1, 27, 29800, NULL, '351', '090239329', 0, '2020-10-09 00:50:33'),
(48, 1, 27, 9900, NULL, '351', '090239329', 0, '2020-10-09 01:00:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `product_name`, `shop_name`, `price`, `quantity`, `total_discount`) VALUES
(13, 8, 38, '', '', 200, 10, 100),
(14, 8, 38, '', '', 200, 10, 100),
(15, 8, 38, '', '', 200, 10, 100),
(25, 12, 38, '', '', 200, 10, 100),
(26, 12, 38, '', '', 200, 10, 100),
(27, 12, 38, '', '', 200, 10, 100),
(28, 13, 38, '', '', 200, 10, 100),
(29, 13, 38, '', '', 200, 10, 100),
(30, 13, 38, '', '', 200, 10, 100),
(31, 14, 38, '', '', 200, 10, 100),
(32, 14, 38, '', '', 200, 10, 100),
(33, 14, 38, '', '', 200, 10, 100),
(34, 15, 75, '', '', 200, 10, 100),
(35, 15, 75, '', '', 200, 10, 100),
(36, 15, 75, '', '', 200, 10, 100),
(37, 16, 75, '', '', 200, 10, 100),
(38, 16, 75, '', '', 200, 10, 100),
(39, 16, 75, '', '', 200, 10, 100),
(40, 17, 75, '', '', 200, 10, 100),
(41, 17, 76, '', '', 200, 10, 100),
(42, 17, 77, '', '', 200, 10, 100),
(43, 18, 75, '', '', 200, 10, 100),
(44, 18, 76, '', '', 200, 10, 100),
(45, 18, 77, '', '', 200, 10, 100),
(46, 20, 75, '', '', 200, 10, 5),
(47, 20, 76, '', '', 200, 10, 5),
(48, 20, 77, '', '', 200, 10, 5),
(49, 21, 75, '', '', 200, 10, 5),
(50, 21, 76, '', '', 200, 10, 5),
(51, 21, 77, '', '', 200, 10, 5),
(52, 22, 75, '', '', 200, 10, 5),
(53, 22, 76, '', '', 200, 10, 5),
(54, 22, 77, '', '', 200, 10, 5),
(55, 23, 75, '', '', 200, 10, 5),
(56, 23, 76, '', '', 200, 10, 5),
(57, 23, 77, '', '', 200, 10, 5),
(58, 24, 75, '', '', 200, 10, 5),
(59, 24, 76, '', '', 200, 10, 5),
(60, 24, 77, '', '', 200, 10, 5),
(61, 25, 75, '', '', 200, 10, 5),
(62, 25, 76, '', '', 200, 10, 5),
(63, 25, 77, '', '', 200, 10, 5),
(64, 26, 75, '', '', 9918, 10, 5),
(65, 26, 76, '', '', 9918, 10, 5),
(66, 26, 77, '', '', 9918, 10, 5),
(67, 27, 75, '', '', 9918, 10, 0),
(68, 27, 76, '', '', 9918, 10, 0),
(69, 27, 77, '', '', 9918, 10, 0),
(70, 28, 75, '', '', 9918, 10, 5),
(71, 28, 76, '', '', 9918, 10, 5),
(72, 28, 77, '', '', 9918, 10, 5),
(73, 29, 75, '', '', 9918, 10, 5),
(74, 29, 76, '', '', 9918, 10, 5),
(75, 29, 77, '', '', 9918, 10, 5),
(88, 40, 168, 'Tai nghe có dây siêu hịn', 'Nguyễn Văn Thắng', 42500, 6, 0),
(89, 40, 167, 'Chuột không dây', 'Nguyễn Văn Thắng', 52500, 1, 0),
(90, 40, 166, 'Giày đá banh màu trắng Nike', 'Nguyễn Văn Thắng', 425000, 5, 0),
(91, 41, 171, 'Iphone X Promax Siêu xịn', 'Nguyễn Văn Thắng', 13500000, 6, 0),
(92, 41, 163, 'Cặp balo leo núi siêu cấp vô địch', 'Nguyễn Văn Thắng', 150000, 1, 0),
(93, 41, 162, 'Ví da cao cấp hàng chính hãng', 'Nguyễn Văn Thắng', 80000, 5, 0),
(94, 42, 75, 'Iphone11 ProMax 14', 'Mai ', 9918, 10, 5),
(95, 42, 76, 'Iphone11 ProMax 15', 'Mai ', 9918, 10, 5),
(96, 42, 77, 'Iphone11 ProMax 16', 'Mai ', 9918, 10, 5),
(97, 43, 75, 'Iphone11 ProMax 14', 'Mai ', 9918, 10, 5),
(98, 43, 76, 'Iphone11 ProMax 15', 'Mai ', 9918, 10, 5),
(99, 43, 77, 'Iphone11 ProMax 16', 'Mai ', 9918, 10, 5),
(100, 44, 64, '', '', 9918, 2, 0),
(101, 44, 65, '', '', 9918, 1, 0),
(102, 45, 65, '', '', 9918, 3, 0),
(103, 46, 64, '', '', 9918, 2, 0),
(104, 46, 65, '', '', 9918, 1, 0),
(105, 47, 65, '', '', 9918, 3, 0),
(106, 48, 65, '', '', 9918, 1, 0);

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
(51, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 2, 1, 5, 5, 0, 27, '2020-10-01 10:08:29', '2020-10-01 10:08:29'),
(59, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, 2, 5, 0, 27, '2020-10-03 02:05:41', '2020-10-03 02:05:41'),
(60, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 2, 1, 100, 5, 0, 27, '2020-10-03 02:05:45', '2020-10-03 02:05:45'),
(61, 'Iphone11 ProMax1', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, 1, 5, 0, 27, '2020-10-03 02:05:55', '2020-10-03 02:05:55'),
(62, 'Iphone11 ProMax2', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, 10, 5, 0, 27, '2020-10-03 02:05:59', '2020-10-03 02:05:59'),
(63, 'Iphone11 ProMax3', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:06:03', '2020-10-03 02:06:03'),
(64, 'Iphone11 ProMax4', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 1, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:06:08', '2020-10-03 02:06:08'),
(65, 'Iphone11 ProMax5', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', -4, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:06:13', '2020-10-03 02:06:13'),
(66, 'Iphone11 ProMax6', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:06:16', '2020-10-03 02:06:16'),
(67, 'Iphone11 ProMax7', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:06:20', '2020-10-03 02:06:20'),
(68, 'Iphone11 ProMax7', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:07:15', '2020-10-03 02:07:15'),
(69, 'Iphone11 ProMax8', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:07:37', '2020-10-03 02:07:37'),
(70, 'Iphone11 ProMax9', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:07:41', '2020-10-03 02:07:41'),
(71, 'Iphone11 ProMax10', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:07:46', '2020-10-03 02:07:46'),
(72, 'Iphone11 ProMax11', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:07:50', '2020-10-03 02:07:50'),
(73, 'Bànd ghê', 100, 1, 'hello', 'cacban', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 3, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:07:58', '2020-10-06 03:12:05'),
(74, 'Iphone11 ProMax 13', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:08:03', '2020-10-03 02:08:03'),
(75, 'Iphone11 ProMax 14', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', -195, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:08:10', '2020-10-03 02:08:10'),
(76, 'Iphone11 ProMax 15', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', -135, 2, 1, NULL, 5, 0, 27, '2020-10-03 02:08:14', '2020-10-03 02:08:14'),
(77, 'Iphone11 ProMax 16', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', -135, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:08:41', '2020-10-03 02:08:41'),
(78, 'Iphone11 ProMax 17', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:08:46', '2020-10-03 02:08:46'),
(79, 'Iphone11 ProMax 18', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:08:52', '2020-10-03 02:08:52'),
(80, 'Iphone11 ProMax 19', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:08:57', '2020-10-03 02:08:57'),
(81, 'Iphone11 ProMax 20', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:02', '2020-10-03 02:09:02'),
(82, 'Iphone11 ProMax 21', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:06', '2020-10-03 02:09:06'),
(83, 'Iphone11 ProMax 22', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:09', '2020-10-03 02:09:09'),
(84, 'Iphone11 ProMax 23', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:15', '2020-10-03 02:09:15'),
(85, 'Iphone11 ProMax 24', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:19', '2020-10-03 02:09:19'),
(86, 'Iphone11 ProMax 25', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:23', '2020-10-03 02:09:23'),
(87, 'Iphone11 ProMax 26', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:26', '2020-10-03 02:09:26'),
(88, 'Iphone11 ProMax 27', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:31', '2020-10-03 02:09:31'),
(89, 'Iphone11 ProMax 28', 10120, 39, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 4, 1, NULL, 5, 0, 27, '2020-10-03 02:09:35', '2020-10-03 02:09:35'),
(90, 'Iphone11 ProMax 29', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:39', '2020-10-03 02:09:39'),
(91, 'Iphone11 ProMax 30', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:51', '2020-10-03 02:09:51'),
(92, 'Iphone11 ProMax 31', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:53', '2020-10-03 02:09:53'),
(93, 'Iphone11 ProMax 32', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:09:57', '2020-10-03 02:09:57'),
(94, 'Iphone11 ProMax 33', 10120, 39, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 4, 1, NULL, 5, 0, 27, '2020-10-03 02:10:00', '2020-10-03 02:10:00'),
(95, 'Iphone11 ProMax 34', 10120, 39, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 3, 1, NULL, 5, 0, 27, '2020-10-03 02:10:03', '2020-10-03 02:10:03'),
(96, 'Iphone11 ProMax 35', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:06', '2020-10-03 02:10:06'),
(97, 'Iphone11 ProMax 36', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:09', '2020-10-03 02:10:09'),
(98, 'Iphone11 ProMax 37', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:12', '2020-10-03 02:10:12'),
(99, 'Iphone11 ProMax 38', 10120, 43, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 27, '2020-10-03 02:10:15', '2020-10-03 02:10:15'),
(100, 'Iphone11 ProMax 39', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:18', '2020-10-03 02:10:18'),
(101, 'Iphone11 ProMax 40', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:23', '2020-10-03 02:10:23'),
(102, 'Iphone11 ProMax 41', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:26', '2020-10-03 02:10:26'),
(103, 'Iphone11 ProMax 42', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:29', '2020-10-03 02:10:29'),
(104, 'Iphone11 ProMax 43', 10120, 43, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:31', '2020-10-03 02:10:31'),
(105, 'Iphone11 ProMax 44', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-03 02:10:34', '2020-10-03 02:10:34'),
(106, 'Iphone11 ProMax 45', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-03 02:10:37', '2020-10-03 02:10:37'),
(107, 'Iphone11 ProMax 46', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-03 02:10:45', '2020-10-03 02:10:45'),
(108, 'Iphone11 ProMax 46', 10120, 2, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 1, 1, NULL, 5, 0, 26, '2020-10-03 02:10:54', '2020-10-03 02:10:54'),
(109, 'Iphone11 ProMax 463', 10120, 3, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-03 02:12:02', '2020-10-03 02:12:02'),
(110, 'Iphone11 ProMax 463', 10120, 3, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-05 09:49:55', '2020-10-05 09:49:55'),
(111, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-05 09:59:40', '2020-10-05 09:59:40'),
(112, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-05 10:54:10', '2020-10-05 10:54:10'),
(122, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-05 11:41:57', '2020-10-05 11:41:57'),
(141, 'Iphone11 ProMax', 10120, 1, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 26, '2020-10-05 01:47:10', '2020-10-05 01:47:10'),
(158, 'Iphone11 ProMax 463', 10120, 3, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-06 03:11:21', '2020-10-06 03:11:21'),
(159, 'Iphone11 ProMax 463', 10120, 3, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'https://iphonetoanthinh.vn/wp-content/uploads/2020/02/11-pro-xanh.jpg', 5, 0, 1, NULL, 5, 0, 27, '2020-10-06 03:11:27', '2020-10-06 03:11:27'),
(162, 'Ví da cao cấp hàng chính hãng', 100000, 46, 'Ví da pro max', 'Ví da pro vl', 20, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_214642.jpg?alt=media&token=7c25c751-42fa-4c8a-8380-3ccc66a602e6\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_214645.jpg?alt=media&token=8f33b9d6-8f78-43df-aeb0-b8689661ecbd\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_214628.jpg?alt=media&token=08472f82-d4cb-4a41-ac8b-de34097ac145\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201006_214642.jpg?alt=media&token=7c25c751-42fa-4c8a-8380-3ccc66a602e6', 195, 3, 1, NULL, 5, 0, 26, '2020-10-06 09:47:12', '2020-10-06 09:47:12'),
(163, 'Cặp balo leo núi siêu cấp vô địch', 200000, 171, 'Balo này bền lắm bạn ạ', 'Siêu bền luôn. Mua đi nà', 25, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_215609.jpg?alt=media&token=6f5eb8bd-d7bb-456e-a041-7aaa4e1f33fa\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_215602.jpg?alt=media&token=93673884-4e50-45a0-81be-26f6f4bb784d\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_215600.jpg?alt=media&token=6e94a990-1cb7-425f-b1ca-215a37e3d3c7\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201006_215609.jpg?alt=media&token=6f5eb8bd-d7bb-456e-a041-7aaa4e1f33fa', 199, 0, 1, NULL, 5, 0, 26, '2020-10-06 09:56:43', '2020-10-06 09:56:43'),
(164, 'Laptop Dell Latitude E6520', 4000000, 95, 'Laptop dell bền khỏi bàn', 'Laptop dell bền khỏi bàn luôn bạn ơi. Mua đi mờ', 20, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220038.jpg?alt=media&token=7bc70033-11d2-4b31-9def-792a4b2a1b27\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220043.jpg?alt=media&token=ab20458d-ee3e-413e-991e-f23e8da1a140\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220049.jpg?alt=media&token=5371690a-08bc-4349-ac96-ae8ad7afe2f6\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201006_220038.jpg?alt=media&token=7bc70033-11d2-4b31-9def-792a4b2a1b27', 500, 2, 1, NULL, 5, 0, 26, '2020-10-06 10:01:51', '2020-10-06 10:01:51');
INSERT INTO `product` (`product_id`, `product_name`, `price`, `category_id`, `short_description`, `long_description`, `discount`, `list_image`, `avatar`, `quantity`, `total_like`, `total_view`, `total_order`, `rate`, `status`, `user_id`, `create_date`, `update_date`) VALUES
(166, 'Giày đá banh màu trắng Nike', 500000, 140, 'Mình mang đc hơn 1 năm rồi muốn nhượng lại', 'Mình mang đc hơn 1 năm rồi muốn nhượng lại', 15, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220759.jpg?alt=media&token=856481fd-b7df-4ae7-a1e9-bdec4c473066\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220754.jpg?alt=media&token=90ada10b-728b-4869-bd20-5defcbd1befd\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_220806.jpg?alt=media&token=b8b54040-faec-4d56-b22f-d3eab38699b4\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201006_220759.jpg?alt=media&token=856481fd-b7df-4ae7-a1e9-bdec4c473066', 45, 2, 1, NULL, 5, 0, 26, '2020-10-06 10:10:11', '2020-10-06 10:10:11'),
(167, 'Chuột không dây', 70000, 98, 'Chuột còn mới tinh', 'Chuột này còn sống luôn đó bạn', 25, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_234557.jpg?alt=media&token=82b56ea0-1d8a-4eac-892a-47f7ba3fbced\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_234600.jpg?alt=media&token=52b3a53c-eb8e-49d8-a80b-93bffa9d4404\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201006_234605.jpg?alt=media&token=e4edac2d-8c19-466a-8b69-5a8512fea21d\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201006_234557.jpg?alt=media&token=82b56ea0-1d8a-4eac-892a-47f7ba3fbced', 599, 2, 1, NULL, 5, 0, 26, '2020-10-06 11:46:43', '2020-10-06 11:46:43'),
(168, 'Tai nghe có dây siêu hịn', 50000, 78, 'Miễn trả giá ok?', 'Nhìn là biết xịn rồi', 15, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/JPEG_20201007_000404_3924523115089391767.jpg?alt=media&token=7818eede-7ec2-4b0e-8ea4-f07d1a337a77\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/JPEG_20201007_000416_2706086694312681478.jpg?alt=media&token=d332d70c-8346-4eb4-9c3f-a36aed998e16\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/JPEG_20201007_000404_3924523115089391767.jpg?alt=media&token=7818eede-7ec2-4b0e-8ea4-f07d1a337a77', 24, 1, 1, NULL, 5, 0, 26, '2020-10-07 12:04:46', '2020-10-07 12:04:46'),
(169, 'Ml trường', 0, 39, 'Hàng tặng không bán', 'Hàng tặng không bán', 0, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/IMG_20201007_094738.jpg?alt=media&token=59bcacf6-af63-489c-8b77-aa23b02cfd36\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/IMG_20201007_094738.jpg?alt=media&token=59bcacf6-af63-489c-8b77-aa23b02cfd36', 1, 1, 1, NULL, 5, 0, 26, '2020-10-07 09:50:28', '2020-10-07 09:50:28'),
(170, 'Iphone11 ProMax 477', 10120, 3, 'Điện thoại xịn thế...', 'This is a smartphone', 2, '[\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\",\"https:\\/\\/cdn.cellphones.com.vn\\/media\\/catalog\\/product\\/cache\\/7\\/thumbnail\\/9df78eab33525d08d6e5fb8d27136e95\\/i\\/p\\/iphone-11-pro-max-space-select-2019_1_1_3_2.png\"]', 'hehf', 5, 0, 1, NULL, 5, 0, 27, '2020-10-07 04:55:01', '2020-10-07 04:55:01'),
(171, 'Iphone X Promax Siêu xịn', 18000000, 204, 'Iphone X Promax Siêu xịn', 'Iphone X Promax Siêu xịn', 25, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image.png?alt=media&token=e8fb3461-f619-4043-bb38-1f7059e9696e\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-1.png?alt=media&token=233e008a-3e3d-4de7-9c49-e0f9e1f39c0f\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-2.png?alt=media&token=841c17d5-9d29-4661-a5c1-82a677d80548\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image.png?alt=media&token=e8fb3461-f619-4043-bb38-1f7059e9696e', 194, 3, 1, NULL, 5, 0, 26, '2020-10-09 01:15:08', '2020-10-09 01:15:08'),
(172, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 4000000, 204, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 15, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-3.png?alt=media&token=1beee3be-f810-4137-b803-36e880369110\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-4.png?alt=media&token=09d3c36f-4ad2-454c-aca7-899681bd85ad\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-5.png?alt=media&token=e67cbb06-df16-4946-ae0e-22dea2196eff\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-6.png?alt=media&token=b5423464-aab8-4418-a641-b884cf343ebf\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-3.png?alt=media&token=1beee3be-f810-4137-b803-36e880369110', 200, 0, 1, NULL, 5, 0, 26, '2020-10-09 07:13:04', '2020-10-09 07:13:04'),
(173, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 5000000, 204, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 20, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-3.png?alt=media&token=4f611743-2ab7-4f79-b3f1-5aa0dca60483\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-4.png?alt=media&token=4edf215a-13e1-4c5c-bd4e-8a465be35a32\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-5.png?alt=media&token=070771c0-d9f8-423e-a141-29f66374f409\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-3.png?alt=media&token=4f611743-2ab7-4f79-b3f1-5aa0dca60483', 250, 2, 1, NULL, 5, 0, 70, '2020-10-09 07:16:43', '2020-10-09 07:16:43'),
(174, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 5500000, 204, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 30, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-3.png?alt=media&token=525d5fe4-a167-47eb-b49a-0db2097a9144\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-4.png?alt=media&token=ccb4a2ba-28e5-4a93-9137-95ef3e935ad3\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-5.png?alt=media&token=3cafd171-bd39-4795-a644-b928866392ab\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-6.png?alt=media&token=408d15ce-2feb-4255-a0eb-4bdecb7437bd\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-3.png?alt=media&token=525d5fe4-a167-47eb-b49a-0db2097a9144', 0, 1, 1, NULL, 5, 0, 70, '2020-10-09 07:22:09', '2020-10-09 07:22:09'),
(175, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 4200000, 204, 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 'Điện Thoại Xiaomi Redmi Note 7 chính hãng nguyên tem', 20, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-5.png?alt=media&token=5170c3f9-b1ee-4486-b0cd-5526ac0ec89b\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-4.png?alt=media&token=d734f01a-7b18-4723-92f4-6b6fca34f9e7\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-3.png?alt=media&token=de2eea6b-8012-4d53-ac4c-cda4fcd3f533\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-6.png?alt=media&token=3cc99a91-9e9f-4404-aaab-4493283f508a\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-5.png?alt=media&token=5170c3f9-b1ee-4486-b0cd-5526ac0ec89b', 150, 1, 1, NULL, 5, 0, 70, '2020-10-09 07:24:22', '2020-10-09 07:24:22'),
(176, 'Điện Thoại Samsung Galaxy A50s 64GB', 7000000, 204, 'Điện Thoại Samsung Galaxy A50s 64GB', 'Điện Thoại Samsung Galaxy A50s 64GB', 15, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-7.png?alt=media&token=c0a2418b-05ad-48d7-8e51-297d8e4f0616\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-8.png?alt=media&token=4ac31bab-6d74-4dc8-b62d-a53a30a6fb21\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-9.png?alt=media&token=baaaa92f-eff9-4cb6-a39c-f5ea2355b2aa\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-10.png?alt=media&token=3f84e67a-cd01-4690-8ff2-f4c1af9ef6fc\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-7.png?alt=media&token=c0a2418b-05ad-48d7-8e51-297d8e4f0616', 250, 2, 1, NULL, 5, 0, 70, '2020-10-09 07:37:54', '2020-10-09 07:37:54'),
(177, 'Điện Thoại Samsung Galaxy A50s 64GB', 7500000, 204, 'Điện Thoại Samsung Galaxy A50s 64GB', 'Điện Thoại Samsung Galaxy A50s 64GB', 20, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-9.png?alt=media&token=a90fd571-dc0f-4f4b-89f7-d341601ad9ac\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-8.png?alt=media&token=50583f77-f809-4ce3-9347-953d2944f5e8\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-7.png?alt=media&token=a7a2775b-5555-4c50-bcd5-e7b6621b91d8\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-10.png?alt=media&token=aed27152-4c7f-487c-9d20-bd0475e2281b\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-9.png?alt=media&token=a90fd571-dc0f-4f4b-89f7-d341601ad9ac', 15, 2, 1, NULL, 5, 0, 70, '2020-10-09 07:41:49', '2020-10-09 07:41:49'),
(178, 'Điện Thoại Samsung Galaxy A50s 64GB', 6000000, 204, 'Điện Thoại Samsung Galaxy A50s 64GB', 'Điện Thoại Samsung Galaxy A50s 64GB', 10, '[\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-8.png?alt=media&token=4f21a338-cc1a-473c-8b6d-0e6dcb71fdc0\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-9.png?alt=media&token=0beeabf9-9b09-4f31-ac3f-beb902af3fd7\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-7.png?alt=media&token=66383d40-8f18-4641-b0e5-30a545a4d696\",\"https:\\/\\/firebasestorage.googleapis.com\\/v0\\/b\\/markethub-2f6f4.appspot.com\\/o\\/image-10.png?alt=media&token=dec0bdac-9215-41c8-8640-2f7e245a117e\"]', 'https://firebasestorage.googleapis.com/v0/b/markethub-2f6f4.appspot.com/o/image-8.png?alt=media&token=4f21a338-cc1a-473c-8b6d-0e6dcb71fdc0', 150, 2, 1, NULL, 5, 0, 70, '2020-10-09 07:45:03', '2020-10-09 07:45:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `search_history`
--

CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key_word` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `search_history`
--

INSERT INTO `search_history` (`search_id`, `user_id`, `key_word`, `create_at`) VALUES
(1, 5, 'chuot khong day', '0000-00-00 00:00:00'),
(2, 5, 'chuot khong day', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `avatar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `user_name`, `email`, `phone`, `password`, `address`, `group_id`, `avatar`, `active`) VALUES
(1, 'Mai Vinh', 'vinh', 'vinhmai110@gmail.com', '0230342231', '4107eaebd361f3477b630f4ed7452418', 'siai', 1, 'uploads/users/887001e3298df3d287bc32fd3477ec6e.png', 1),
(3, '', 'thach', 'thanhvinh0108d2000@gmail.com', '0230342231', '573e4dcf8a84c54e73429dd739f0ca42', 'siai', 2, 'uploads/users/c16f6af23b1bfd4941820cd3fdc89b61.png', 1),
(4, 'Mai ', 'test', 'xxxxx@gmail.com', '0230342231', '098f6bcd4621d373cade4e832627b4f6', 'hihi', 3, 'uploads/users/69aaa2f690421129fce440187860f33d.png', 1),
(5, '', 'editor', 'editor@gmail.com', '0132234232', '5aee9dbd2a188839105073571bee1b1f', NULL, 2, NULL, 1),
(7, '', 'vinh1', 'vinhmai510@gmail.com', '0904735110', '4107eaebd361f3477b630f4ed7452418', NULL, NULL, NULL, 1),
(21, '', 'vinhmai', 'vinhmai5701@gmail.com', '0904735110', '1361a6b26c22dfa9522965ba3106223f', NULL, 3, NULL, 1),
(22, '', 'hello', 'thanhvinh01082000@gmail.com', '023034223', 'b68412455721d199822b7c6982f3ac0f', 'siai', 3, 'cjsjdj', 1),
(23, '', 'editor1', 'editor1@gmail.com', '0920320230', 'c9330587565205a5b8345f60c620ecc6', 'test', 2, 'test', 1),
(24, '', 'ngocthach', 'ngocthach26112000@gmail.com', '0778889076', '5a39b236d67c38425f9c91c52f1aecec', NULL, 3, NULL, 1),
(25, '', 'hellsesdwo123', 'thanhvinh01082000s@gmail.com', '0909403023', '36924c298f2176c55166976d2b8807b7', 'siai', 3, 'cjsjdj', 1),
(26, 'Nguyễn Văn Thắng', 'thang', 'cungtrang0164@gmail.com', '092323', '04a501cdb8771edee0647fff7d854a47', 'Nhà Của Tôi', 1, 'https://i.pinimg.com/564x/79/7a/d2/797ad2d491c9b909273d38a8189f6ea7.jpg', 1),
(27, 'Mai ', 'kiem', 'kiem', '092323', 'a5eaf476c5987a9610e1f4743900e958', 'hihi', 2, NULL, 1),
(28, '', '01', '01', '01', '96a3be3cf272e017046d1b2674a52bd3', '01', 2, NULL, 1),
(29, '', '02', '02', '02', 'a2ef406e2c2351e0b9e80029c909242d', '02', 2, NULL, 1),
(30, '', '03', '03', '03', 'e45ee7ce7e88149af8dd32b27f9512ce', '03', 2, NULL, 1),
(32, '', '04', '04', '04', '7d0665438e81d8eceb98c1e31fca80c1', '03', 2, NULL, 1),
(33, '', '05', '05', '05', '751d31dd6b56b26b29dac2c0e1839e34', '03', 2, NULL, 1),
(65, 'Mai Trọng Vinh', 'testxx', 'vinhmai570@gmail.com', '0904735110', '0e35d46eb1045da6f80a7b1e9bc46116', NULL, 3, NULL, 0),
(67, 'Nguyễn Văn Thắngggg', '0326566822', 'cungtrang0978@gmail.com', '0326566821', '9ae8cb5cd3c6aa5a5754aafe37e637e9', 'Nhà Tao', 2, NULL, 1),
(69, 'Hà Kiếm', 'hakiem2552000', 'sonkiema3@gmail.com', '0969293116', 'eda58ccabbd2d52d80d6738bf3bd5cd9', NULL, 2, NULL, 1),
(70, 'Thắng Ốm Teo', 'vanthang', 'vanthang.k44.it.hcmue@gmail.com', '0978040991', '549ed339831fb0e6468e254e35a6feee', 'Hà Nội', 2, NULL, 1),
(71, '123', 'thang123', 'vinhmai57@gmail.com', '0123456789', '0e35d46eb1045da6f80a7b1e9bc46116', NULL, 3, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_like`
--

CREATE TABLE `user_like` (
  `user_like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_like`
--

INSERT INTO `user_like` (`user_like_id`, `user_id`, `product_id`, `liked_at`) VALUES
(3, 27, 30, '0000-00-00 00:00:00'),
(4, 27, 31, '0000-00-00 00:00:00'),
(5, 27, 32, '0000-00-00 00:00:00'),
(6, 1, 32, '0000-00-00 00:00:00'),
(7, 1, 33, '0000-00-00 00:00:00'),
(22, 26, 166, '2020-10-09 05:03:06'),
(26, 26, 94, '2020-10-09 05:05:15'),
(27, 26, 95, '2020-10-09 05:08:11'),
(28, 26, 167, '2020-10-09 05:12:56'),
(32, 1, 76, '2020-10-09 05:34:30'),
(35, 70, 173, '2020-10-09 08:19:00'),
(36, 70, 176, '2020-10-09 08:19:05'),
(37, 70, 178, '2020-10-09 08:40:27'),
(38, 70, 177, '2020-10-09 08:40:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_view`
--

CREATE TABLE `user_view` (
  `user_view_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `viewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_view`
--

INSERT INTO `user_view` (`user_view_id`, `user_id`, `product_id`, `viewed_at`) VALUES
(1, 1, 30, '2020-10-02 02:30:13'),
(2, 1, 31, '2020-10-02 02:30:27'),
(3, 1, 32, '2020-10-02 02:30:37'),
(14, 26, 60, '2020-10-04 10:42:24'),
(15, 26, 68, '2020-10-04 10:43:16'),
(16, 26, 69, '2020-10-04 10:44:54'),
(17, 26, 70, '2020-10-04 10:45:00'),
(18, 26, 71, '2020-10-04 10:45:04'),
(19, 26, 73, '2020-10-04 10:45:20'),
(20, 26, 75, '2020-10-04 10:45:23'),
(21, 26, 77, '2020-10-04 10:45:26'),
(22, 26, 76, '2020-10-04 10:45:30'),
(23, 67, 164, '2020-10-08 10:13:07'),
(24, 67, 89, '2020-10-08 10:14:01'),
(25, 67, 51, '2020-10-08 01:46:00'),
(26, 67, 60, '2020-10-08 01:50:19'),
(27, 67, 59, '2020-10-08 01:59:26'),
(28, 26, 164, '2020-10-08 10:33:34'),
(29, 26, 168, '2020-10-08 10:50:42'),
(30, 26, 169, '2020-10-08 11:38:55'),
(31, 26, 51, '2020-10-08 11:44:01'),
(32, 26, 166, '2020-10-09 12:43:56'),
(33, 26, 167, '2020-10-09 12:59:34'),
(34, 26, 108, '2020-10-09 07:46:55'),
(35, 27, 162, '2020-10-09 01:15:38'),
(36, 26, 171, '2020-10-09 01:16:11'),
(37, 27, 171, '2020-10-09 02:54:59'),
(38, 69, 89, '2020-10-09 03:27:10'),
(39, 69, 94, '2020-10-09 03:27:16'),
(40, 69, 95, '2020-10-09 03:27:18'),
(41, 69, 162, '2020-10-09 03:27:22'),
(42, 26, 95, '2020-10-09 04:36:04'),
(43, 26, 94, '2020-10-09 04:36:06'),
(44, 26, 89, '2020-10-09 04:36:07'),
(45, 26, 162, '2020-10-09 04:36:10'),
(46, 26, 99, '2020-10-09 04:37:40'),
(47, 70, 89, '2020-10-09 06:38:20'),
(48, 70, 94, '2020-10-09 06:38:27'),
(49, 70, 176, '2020-10-09 08:09:30'),
(50, 70, 173, '2020-10-09 08:18:39'),
(51, 70, 171, '2020-10-09 08:27:05'),
(52, 70, 178, '2020-10-09 08:40:05'),
(53, 70, 174, '2020-10-09 08:40:30'),
(54, 70, 175, '2020-10-09 08:40:31'),
(55, 70, 177, '2020-10-09 08:40:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL,
  `voucher_code` char(9) NOT NULL,
  `voucher_name` varchar(100) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_code`, `voucher_name`, `discount`, `quantity`, `shop_id`, `expiration`, `status`, `create_date`, `update_date`) VALUES
(1, 'XZ5I1WI1', 'Voucher cua hang A', 5, 0, 2, 5, 1, '2020-10-01', '2020-10-02'),
(3, 'LLAK7PS0', 'Voucher cua hang B', 5, 20, 27, 10, 1, '2020-10-02', '2020-10-02'),
(6, '3O3XO7L2', 'Voucher cua hang E', 10, 20, 2, 1, 1, '2020-10-02', '2020-10-02'),
(8, 'VGGF1FGI', 'Voucher cua hang G', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(10, 'ZY3HQ60U', 'Voucher cua hang H', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(11, 'B97UK8A5', 'Voucher moi', 20, 15, 5, 7, 1, '2020-10-02', '2020-10-03'),
(12, 'JJXDVXG1', 'Voucher cua hang ppo', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(13, 'BF7I2VEK', 'Voucher cua hang dssad', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(14, 'AVFSKLE0', 'Voucher cua hang ', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(15, 'JU0JRFGW', 'Voucher cua hang 1', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(16, '9OUTT52Z', 'Voucher cua hang 2', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(17, '167HKCD9', 'Voucher cua hang 3', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(18, '0QFB108E', 'Voucher cua hang 4', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(19, '55OXYXOH', 'Voucher cua hang 5', 10, 10, 2, 1, 1, '2020-10-02', '2020-10-02'),
(20, '5HAJPFF8', 'Voucher 2020', 10, 15, 5, 7, 1, '2020-10-03', '2020-10-03'),
(21, 'HELLOW', 'Hello world', 10, 1000, 1, 10, 1, '2020-10-08', '2020-10-08'),
(22, 'HELLOW', 'Hello worldadasd', 10, 1000, 1, 10, 1, '2020-10-08', '2020-10-08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

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
  ADD PRIMARY KEY (`order_item_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product` (`user_id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Chỉ mục cho bảng `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`search_id`);

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
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT cho bảng `group_user`
--
ALTER TABLE `group_user`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT cho bảng `search_history`
--
ALTER TABLE `search_history`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `user_like`
--
ALTER TABLE `user_like`
  MODIFY `user_like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `user_view`
--
ALTER TABLE `user_view`
  MODIFY `user_view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group_user` (`group_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
