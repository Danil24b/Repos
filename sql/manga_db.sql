CREATE DATABASE IF NOT EXISTS `manga_db` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `manga_db`;

-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Авг 10 2025 г., 08:47
-- Версия сервера: 5.7.24
-- Версия PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `manga_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'sergey1209', '$2y$10$M515xpxp3yLSWFyOi9.MJu4NJ2FR0NeGF1Zp.ojEB4J5DXqGHOHyS', '2025-08-10 08:13:50');

-- --------------------------------------------------------

--
-- Структура таблицы `chapters`
--

CREATE TABLE `chapters` (
  `chapter_id` int(11) NOT NULL,
  `volume_id` int(11) NOT NULL,
  `chapter_number` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chapters`
--

INSERT INTO `chapters` (`chapter_id`, `volume_id`, `chapter_number`, `title`) VALUES
(12, 2, 1, NULL),
(13, 2, 2, '');

-- --------------------------------------------------------

--
-- Структура таблицы `chapter_pages`
--

CREATE TABLE `chapter_pages` (
  `page_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `page_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chapter_pages`
--

INSERT INTO `chapter_pages` (`page_id`, `chapter_id`, `page_number`) VALUES
(24, 12, 1),
(25, 12, 2),
(26, 13, 1),
(27, 13, 2),
(28, 13, 3),
(29, 13, 4),
(30, 13, 5),
(31, 13, 6),
(32, 13, 7),
(33, 13, 8),
(34, 13, 9),
(35, 13, 10),
(36, 13, 11),
(37, 13, 12),
(38, 13, 13),
(39, 13, 14),
(40, 13, 15),
(41, 13, 16),
(42, 13, 17),
(43, 13, 18),
(44, 13, 19),
(45, 13, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `manga`
--

CREATE TABLE `manga` (
  `manga_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover_image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `manga`
--

INSERT INTO `manga` (`manga_id`, `title`, `cover_image_url`) VALUES
(2, 'Очень популярная одноклассница-идол полюбила меня, человека, который не хочет работать всю жизнь', 'mangas/manga2/2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `volumes`
--

CREATE TABLE `volumes` (
  `volume_id` int(11) NOT NULL,
  `manga_id` int(11) NOT NULL,
  `volume_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `volumes`
--

INSERT INTO `volumes` (`volume_id`, `manga_id`, `volume_number`) VALUES
(2, 2, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`chapter_id`),
  ADD KEY `volume_id` (`volume_id`);

--
-- Индексы таблицы `chapter_pages`
--
ALTER TABLE `chapter_pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Индексы таблицы `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`manga_id`);

--
-- Индексы таблицы `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`volume_id`),
  ADD KEY `manga_id` (`manga_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `chapters`
--
ALTER TABLE `chapters`
  MODIFY `chapter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `chapter_pages`
--
ALTER TABLE `chapter_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `manga`
--
ALTER TABLE `manga`
  MODIFY `manga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `volumes`
--
ALTER TABLE `volumes`
  MODIFY `volume_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`volume_id`) REFERENCES `volumes` (`volume_id`);

--
-- Ограничения внешнего ключа таблицы `chapter_pages`
--
ALTER TABLE `chapter_pages`
  ADD CONSTRAINT `chapter_pages_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`chapter_id`);

--
-- Ограничения внешнего ключа таблицы `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_ibfk_1` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`manga_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;