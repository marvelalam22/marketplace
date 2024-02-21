-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 07:51 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketplace_baju`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Clothes', 'clothes', '2024-02-20 22:33:26', '2024-02-20 22:33:26'),
(2, 'Jeans', 'jeans', '2024-02-20 22:33:26', '2024-02-20 22:33:26'),
(3, 'Shoes', 'shoes', '2024-02-20 22:33:26', '2024-02-20 22:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_11_080307_create_posts_table', 1),
(6, '2024_01_12_105111_create_categories_table', 1),
(7, '2024_02_14_164133_add_is_admin_to_users', 1),
(8, '2024_02_20_151111_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rekening` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `id_keranjang` int(11) DEFAULT NULL,
  `price_keranjang` decimal(10,2) DEFAULT NULL,
  `status_payment` int(11) DEFAULT NULL,
  `batas_waktu_order` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `post_id`, `user_id`, `name`, `alamat`, `email`, `telepon`, `rekening`, `no_rekening`, `price`, `id_keranjang`, `price_keranjang`, `status_payment`, `batas_waktu_order`, `created_at`, `updated_at`) VALUES
(1, 21, NULL, 'Alam Al Mabruk', NULL, 'alamalmabruk@gmail.com', '085733325997', 'BCA', 999999, '530000.00', NULL, NULL, NULL, '2024-02-21 15:04:32', '2024-02-21 00:49:33', '2024-02-21 00:49:33'),
(2, 19, 2, 'Alam Al Mabruk Lagi', NULL, 'alamalmabruk2@gmail.com', '085733325997', 'BCA', 999999, '220000.00', NULL, NULL, NULL, '2024-02-21 15:06:04', '2024-02-21 00:51:04', '2024-02-21 00:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `price`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Voluptatem aut cupiditate voluptas.', 'aut-expedita-saepe-rerum-ea-et-deleniti-maxime', NULL, 'Dolorem unde qui libero quidem fuga. Aut iste cum voluptatem praesentium et aut nihil. Provident temporibus similique cupiditate quis aut. Quia nobis deserunt recusandae exercitationem.', '<p>Nemo dolores similique ut aut tempore voluptates amet. Sit optio amet et. Aut esse aut consequuntur odio. Quia rerum voluptas ex libero consequuntur enim consequatur.</p><p>Adipisci aut aut inventore accusantium enim nam expedita. Voluptatem alias quis et tempora. Eius accusantium vel vitae repellat.</p>', '682000.00', NULL, '2024-02-20 22:33:26', '2024-02-20 22:33:26'),
(2, 3, 1, 'Ratione itaque qui.', 'provident-qui-est-facilis-quia', NULL, 'Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatem velit ea. Et voluptas molestias et fugit facilis.', '<p>Nesciunt perspiciatis sit ut dolores nemo nobis. Tenetur atque itaque quidem consequatur ex eum harum. Quod fugiat nobis sint. Et et eligendi recusandae quos facilis doloribus temporibus.</p><p>Doloribus facere vel accusantium ipsa. Beatae porro sint rerum aut qui eos quas. Nihil tempore non unde voluptatem.</p>', '2097000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(3, 1, 1, 'Facilis neque veritatis earum ex non fugiat repellendus voluptatem.', 'voluptatem-repellat-accusantium-amet-explicabo-id', NULL, 'Sapiente libero ut exercitationem voluptas similique. Vero cum rerum vel repudiandae. Illum ducimus voluptas in rem tempora dolor adipisci.', '<p>Rerum et quaerat et explicabo. Voluptas nihil fugiat velit nam iure. Ab aut incidunt porro consequatur tempore dolore dolorem.</p><p>Qui accusamus nobis non aut. Quibusdam beatae laborum quisquam. Molestias et natus quos consequuntur ea consequatur culpa.</p>', '523000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(4, 3, 1, 'Et voluptatem quasi dignissimos.', 'impedit-voluptatem-maxime-quae-adipisci-nam-aut-qui', NULL, 'Sequi eum esse aut deleniti architecto. Nisi perspiciatis atque magnam et rem. Ad delectus id ut sapiente sed accusamus ut. Vitae pariatur nesciunt nulla facilis officiis sunt et.', '<p>Omnis qui quia sapiente aperiam. Non dolorem quos consectetur repudiandae dolores itaque. Quam odio magnam tempora laudantium corrupti unde. Suscipit quis quisquam consequatur dicta officia quibusdam.</p><p>Debitis expedita quia quia quas. Sed nihil culpa aliquid. Amet consectetur numquam aut numquam aperiam sunt ratione.</p>', '1805000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(5, 1, 1, 'Repudiandae porro voluptatem tempore et natus vel.', 'voluptatem-aut-fuga-aspernatur-ut-voluptatem-quisquam-odit-accusantium', NULL, 'Aspernatur molestiae animi facere possimus dolorum dolores magnam. In perferendis voluptas voluptas assumenda voluptatem quidem repellendus. Ex possimus consequatur itaque sint. Voluptatem est aspernatur velit et.', '<p>Fugit sit autem voluptatem enim. Dolorem esse rem quo qui consequuntur. Dolor saepe voluptatem excepturi sequi.</p><p>Incidunt quia tempora dolorem laudantium eos voluptatem. Veritatis cum et qui sed. Laboriosam atque sit incidunt quam et. Possimus voluptas officia dolores accusamus.</p>', '2130000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(6, 3, 1, 'Quasi aut et pariatur tempore qui labore tempora aut.', 'dolor-sunt-corrupti-cupiditate', NULL, 'Quam est itaque architecto molestias occaecati. Similique et ut illum expedita sunt blanditiis illo aut. Laborum eius nam quod omnis.', '<p>Aut ratione nemo omnis dicta. Quod quia non qui fugit accusamus omnis. Illum dolores molestias rerum nam nulla. Officiis vel accusantium voluptatibus.</p><p>Iusto quos et magnam excepturi. Libero sit ipsam corporis rerum exercitationem. Et molestiae adipisci voluptates ullam voluptatem facilis. Modi provident architecto distinctio hic laborum et.</p>', '4417000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(7, 1, 1, 'Qui omnis et.', 'consequatur-aut-a-dolor-voluptatem-expedita', NULL, 'Dolor earum iste et deserunt atque. Et suscipit voluptate enim fugit modi qui fugiat. Consequatur soluta iusto quasi velit et cum illum.', '<p>Eligendi iste autem occaecati adipisci quia. Molestias quaerat omnis necessitatibus ut sit quasi quas commodi. In laborum voluptatibus eligendi voluptas illo et iure.</p><p>Quia ipsa id ut nesciunt iste quia ducimus sapiente. Nostrum voluptas facere aut.</p>', '3014000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(8, 2, 1, 'Tempora laboriosam qui voluptatem aut accusamus doloribus quo quaerat.', 'quasi-ut-dolorem-porro-commodi', NULL, 'Alias non quo dolor harum quis. Ipsa modi qui ab enim sed quos. Officia saepe dignissimos numquam quia omnis. Sit autem sed qui dolorum dicta hic non.', '<p>Ducimus neque pariatur adipisci voluptatem natus ducimus reiciendis. Atque et quaerat repudiandae aperiam.</p><p>Facere perferendis qui qui fuga distinctio labore veritatis culpa. Nihil occaecati vitae beatae id quaerat qui iure vel. Est iste aut soluta.</p>', '4779000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(9, 2, 1, 'Blanditiis aut doloremque dolorem explicabo repudiandae veniam hic accusantium est.', 'quia-culpa-possimus-optio-eius-nam-rerum', NULL, 'Autem excepturi sit fugit earum nobis nesciunt. Autem ipsum similique mollitia itaque odit esse nisi. Accusamus ex velit accusamus rerum.', '<p>Magni omnis voluptatem culpa vitae ut quisquam. Unde rerum aut omnis eveniet aut. Quam vero ex repellendus.</p><p>Ut nihil eligendi commodi. Id ad pariatur omnis.</p>', '557000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(10, 1, 1, 'Error possimus aut illo cum.', 'vel-nihil-aspernatur-architecto-ipsam-dolorem-omnis', NULL, 'Quia quidem deleniti ducimus optio. Est in atque aliquam hic similique eaque. Nostrum quaerat rerum suscipit perferendis eum impedit harum.', '<p>Ut et doloribus consequatur est. Inventore sit eligendi in est occaecati quasi. Dolores magni sit reiciendis voluptatem fuga itaque.</p><p>Perferendis perspiciatis praesentium iusto est aliquid. Vero autem et ratione quis odio laudantium.</p>', '2973000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(11, 3, 1, 'Dicta debitis et sint.', 'at-laudantium-maxime-beatae', NULL, 'Autem fugit aut earum alias. Error recusandae et asperiores omnis. Debitis officia suscipit ea voluptatem minima aut.', '<p>Non amet voluptatem voluptatum libero voluptas esse esse. Ut provident quia neque et sapiente vitae natus. Quia et natus iste fuga.</p><p>Fugit praesentium ut molestiae sit omnis autem. Et voluptatem nisi sit consequatur minus distinctio. Sint cupiditate nulla occaecati ea pariatur culpa ut.</p>', '2522000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(12, 3, 1, 'Officia illo qui impedit qui.', 'quis-repellendus-dolores-ratione-inventore-nesciunt-vitae-inventore-adipisci', NULL, 'Reiciendis sed ipsum consequatur repudiandae nisi natus. Vel placeat non vel repellat delectus ab accusantium molestiae. Exercitationem est libero possimus et provident.', '<p>Quis rerum neque tenetur dolorum. Quia quo laudantium tenetur suscipit molestiae.</p><p>Magnam aut nisi qui officia ducimus aut ut occaecati. Est veritatis laudantium hic commodi tenetur nisi. Eum est quidem quae consequatur repudiandae. Pariatur rerum eos tempora quo laudantium sit.</p>', '465000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(13, 2, 1, 'Sit asperiores neque voluptates.', 'non-et-veniam-quia-earum-expedita-sed-suscipit', NULL, 'Quibusdam est consequatur in ut atque et ab. Ex dolorum fuga voluptatem dolores dolores alias. Dicta minus fugiat ut asperiores. Aut est occaecati ipsum voluptates sed assumenda.', '<p>Eos dolore esse fugit enim consequuntur provident suscipit. Corporis nihil sed vel ut voluptatum autem. Dolorem rerum velit est eveniet sed soluta dignissimos. Voluptatem animi voluptatibus dignissimos aut accusamus quas ratione est. Facilis fugit commodi qui id.</p><p>Ut rem eum iste nam officia ullam. Voluptatem rerum pariatur repudiandae totam aut error ut. Iusto sed modi reiciendis officia. Suscipit fuga velit architecto odit ipsa voluptatem.</p>', '4853000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(14, 2, 1, 'Dolores optio totam eius sint dolores.', 'optio-eum-vel-quia-voluptates-iste-iusto', NULL, 'Iusto expedita officia consequatur officiis. Voluptatem est adipisci voluptatibus recusandae labore corporis voluptatem et. Nisi delectus sunt earum ea exercitationem dolores voluptatem.', '<p>Ipsa odio est quia est dignissimos id qui. Quibusdam perspiciatis corporis est esse in velit. Quia suscipit autem voluptatum dolorum impedit.</p><p>Exercitationem est fugiat minus velit ullam molestiae libero. Eos a et quo. Rerum aut quisquam et fuga. Minus facere non dolorem placeat.</p>', '1288000.00', NULL, '2024-02-20 22:33:27', '2024-02-20 22:33:27'),
(15, 2, 1, 'Quos quis sint minus aut ullam eius cumque voluptatem', 'cupiditate-impedit-qui-vel-animi-perferendis-molestiae-sint', NULL, 'Enim molestias modi nesciunt. Nemo nostrum voluptatem beatae distinctio dolor. Iure est voluptatem quis consectetur mollitia.Eos nostrum sit dicta eos enim consequuntur eius. Pariatur est temporibus a...', '<div>Enim molestias modi nesciunt. Nemo nostrum voluptatem beatae distinctio dolor. Iure est voluptatem quis consectetur mollitia.<br><br></div><div>Eos nostrum sit dicta eos enim consequuntur eius. Pariatur est temporibus ab sunt. Et ut hic fugit voluptate perspiciatis ut vero quod.<br><br></div>', '786000.00', NULL, '2024-02-20 22:33:28', '2024-02-20 23:50:18'),
(19, 1, 1, 'baju tipe 1', 'baju-tipe-1', 'post-images/y1sz9TzYsqY2BqtUCWwJ7ejFQxY0X0VSFJoCOYzg.jpg', 'Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatem. Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui d...', '<div>Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatem. Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatem.</div>', '220000.00', NULL, '2024-02-21 00:01:21', '2024-02-21 00:38:01'),
(20, 2, 1, 'Jeans tipe 1', 'jeans-tipe-1', 'post-images/2bUMbBNbsAuhrgjdJxW8IUe8aFEraJHGIzCv2iwO.jpg', 'Quasi laborum odit est. Non libero. Aborum odit est. Non libero.', '<div>Quasi laborum odit est. Non libero. Aborum odit est. Non libero.</div>', '300000.00', NULL, '2024-02-21 00:32:13', '2024-02-21 00:37:44'),
(21, 3, 1, 'Shoes Tipe 1', 'shoes-tipe-1', 'post-images/t98TX0bdSS3axGPcmWQbW6c09pA7iZaQOFgLD5l4.jpg', 'Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatevelit ea. Et voluptas molestias et fugit facilis. amet dolorem nulla unde. Molestiae qui du...', '<div>Quasi laborum odit est. Non libero perspiciatis amet dolorem nulla unde. Molestiae qui ducimus iure voluptatevelit ea. Et voluptas molestias et fugit facilis. amet dolorem nulla unde. Molestiae qui ducimus iure voluptatem&nbsp;</div>', '530000.00', NULL, '2024-02-21 00:33:09', '2024-02-21 00:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `alamat`, `telepon`, `rekening`, `no_rekening`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'admin', 'admin', NULL, NULL, NULL, NULL, 'admin@gmail.com', NULL, '$2y$12$T3xNJYJAaHQnHn3MR3hx0OX6TFcN34DE8ZrJQrhkB3jPKHsm6.zry', NULL, '2024-02-20 22:33:23', '2024-02-20 22:33:23', 1),
(2, 'user1', 'user1', NULL, NULL, NULL, NULL, 'user1@gmail.com', NULL, '$2y$12$enPDKap8vTkevhuOpThkp.yvJBNRQ4GabSXwGo.HJ1l642eDH6Mxe', NULL, '2024-02-20 22:33:23', '2024-02-20 22:33:23', 0),
(3, 'user2', 'user2', NULL, NULL, NULL, NULL, 'user2@gmail.com', NULL, '$2y$12$sHreeQ9I6HqIRMXQNgBNAO1EyOI8FPKjCNfn/srsGIXd90.Q5UeCC', NULL, '2024-02-20 22:33:25', '2024-02-20 22:33:25', 0),
(4, 'user3', 'user3', NULL, NULL, NULL, NULL, 'user3@gmail.com', NULL, '$2y$12$o/PJnSOEV1CYxjIWyypCLufkv0YXInGNq0.R2IJXGQaOtR1fx.oXS', NULL, '2024-02-20 22:33:26', '2024-02-20 22:33:26', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_id_keranjang_unique` (`id_keranjang`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
