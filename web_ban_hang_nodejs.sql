-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 11:01 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web ban hang nodejs`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`idCat`, `nameCat`) VALUES
(1, 'Serum'),
(2, 'Sữa Rửa Mặt'),
(3, 'Kem Dưỡng'),
(4, 'Tẩy Tế Bào Chết'),
(5, 'Dưỡng Thể'),
(6, 'Tẩy Trang'),
(7, 'Kem Chống Nắng'),
(8, 'Trị Mụn, Trị Thâm');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`idComment`, `content`, `ten`, `email`, `date`, `rating`, `idProduct`) VALUES
(1, 'Sản phẩm chất lượng', 'my phuong', 'kenbi.njr@gmail.com', '2023-11-17 20:06:37', 5, 1),
(2, 'Mỹ phẩm xịn quá', 'Lâm Mỹ Khánh', 'mykhanh11190@fpt.edu.vn', '2023-11-09 23:03:11', 3, 27),
(3, 'asd', 'asd', 'kenbi.njr@gmail.cm', '2023-11-22 22:32:55', 5, 4),
(4, 'Sản phẩm hiệu quả, shop bán đồ chất lượng!', 'Lê Gia Huy', 'lgh@gmail.com', '2023-11-17 22:41:28', 1, 3),
(5, 'Xứng đáng với giá tiền', 'Ngọc ', 'nngoc34@gmail.com', '2023-11-15 22:43:02', 5, 2),
(6, 'Peel da mạnh, hiệu quả cao, lưu ý cho người mới bắt đầu dùng mỹ phẩm', 'Biker', 'biker@gmail.com', '2023-11-04 23:34:15', 5, 28),
(7, 'Nón xấu mà mắc quá', 'Biker', 'biker@gmail.com', '2021-03-01 23:34:54', 1, 25),
(8, 'Đã mua ở shop rất nhiều lần rồiiii', 'Lan', 'lan@gmail.com', '2023-11-13 23:34:54', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) DEFAULT NULL,
  `amountProduct` int(11) DEFAULT NULL,
  `S` tinyint(1) DEFAULT 1,
  `M` tinyint(1) DEFAULT 1,
  `L` tinyint(1) DEFAULT 1,
  `imgProduct` varchar(250) DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `dateUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `desProduct` varchar(4000) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `showHide` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `amountProduct`, `S`, `M`, `L`, `imgProduct`, `priceProduct`, `dateUpdate`, `desProduct`, `idCat`, `showHide`, `views`) VALUES
(1, 'COSRX The Niacinamide 15% Serum', 10, 1, 1, 1, '', 400000, '2023-11-16 04:30:13', '1. COSRX là một thương hiệu mỹ phẩm nội địa Hàn Quốc, các sản phẩm từ thương hiệu này thì khá là dịu nhẹ và phù hợp với làn da người châu Á.\r\n\r\n2. Công dụng chính của em serum này là kiểm soát dầu nhờn, hỗ trợ điều trị mụn và dưỡng sáng da với 15% Niacinamide kết hợp cùng với các hoạt chất bổ trợ trong việc ngăn ngừa khuẩn mụn khác là Zinc PCA ...\r\n\r\n3. Ngoài ra, em này còn chứa Acetyl Glucosamine (NAG) và Allatoin có khả năng tẩy da chết, cải thiện sẹo mụn và làm dịu làn da nữa nè.\r\n\r\n4. Sản phẩm không chứa cồn, không chứa hương liệu. Có thể dùng sau bước toner và trước bước kem dưỡng.\r\n\r\n5. Lưu ý kiểm tra độ kích ứng bằng cách bôi một vùng ở quai hàm trước khi dùng cho toàn mặt do nồng độ sản phẩm tương đối cao.', 1, 1, 100),
(2, 'Vaseline Gluta-Hya Serum Burst Lotion Dewy Radianc', 10, 1, 1, 1, '', 105000, '2023-11-13 04:30:24', '- Đều có Glutathione làm sáng da nè. Brand có claim là làm sáng da sau 7 ngày nữa đó mấy bà. Glutathione thì từ lâu đã biết đến là 1 chất có thể làm sáng da thông qua khả năng chống oxy hóa và ức chế enzyme tạo ra hắc sắc tố nè. Em kem màu hồng còn có Niacinamide kết hợp thêm giúp làm sáng da đa tầng\r\n\r\n- Dưỡng ẩm đa tầng cho da, giúp da mềm căng mịn\r\n\r\n- Làm mịn da với dimethicone và petrolatum\r\n\r\n- Thấm nhanh vào da, chưa đến 10 giây\r\n\r\nĐiểm khác biệt\r\n\r\n+ Kem buổi tối (hồng) Dewy Radiance có Niacinamide làm sáng da kèm Titanium dioxide kháng khuẩn và tạo lớp màng sáng da nhẹ giúp thoa lên buổi tối nâng tone sáng hồng nhẹ cho da\r\n\r\n\r\n\r\n', 5, 1, 5),
(3, 'ESSENDORA VIT C Revitalizing Cream', 10, 1, 1, 1, '', 659000, '2021-11-15 04:30:59', 'Thành phần nổi bật trong em này còn có\r\n\r\n- Arbutin với khả năng ức chế enzyme tyrosinase làm giảm sinh tổng hợp melanin, giúp dưỡng sáng da\r\n\r\n- Sodium Ascorbyl Phosphate (SAP): Dạng vitamin C ổn định, tan trong nước có chức năng như chất chống oxy hoá và có khả năng làm sáng da và cải thiện vấn đề lão hóa như nếp nhăn\r\n\r\n- Ascorbyl Glucoside: Một dạng dẫn xuất ổn định của vitamin C kết hợp với glucose. Chất này có chức năng chống oxy và kết hợp rất hiệu quả với các chất dưỡng da và chống oxy hóa khác để bảo vệ các yếu tố giúp da mịn, sáng và khỏe mạnh.\r\n\r\n- Có thêm glycerin dưỡng ẩm, panthenol phục hồi,...\r\n\r\nMột điểm hay nữa là: Việc kết hợp vitamin C vào buổi sáng sẽ giúp hỗ trợ khả năng chống nắng nữa nè, mà sp có 2 loại vitamin C giúp tăng cường khả năng chống oxy hóa hơn\r\n\r\nKết cấu kem thấm ổn, da dầu thì nhớ kiểm soát liều lượng là được nhé\r\n\r\nSản phẩm không có cồn khô nhưng có hương liệu và chiết xuất cam chanh một tí, nên da mấy bà dễ kích ứng với các thành phần này thì nên test trước khi sử dụng nha.\r\n\r\n\r\n\r\n', 3, 1, 50),
(4, 'Ample:N Peeling Shot Ampoule', 5, 1, 1, 1, '', 320000, '2023-11-17 04:31:47', 'Một sản phẩm nữa Duy cũng thấy khá ấn tượng, đó là sp chuyên về tẩy tế bào chết nè\r\n\r\nThành phần em này có:\r\n\r\n- Thành phần tẩy tbc có AHA (ở đây là GLYCOLIC ACID), BHA (SALICYLIC ACID) , PHA (GLUCONOLACTONE ) tuy nhiên nồng độ cụ thể thì Duy chưa thấy thông tin cụ thể, nhưng mà H đứng rất gần đầu bảng tp luôn nên chắc cũng kha khá cao đấy.\r\n\r\n- Thành phần thảo dược lên men tự nhiên cam thảo, cúc La Mã,rau má.... đã được cấp bằng sáng chế loại bỏ chất sừng một lần nữa nhẹ nhàng với độ kích ứng thấp để trả lại làn da sạch sẽ và thông thoáng như em bé.\r\n\r\n- Duy thấy ở đây có thêm panthenol, glycerin các kiểu giúp dưỡng ẩm, phục hồi, giảm kích ứng khi dùng acid quá nhiều nè\r\n\r\nSản phẩm có cồn tuy nhiên D thấy ko nhiều do ko rát da và mùi cồn ko quá nồng, có kha khá nhiều chiết xuất thực vật, có cả chiết xuất cam chanh nữa nên mấy bà da nhạy cảm với các thành phần này nên cân nhắc xíu nha. Nếu da ai hợp thì khá ổn do sản phẩm kết hợp nhiều loại acid để tẩy TBC đa chiều cũng như có thêm thành phần giúp dưỡng ẩm giảm kích ứng từ acid\r\n\r\nCông dụng của sản phẩm này chủ yếu là tẩy tế bào chết, giúp da thông thoáng, cải thiện kết cấu lớp biểu bì da. Duy nghĩ em này không thích hợp cho da quá nhạy cảm đâu, bà nào quen sử dụng acid thì okie nè, đặc biệt hợp vs mấy bà có sử dụng qua các sản phẩm acid có nên cồn thì tham khảo em này tui thấy ổn nha.\r\n\r\nKết cấu sản phẩm dạng nước thấm khá nhanh luôn.', 4, 1, 0),
(5, 'Eucerin micellar water 3 in 1 dermato clean hyalur', 2, 1, 1, 1, '', 250000, '2023-11-19 04:31:18', 'Nước Tẩy Trang Cho Da Nhạy Cảm Eucerin Sensitive Skin Dermatoclean Micellar Water 3 in 1 là nước tẩy trang đặc biệt làm sạch,dịu nhẹ và cấp ẩm cho da nhạy cảm. Sản phẩm được chứng minh lâm sàng phù hợp với làn da nhạy cảm, kể cả làn da quanh mắt và môi. Sản phẩm thuộc thương hiệu dược mỹ phẩm Eucerin đến từ Đức\r\n\r\n• Đặc trưng:\r\n\r\n- Nước Tẩy Trang Cho Da Nhạy Cảm Eucerin Sensitive Skin Dermatoclean Micellar Water 3 in 1 có sự kết hợp của phức hợp làm sạch cực nhẹ dịu Hyaluronic Acid và các thành phần dưỡng ẩm có nguồn gốc tự nhiên giúp duy trì độ ẩm trên da. Làn da không chỉ được làm sạch và còn thoải mái, không bị khô.\r\n\r\n- Hyaluronic Acid và Gluco-Glycerol giúp câp ẩm lâu dài, hình thành mạng lưới giữ ẩm trên da. Điều này giúp tăng cường hiệu quả dưỡng ẩm trên da, hạn chế tình trạng da khô xỉn màu, bảo vệ da tốt hơn.\r\n\r\n- Đặc biệt đối với Gluco-Glycerol có khả năng kích thích tạo ra Aquaporin 3 (AQP3) trong tế bào da người,do đó làm tăng số lượng Aquaporin, càng có nhiều AQP3, sự phân phối độ ẩm trong các lớp sâu hơn của da càng tốt, giúp giữ ẩm cho da và cải thiện chức năng hàng rào da.\r\n\r\n- Chứa phức hợp APG Complex với từ \"G\" là viết tắt của Glucoside là thành phần làm sạch được chứng minh là đặc biệt nhẹ nhàng trên da, đồng thời không chỉ đặc biệt nhẹ nhàng trên da mà còn hỗ trợ chức năng làm sạch hiệu quả lớp trang điểm và bụi bẩn bám trên da.\r\n\r\n- Kết cấu dạng nước tươi mát, tạo cảm giác dễ chịu thư giãn khi sử dụng trên da. Sản phẩm không chứa thành phần cồn, không mùi. Đã hoàn thành thử nghiệm Ophthalmologically, có thể dùng khi đeo kính áp tròng.\r\n\r\n• Đối tượng khuyên dùng:\r\n\r\n- Dành cho mọi loại da, kể cả da nhạy cảm\r\n\r\n- Dành cho làn da mỏng manh, da khô, thiếu ẩm\r\n\r\n- Dành cho làn da thường có tình trạng khô căng, ngứa khó chịu sau khi làm sạch', 6, 1, 0),
(6, 'Cell fusion C Advanced clear sunscreen 100 SPF 50+', 3, 1, 1, 1, '', 300000, '2023-11-22 04:31:26', 'Em này là KCN nâng tone nhưng đặc biệt là tone hồng nên phù hợp các bạn da thiên hồng/ trung tính đánh lên sẽ rạng rỡ và tệp màu da hơn nè. Kết cấu kem không quá đặc, có thể dưỡng ẩm nhẹ, bóng nhẹ thôi, phù hợp cho da thường - hỗn hợp nè, da thiên dầu sẽ hợp hơn da khô 1 tẹo\r\n\r\n- Màng lọc lai kết hợp giữa Titanium dioxide, Zinc Oxide + Homosalate và Octisalate giúp bảo vệ da đạt chuẩn spf 50 PA++++\r\n\r\n-. Thành phần còn có kèm thêm:\r\n\r\n+ Niacinamide, Sodium Ascorbyl Phosphate: kháng viêm và làm sáng da, hỗ trợ giảm viêm phù hợp da có mụn nhẹ\r\n\r\n+ Arbutin làm sáng da\r\n\r\n+ Adenosine: Là một thành phần được biết đến với công dụng làm phục hồi làn da, ngăn chặn hình thành các nếp nhăn.\r\n\r\n+ Alpha-Bisabolol, Panthenol làm dịu da\r\n\r\n- Không cồn không hương liệu, có tí lavender oil. Nhìn chung da hỗn hợp sẽ khá thích em này do finish có dưỡng ẩm nhẹ và khô thoáng không quá ẩm, nâng tone trắng hồng đẹp và có nhiều thành phần dưỡng da kèm theo nè', 7, 1, 0),
(7, 'DrCeutics BHA 2% + ZinC 1%', 5, 1, 1, 1, '', 414000, '2023-11-25 04:31:39', 'Sở hữu thành phần Salicylic acid nồng độ cao 2% trong một công thức thân nước không chứa cồn tạo nên sự độc đáo của sản phẩm.\r\n\r\nSalicylic acid trong công được dùng ở dạng bào chế đặc biệt khi mỗi phân tử được bao bọc bởi phức hợp màng oligomer ở kích thước nano. Điều này cho phép salicylic acid tan tốt trong công thức thân nước và không cần chứa cồn. Các thành phần dưỡng ẩm khác đặc biệt là hyaluronic acid được phối hợp trong sản phẩm mang đến kết cấu mỏng nhẹ tối ưu cho việc sử dụng trên da mụn\r\n\r\nSản phẩm không chứa hương liệu, chất tạo màu nhân tạo, paraben, không thử nghiệm trên động vật.\r\n\r\nNhờ 2% BHA, Zinc PCA, chống oxy hoá khác, BHA 2% Serum đặc biệt có tác dụng:\r\n\r\n+ Tinh chất cô đặc giúp ngăn ngừa mụn\r\n\r\n+ Cải thiện tình trạng mụn, thông thoáng lỗ chân lông\r\n\r\n+ Làm sáng da, mờ vết thâm\r\n\r\nSalicylic Acid\r\n\r\nAxit salicylic giúp vô hiệu hoá hoạt động của các vi khuẩn gây mụn, thu nhỏ lỗ chân lông nhờ vào khả năng thấm sâu, xuyên qua lỗ chân lông phá vỡ các tế bào chết, bụi bẩn bị mắc kẹt. Điều này làm giảm số lượng mụn và tăng tốc độ chữa lành các tổn thương, từ đó ngăn chặn thâm mụn, giảm mẫn đỏ sưng tấy.\r\n\r\nZinc PCA\r\n\r\nLà chất ức chế bã nhờn, giúp giảm thiểu sự xuất hiện không mong muốn chất nhờn dư thừa nhờ vào việc ức chế hoạt động của 5 α -reductase. 5 α –reductase là một enzym hiện diện trong tuyến bã nhờn sẽ chuyển đổi testosterone thành Dyhydroxytestosterone (DHT). DHT được coi là nguyên nhân kích thích tiết bã nhờn. Ngoài ra kẽm còn có phổ kháng khuẩn rộng giúp ngăn ngừa và tiêu diệt vi khuẩn gây mụn, đồng thời hỗ trợ tăng sản xuất collagen giúp ngăn ngừa hình thành sẹo sau mụn.\r\n\r\nCamellia Sinensis Leaf Extract\r\n\r\nChiết xuất trà xanh, chứa các polyphenol cụ thể là catechin. Catechin có tác dụng chống oxy hóa tuyệt vời, chống tia cực tím, chống viêm, kháng khuẩn do đó có khả năng chống lão hóa, cải thiện độ đàn hồi và trị mụn hiệu quả.\r\n\r\nCarica Papaya Fruit Extract\r\n\r\nChiết xuất đu đủ được sử dụng nhiều trong các sản phẩm mỹ phẩm chăm sóc da. Hàm lượng α-hydroxyacids (AHA) trong đu đủ giúp kích thích tái tạo tế bào làm cho lớp sừng mỏng hơn và cải thiện tính linh hoạt của da. Hoạt động tiêu sừng, tẩy tế bào chết này giúp phân hủy các tế bào chết ở lớp da ngoài cùng, do đó cải thiện độ sáng của da. Vì thế chiết xuất đu đủ được sử dụng như một chất có hoạt tính tẩy tế bào chết. Papain ngăn ngừa nhiễm trùng và đẩy nhanh quá trình chữa lành tổn thương thông qua hoạt động chống oxy hóa và kháng khuẩn. Đu đủ có hoạt tính dưỡng ẩm do chứa glucose và fructose, loại đường hút ẩm có khả năng hấp thụ và giữ nước trong những điều kiện nhất định.\r\n\r\nGluconobacter/Honey Ferment Filtrate\r\n\r\nChứa axit gluconic là một axit hữu cơ hiếm có chức năng dưỡng ẩm, làm bong tróc lớp sừng và làm trắng nhanh chóng bằng cách cải thiện sắc tố mà ít khi gây kích ứng hay tác dụng phụ không mong muốn.', 8, 1, 0),
(8, ' unpa Lacto Cica Mild Clear Cleanser', 6, 1, 1, 1, '', 2600000, '2023-12-18 09:05:33', '1. Em SRM này là SRM tạo bọt dịu nhẹ cho da. Chất hoạt động bề mặt đa số là từ amino acid và gốc dừa nên làm sạch vừa phải, nhẹ dịu cho da, điểm này thì D khá ưng nè, phù hợp cho cả da nhạy cảm. Em này là SRM nhưng cũng có phức hợp cica + 5 probiotics nữa.\r\n\r\n2. Em này không cồn không hương liệu, chất HDBM phù hợp cho da nhạy cảm, có phức hợp cica + 5probiotic vậy là cũng đủ đáng mua rồi đó mấy bà :)).\r\n\r\n3. Chất em này dạng kem, tạo bọt nhẹ, sau khi rửa mặt xong khá mềm da, D thấy nó khá tương tự cảm giác em skin1004 sau khi rửa xong. Mặc dù là cho da nhạy cảm nhưng D thấy khá bất ngờ là khả năng làm sạch cũng ổn áp chứ không phải kiểu simple xanh lá đâu :)). Chốt lại là phù hợp cho da thường - hỗn hợp, da nhạy cảm nè\r\n\r\n\r\n\r\n', 2, 1, 0),
(17, 'Cetaphil Bright Healthy Radiance Day Cream SPF15', 10, 0, 1, 1, '', 700000, '2023-11-28 16:12:29', '1. Một thứ không thể thiếu trong routine là kem dưỡng ẩm. Việc dưỡng ẩm đủ cũng sẽ khiến da đều màu hơn bởi các tế bào được ngậm đủ nước sẽ trở nên căng và bề mặt da sẽ nhẵn mịn hơn đó.\r\n\r\n2. Ngoài điểm nổi bật nhất của line này là Công nghệ Gentle Bright: Niacinamide + hoa Thủy Tiên biển để làm sáng và đều màu da, thì kem dưỡng ẩm ban ngày này có thêm tận 6 màng lọc chống nắng để giúp bảo vệ da khỏi tác hại của tia UV - nguyên nhân hàng đầu gây nên sạm da, thâm mụn và tăng sắc tố.\r\n\r\n3. Chỉ số chống nắng là SPF 15 thôi nên sẽ phù hợp với những hôm nào mọi người không đi ra ngoài. Còn khi đi ra khỏi nhà thì chỉ cần bôi thêm 1 lớp kem chống nắng nữa là xong.\r\n\r\nTrên da có thêm 1 lớp kem dưỡng sáng + 1 lớp chống nắng thì cũng sẽ tốt hơn chỉ bôi kem chống nắng đơn thuần đúng hong?\r\n\r\n4. Kem dưỡng cũng chứa thêm 1 số hoạt chất dưỡng da khác nữa như là chiết xuất lá đỗ quyên, hạt cây cicer thuỷ phân để bảo vệ da khỏi tác động có hại từ môi trường,\r\n\r\n5. Kem dưỡng của Cetaphil thì khỏi phải bàn về độ lành tính, vì nó đã quá lành tính =))\r\n\r\nKhông cồn, không hương liệu, không có chỗ nào để chê!', 3, 1, 7),
(19, 'FATION NoSCalm Repair Intensive Ampoule', 4, 0, 1, 1, '', 600000, '2023-11-26 16:12:05', '1. Một chiếc Ampoule có khả năng phục hồi khá là xịn sò cho những ai sau xâm lấn da , hoặc bị khô bong tróc , kích ứng các thứ luôn nhá ! Với thành phần chủ đạo trong em này đó là Niacinamide và phức hợp NOSCALM. Với Niacinamide thì hỗ trợ làm giảm thâm, giảm viêm cho những làn da đang bị nhạy cảm , tiếp xúc nhiều vs môi trường như ánh nắng mặt trời , khói bụi ô nhiễm của mùa hè này. Còn phức hợp NOSCALM thì sẽ hoạt động hiệp đồng vs Niacinamide giúp phục hồi da nhanh chóng hơn. Đặc biẹt tỷ lệ thành phần Chiết xuất ngải cứu chiếm 30% tối ưu hỗ trợ làm dịu làn da nhạy cảm và hỗ trợ làn da hư tổn, giảm thâm đỏ\r\n\r\n2. Đánh giá về kết cấu serum thì nó có độ nhớt vừa phải, dễ thấm, không lo bị bít tắc lỗ chân lông cho những bạn nào thuộc type da dầu nhé ! Còn da mụn thì phải lo trị mụn trước đi , đừng có đâm đầu dô dùng phục hồi đó nha ! Trị xong thì còn thâm đỏ thâm đen thì mới chạy qua xài mấy cái phục hồi trị thâm này nhen !\r\n\r\n3. Đánh giá chung của Duy thì em này có công nghệ phức hợp khá là xịn sò , nên tốc độ phục hồi ổn áp cho những bạn có làn da nhạy cảm, còn về mặt trị mụn hay trị thâm thì nó chưa có sáng giá lắm , nếu như nó chứa thêm Tranexamic acid hay gì đó thì có lẽ sẽ xịn sò hơn 1 chút nè :v À, trong em này không có cồn hay hương liệu gì đâu nhé !\r\n\r\n\r\n\r\n', 1, 1, 2),
(21, 'Beplain Multi Vitamin Ampoule', 3, 1, 1, 0, '', 345000, '2023-11-30 16:14:04', '1. Em này là serum làm sáng da với nhiều loại vitamin tổng hợp trong này, trong đó nổi bật là B3 (Niacinamide) nhe\r\n\r\n2. Điểm đặc biệt của sản phẩm là:\r\n\r\n- 5% Niacinamide giúp làm sáng da, kháng viêm cải thiện mụn, chống oxy hóa, dưỡng ẩm và phục hồi da [3]. Base ko dùng nước nguyên chất mà dùng nước Hắc mai biển và có kèm dầu HMB luôn- 1 loại thực vật giàu omega 3-6-9, giúp chống oxy hóa và làm dịu da.\r\n\r\n- Sp cũng có vitamin B5 (0.01%) và các dẫn xuất vitamin B,C khác; về sáng da thì có tranexamic acid + arbutin + phức hợp 3 loại vitamin C: EAA, LAA, Ascorbyl Glycoside ; lecithin và betaglucan làm dịu da và dưỡng ẩm\r\n\r\n3. Kết cấu dạng gel lỏng, mỏng hơn cái gel trên và thấm nhanh; để lại một lớp dưỡng ẩm mỏng nhẹ glowy, xài lên lớp finish khá thích; thành phần lành tính nên da nhạy cảm cũng dùng được nha\r\n\r\n\r\n\r\n\r\n', 1, 1, 8),
(23, 'Beauty of Joseon Glow Deep Serum : Rice + Arbutin', 4, 0, 1, 0, '', 310000, '2023-11-22 16:15:35', '1. Một chiếc serum đến từ Hàn Quốc, với các active trong chai này sẽ hỗ trợ làm sáng da cho những bạn nào mà bị ít thâm, còn nhiều thâm quá thì em này không đủ đô đâu nhen !\r\n\r\n2. Trong này có chứa Alpha Arbutin, hỗ trợ ngăn chặn tăng sắc tố, ngoài ra còn có thêm 68% chiết xuất nước gạo giúp giữ ẩm và làm sáng da nữa nè\r\n\r\n3. Em này có kết cấu lỏng, nhưng phải đợi 1 chút để thấm vào da lâu hơn so với những em serum khác, thế nên hãy layer sau cùng trong routine luôn nha cả nhà nếu là da dầu nhen ! Kết cấu em này sẽ phù hợp cho những da nào muốn dưỡng ẩm , một cách mà Duy recommend khi dùng em này đó là hãy tẩy da chết với AHA 8% của Neostrata , rồi apply lên và đi ngủ , đảm bảo hiệu quả làm sáng da là thấy khác luôn đó !\r\n\r\n4. Không chứa cồn và hương liệu là điểm cộng cho em này nhé ! Hiệu quả Duy xài thì không thấy nó diễn biến nhanh trong 1 tháng , nhưng xài lâu hơn khoảng ~8 tuần thì sẽ có khả năng làm sáng da tốt hơn nè ! Cảm nhận thì Duy đánh em này chừng 8/10 nhe !\r\n\r\n\r\n\r\n', 1, 1, 2),
(25, 'Goodndoc Centella Repair Cream', 3, 1, 1, 1, '', 370000, '2023-11-19 16:19:01', 'Em này được xem là bảo bối cho những làn da nhạy cảm, dị ứng corticoid do kem trộn, da bị tổn thương sau phi kim, lăn kim,… Sản phẩm chứa chiết xuất chính từ cây rau má giúp khắc phục tình trạng xấu của da, phục hồi những tổn thương và trả lại sự mịn màng, tươi sáng cho làn da\r\n\r\nChứa 100% chiết xuất có lợi cho da như: rau má, rễ cây hoàng cầm,... giúp giảm viêm và làm dịu da khá tốt, da nào đang mụn thì em này xem như là chân ái luôn đó ! Kết cấu cũng nhẹ dịu nữa nè !\r\n\r\nNgoài ra còn, bổ sung thêm Allantoin, Ceramide, Squalane, Panthenol,... nhiều thành phần vàng trong làng dưỡng da luôn đó mn ! Vừa an toàn dịu nhẹ với làn da, vừa củng cố hàng rào bảo vệ da vững chắc hơn, nói chung cấp ẩm cực kỳ tốt á cả nhà ! Da khô cũng có thể xài được nữa !\r\n\r\nĐánh giá chung thì em này không chứa cồn khô, nhưng lại có 1 ít hương liệu nên ai có làn da nhạy cảm thì lưu ý xíu nha ! Về kết cấu thì em này có dạng gel cream nên khá dễ thấm, không gây bí bách hay bết dính gì đâu nè, xài rồi là mê ly luôn á !', 3, 1, 22),
(26, 'A-DERMA PHYS-AC PERFECT ANTI-BLEMISH FLUID', 7, 0, 0, 1, '', 380000, '2023-11-14 16:20:45', '1. A-DERMA là sản phẩm chăm sóc da chuyên biệt cho làn da nhạy cảm, mỏng manh đến từ nước Pháp từ năm 1982. Thương hiệu A-DERMA được tin dùng bởi hơn 45000 bác sĩ da liễu trên khắp thế giới. Các dòng sản phẩm của A-Derma đều được tinh chế bởi công nghệ hiện đại và thành phần thiên nhiên lành tính, đảm bảo tối đa sự tinh khiết cho sản phẩm, không hương liệu, không màu, không cồn, không paraben, giúp làn da của bạn được chăm sóc tốt nhất bằng dược mỹ phẩm an toàn.\r\n\r\n2. A-DERMA được các bác sĩ da liễu khuyên dùng lâu dài cho các khách hàng có da dễ kích ứng, eczema, chàm thể tạng, da viêm, tăng tiết bã, da viêm tiếp xúc... mà không gây bất cứ tác dụng phụ có hại nào.\r\n\r\n3. Công dụng:\r\n\r\nKem dưỡng PHYS-AC PERFECT ANTI-BLESHMISH FLUID là kem dưỡng chuyên biệt dành cho da mụn, giúp làm giảm lượng bã nhờn dư thừa và hạn chế khuẩn gây mụn bám vào da, giúp giảm và ngừa mụn; làm dịu và giảm mẩn đỏ do kích ứng; loại bỏ tế bào chết và tạp chất sâu trong lỗ chân lông; đồng thời ngăn ngừa hình thành thâm sẹo sau mụn.\r\n\r\n- Cicahyalumide: được cấp bằng sáng chế độc quyền trong việc ngăn ngừa hình thành sẹo, thâm, các vết viêm đỏ và đốm nâu trên da.\r\n\r\n- Chiết xuất Rhealba Oat: làm dịu, phục hồi da, giảm mẩn đỏ.\r\n\r\n- AHA/BHA (Salicylic acid, glycolic acid, lactic acid) ở độ pH 3.5: các hoạt chất tiêu sừng giúp loại bỏ tế bào da chết, làm sạch và thông thoáng lỗ chân lông, giúp giảm mụn và ngừa mụn hình thành.\r\n\r\n- Zinc: kiềm dầu, hỗ trợ giảm và ngừa mụn\r\n\r\n4, Đối tượng sử dụng:\r\n\r\n- Dành cho da dầu - hỗn hợp thiên dầu.\r\n\r\n- Dành cho da dễ bị lên mụn, mụn viêm.', 3, 1, 100),
(27, 'Perfect Image Salicylic 20% Gel Peel', 100, 1, 1, 1, '', 1000000, '2023-11-08 16:22:17', '1. Sản phẩm chứa 20% Salicylic Acid sẽ có khả năng tấn công mạnh mẽ vào sâu bên trong trung bì, giúp cải thiện nhiều vấn đề khác nhau cho da, và cũng có khá nhiều rủi ro nếu không biết cách peel da đúng cách bằng sản phẩm này.\r\n\r\n2. Với nồng độ 20% Salicylic acid, phái nói là rất cao, khả năng gây bỏng da cũng sẽ rất cao. Tuy nhiên, sản phẩm không chỉ dừng ở mức cải thiện bề mặt của da, mà còn có thể hỗ trợ điều trị các vấn đề về nếp nhăn cho da, và một số loại sẹo non (sẹo có độ tuổi thấp hơn 12 tháng).\r\n\r\n3. Vì khả năng gây kích ứng mạnh mẽ, bong tróc da, bỏng da… vì vậy việc sử dụng sản phẩm này rất cần người có trình độ chuyên môn và có kinh nghiệm peel da chuyên nghiệp. Và không sử dụng sản phẩm này tự peel tại nhà. Vì nồng độ acid khá cao, có thể gây khô da sau khi peel vì vậy trước ngày peel bạn cần phải dưỡng ẩm thật kỹ cho da nhé, để hạn chế được một số tình trạng kích ứng mạnh do sản phẩm gây ra.\r\n\r\n4. Lưu ý cực kỳ quan trọng đó KHÔNG TỰ Ý sử dụng sản phẩm này tại nhà mà không có người có kiến thức chuyên môn và kinh nghiệm hỗ trợ. Nên có bước chuẩn bị da kỹ trước khi peel, sử dụng các dung dịch pre-peel để giảm các kích ứng mạnh. Và điều chắc chắn nên làm đó là ở nhà sau khi peel bằng sản phẩm này nhé! Hạn chế tuyệt đối việc ra khỏi nhà sau khi peel bằng sản phẩm này. Và nên ở nhà khoảng 2 ngày sau khi peel da với sản phẩm này nhé!', 4, 1, 300),
(28, 'Krave Kale-lalu-yAHA', 3, 0, 1, 1, '', 680000, '2023-11-17 16:27:15', '- Thành phần có 5,25% Glycolic acid vừa giúp điều trị tăng sắc tố, còn cắt tế bào chết thành những mảnh nhỏ hơn và làm sạch. Betaine Salicylate (Dẫn xuất Salicylic) sẽ cùng với Glycolic acid hỗ trợ điều trị mụn đỏ nhưng nhẹ nhàng hơn Salicylic acid. Cùng với những chiết xuất thực vật, vit B5 (Panthenol), muối HA giúp cho da được giữ ẩm, tránh sự đi sâu quá mức của acid và làm dịu da.\r\n\r\n- AHA còn giúp tăng sinh collagen, cải thiện bề mặt da giúp da trông căng mướt mịn màng hơn nè\r\n\r\n- Lớp finish mỏng, không gây bóng dầu. Khi sử dụng thì apply trực tiếp lên mặt hoặc cho ra cotton patch rồi xài dần, rất là phê :)))\r\n\r\n\r\n\r\n', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `ho`, `ten`, `email`, `username`, `password`, `phone`, `address`) VALUES
(1, 'Lý', 'Mỹ Duyên', 'myduyen@gmail.cm', 'admin', '123', 768874294, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCat` (`idCat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `catalog` (`idCat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
