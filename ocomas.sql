SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `ocomas`

-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'VEGETARIAN DISHES', 'A delicious selection of vegetarian delights made with fresh ingredients and aromatic spices.', NOW()),  
(2, 'NON-VEGETARIAN DISHES', 'Enjoy our mouth-watering non-vegetarian dishes, prepared with premium quality meats and flavorful seasonings.', NOW()),  
(3, 'APPETIZERS', 'Start your meal with our tasty appetizers, including a mix of crispy, spicy, and tangy bites.', NOW()),  
(4, 'BURGERS', 'Enjoy our juicy, flavorful burgers made with premium ingredients and a variety of toppings.', NOW()),  
(5, 'SANDWICHES', 'Delight in our fresh and tasty sandwiches, crafted with delicious fillings and bread choices.', NOW()),
(6, 'PIZZAS', 'Enjoy our handcrafted burgers and pizzas made with fresh breads, rich flavourful sauces and juicy meats', NOW()), 
(7, 'BREAD & RICE', 'Complete your meal with our freshly baked bread and flavorful rice varieties.', NOW()),  
(8, 'DESSERTS', 'Indulge in our delightful range of desserts, from classic favorites to unique sweet treats.', NOW()),  
(9, 'BEVERAGES', 'Quench your thirst with our wide selection of refreshing beverages, including juices, sodas, and mocktails.', NOW());

-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `itemId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemId` int(12) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `itemPrice` decimal(10,2) NOT NULL,
  `itemDesc` text NOT NULL,
  `itemCategorieId` int(12) NOT NULL,
  `itemPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--
INSERT INTO `item` (`itemId`, `itemName`, `itemPrice`, `itemDesc`, `itemCategorieId`, `itemPubDate`) VALUES

-- VEGETARIAN DISHES
(1, 'Paneer Tikka', 249, 'Cubes of paneer marinated in tandoori spices and grilled to perfection.', 1, NOW()),
(2, 'Chole Bhature', 199, 'Spiced chickpea curry served with fluffy fried bread.', 1, NOW()),
(3, 'Vegetable Korma', 229, 'A rich and creamy mixed vegetable curry with cashew and coconut sauce.', 1, NOW()),
(4, 'Aloo Paratha', 149, 'Whole wheat stuffed bread with spicy mashed potatoes, served with yogurt.', 1, NOW()),
(5, 'Palak Paneer', 259, 'Cottage cheese cubes cooked in a smooth spinach gravy.', 1, NOW()),
(6, 'Mix Veg Curry', 219, 'A delicious mix of seasonal vegetables cooked with Indian spices.', 1, NOW()),
(7, 'Matar Paneer', 249, 'Soft paneer cubes and green peas in a flavorful tomato-based curry.', 1, NOW()),
-- NON-VEGETARIAN DISHES
(8, 'Tandoori Chicken', 349, 'Juicy chicken marinated in yogurt and spices, roasted in a tandoor.', 2, NOW()),
(9, 'Chicken Curry', 299, 'A flavorful chicken curry cooked in a rich onion-tomato gravy.', 2, NOW()),
(10, 'Prawn Masala', 399, 'Spicy and flavorful prawn curry cooked in a coconut-based sauce.', 2, NOW()),
(11, 'Mutton Korma', 429, 'Slow-cooked mutton in a rich and creamy cashew-based gravy.', 2, NOW()),
(12, 'Fish Curry', 349, 'Traditional fish curry made with fresh fish, tamarind, and coconut.', 2, NOW()),
(13, 'Butter Chicken', 369, 'Tender chicken pieces cooked in a creamy tomato-based butter sauce.', 2, NOW()),
-- APPETIZERS
(14, 'Cheese Garlic Bread', 119, 'Freshly baked garlic bread with a generous layer of melted cheese', 3, NOW()),
(15, 'Stuffed Garlic Bread', 149, 'Garlic bread stuffed with cheese, corn, and jalapenos', 3, NOW()),
(16, 'French Fries', 99, 'Crispy golden fries, lightly salted and perfect for snacking', 3, NOW()),
(17, 'Potato Wedges', 129, 'Seasoned and baked potato wedges served with a side of dip', 3, NOW()),
(18, 'Tandoori Paneer Tikka', 199, 'Cubes of paneer marinated in tandoori spices and grilled to perfection', 3, NOW()),
(19, 'Chicken Wings (Spicy)', 229, 'Spicy chicken wings tossed in a flavorful hot sauce', 3, NOW()),
-- BURGERS 
(20, 'Classic Veg Burger', 199, 'Crispy veggie patty, lettuce, tomato, and cheese in a soft bun.', 4, NOW()),
(21, 'Paneer Burger', 229, 'Grilled paneer patty with lettuce, mayo, and cheese in a sesame bun.', 4, NOW()),
(22, 'Spicy Chicken Burger', 249, 'Crispy chicken patty with spicy sauce, lettuce, and cheese.', 4, NOW()),
(23, 'Cheese Burst Burger', 279, 'Juicy chicken/veggie patty with extra cheese filling.', 4, NOW()),
(24, 'BBQ Chicken Burger', 299, 'Grilled chicken with smoky BBQ sauce, caramelized onions, and lettuce.', 4, NOW()),
(25, 'Mushroom Swiss Burger', 259, 'Grilled mushrooms, Swiss cheese, and a juicy patty in a toasted bun.', 4, NOW()),
-- SANDWICHES
(26, 'Grilled Cheese Sandwich', 149, 'Classic grilled sandwich with melted cheese and buttered bread.', 5, NOW()),
(27, 'Club Sandwich', 249, 'Triple-layer sandwich with chicken, egg, lettuce, tomato, and mayo.', 5, NOW()),
(28, 'Paneer Tikka Sandwich', 199, 'Spiced paneer filling with capsicum, onion, and mint chutney.', 5, NOW()),
(29, 'Chicken Mayo Sandwich', 229, 'Shredded chicken mixed with creamy mayo, served in toasted bread.', 5, NOW()),
(30, 'Veggie Delight Sandwich', 179, 'Loaded with fresh veggies, cheese, and a tangy dressing.', 5, NOW()),
(31, 'Tuna Melt Sandwich', 279, 'Tuna salad topped with melted cheese, served in grilled bread.', 5, NOW()),
-- PIZZAS
(32, 'Margherita', 99, 'A hugely popular margherita, with a deliciously tangy single cheese topping', 6, NOW()),
(33, 'Double Cheese Margherita', 199, 'The ever-popular Margherita - loaded with extra cheese', 6, NOW()),
(34, 'Farm House', 149, 'A pizza that goes ballistic on veggies! Check out this mouth-watering overload of crunchy capsicum, succulent mushrooms, and fresh tomatoes', 6, NOW()),
(35, 'Peppy Paneer', 249, 'Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!', 6, NOW()),
(36, 'Chicken Dominator', 299, 'Loaded with double pepper barbecue chicken, peri-peri chicken, chicken tikka & grilled chicken rashers', 6, NOW()),
(37, 'Chicken Golden Delight', 269, 'Double pepper barbecue chicken, golden corn, extra cheese - mouthwatering treat!', 6, NOW()),
(38, 'Chicken Tikka Pizza', 249, 'Delicious chicken tikka chunks on a cheesy crust with a hint of Indian spices', 6, NOW()),
(39, 'BBQ Chicken Pizza', 289, 'Juicy BBQ chicken, onions, and a drizzle of BBQ sauce on top of a cheesy base', 6, NOW()),
-- BREAD & RICE
(40, 'Tandoori Roti', 29, 'Soft and fluffy whole wheat roti baked in a tandoor', 7, NOW()),
(41, 'Butter Naan', 49, 'Soft and buttery naan, a perfect companion to curries', 7, NOW()),
(42, 'Chicken Biryani', 279, 'Basmati rice cooked with chicken and aromatic spices.', 2, NOW()),
-- DESSERTS
(43, 'Gulab Jamun', 79, 'Soft, syrupy dumplings made of milk solids and flavored with cardamom', 8, NOW()),
(44, 'Rasmalai', 99, 'Soft cheese dumplings soaked in sweetened saffron milk', 8, NOW()),
(45, 'Chocolate Brownie', 149, 'Rich, fudgy brownie served with chocolate sauce', 8, NOW()),
(46, 'Vanilla Ice Cream', 99, 'Classic creamy vanilla ice cream', 8, NOW()),
(47, 'Chocolate Ice Cream', 99, 'Decadent chocolate-flavored ice cream', 8, NOW()),
(48, 'Chocolate Lava Cake', 199, 'Warm chocolate cake with a gooey molten center', 8, NOW()),
-- BEVERAGES
(49, 'Mango Lassi', 129, 'Refreshing yogurt-based mango drink', 9, NOW()),
(50, 'Cold Coffee', 149, 'Iced coffee blended with milk and sugar', 9, NOW()),
(51, 'Cappuccino', 149, 'Rich and frothy espresso-based coffee', 9, NOW()),
(52, 'Fresh Lime Soda', 99, 'A refreshing soda-based lemon drink', 9, NOW()),
(53, 'Masala Chai', 79, 'Spiced Indian tea made with milk and aromatic spices', 9, NOW()),
(54, 'Soft Drink (Coke)', 49, 'Chilled carbonated soft drink', 9, NOW()),
(55, 'Mineral Water', 29, 'Pure and refreshing bottled water', 9, NOW()),
(56, 'Mojito', 169, 'Refreshing mint and lime-based mocktail', 9, NOW()),
(57, 'Iced Tea', 129, 'Chilled tea infused with lemon and mint', 9, NOW()),
(58, 'Hot Chocolate', 179, 'Rich, creamy, and indulgent hot chocolate drink', 9, NOW()),
(59, 'Strawberry Milkshake', 199, 'Creamy strawberry-flavored milkshake topped with whipped cream', 9, NOW());
-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Online Canteen', 'aadityasakhardande@gmail.com', '+14807919046', '+918104090173', 'Vile Parle, Mumbai', NOW());

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemId`);
ALTER TABLE `item` ADD FULLTEXT KEY `itemName` (`itemName`,`itemDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;s
