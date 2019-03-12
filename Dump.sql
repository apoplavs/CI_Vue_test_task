-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Час створення: Бер 12 2019 р., 18:56
-- Версія сервера: 10.3.12-MariaDB-1:10.3.12+maria~xenial
-- Версія PHP: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `site`
--

-- --------------------------------------------------------

--
-- Структура таблиці `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT current_timestamp(),
  `time_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `header` varchar(1024) DEFAULT NULL,
  `short_description` varchar(2048) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `img` varchar(1024) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `time_created` timestamp NULL DEFAULT current_timestamp(),
  `time_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `news`
--

INSERT INTO `news` (`id`, `header`, `short_description`, `text`, `img`, `tags`, `status`, `time_created`, `time_updated`) VALUES
(1, 'News #1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \' +\n            \'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\' +\n            \' ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu \' +\n            \'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \' +\n            \'mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \' +\n            \'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\' +\n            \' ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu \' +\n            \'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt \' +\n            \'mollit anim id est laborum.', '/assets/img/news/5.png', 'кек,чебурек', 'open', '2018-08-30 13:31:14', '2019-03-12 16:54:29'),
(3, 'Эх, чужд кайф, сплющь', '<p>Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства.<br></p>', '<<<<<<<p>Эй, жлоб! Где туз? Прячь юных <u><b>съёмщиц</b></u> в шкаф. Съешь [же] ещё этих мягких <span style=\"background-color: rgb(255, 255, 0);\">французских</span> булок да выпей чаю. В чащах юга жил бы цитрус? Да, но фальшивый экземпляр! Эх, чужак! Общий съём <a href=\"#\" target=\"_blank\">цен</a> шляп (юфть) — вдрызг!<br></p>', '/assets/img/news/3.jpeg', NULL, 'open', '2018-10-11 01:33:27', '2019-03-12 14:42:17'),
(4, 'News #4', 'But I must explain to you how all this mistaken idea', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful', '/assets/img/news/4.jpg', NULL, 'open', '2018-12-11 02:33:27', '2019-03-12 14:42:30'),
(5, 'News #5', 'On the other hand', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain.', '/assets/img/news/5.png', 'метка,пицца', 'open', '2018-09-30 13:31:14', '2019-03-12 14:42:34');

-- --------------------------------------------------------

--
-- Структура таблиці `news_comments`
--

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `time_created` timestamp NULL DEFAULT current_timestamp(),
  `time_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `news_comments`
--

INSERT INTO `news_comments` (`id`, `new_id`, `comment`, `time_created`, `time_updated`) VALUES
(1, 1, 'comment to news 1', '2019-03-11 16:14:09', '2019-03-11 16:14:09'),
(2, 1, 'another comment to news 1', '2019-03-11 16:14:38', '2019-03-11 16:14:38'),
(5, 3, 'Comment to second news', '2019-03-12 16:53:49', '2019-03-12 16:53:49');

-- --------------------------------------------------------

--
-- Структура таблиці `news_likes`
--

CREATE TABLE `news_likes` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT current_timestamp(),
  `time_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Індекси таблиці `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `news_comments`
--
ALTER TABLE `news_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_comments_ibfk_1` (`new_id`);

--
-- Індекси таблиці `news_likes`
--
ALTER TABLE `news_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `new_id` (`new_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблиці `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблиці `news_comments`
--
ALTER TABLE `news_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблиці `news_likes`
--
ALTER TABLE `news_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD CONSTRAINT `comments_likes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `news_comments` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `news_comments`
--
ALTER TABLE `news_comments`
  ADD CONSTRAINT `news_comments_ibfk_1` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `news_likes`
--
ALTER TABLE `news_likes`
  ADD CONSTRAINT `news_likes_ibfk_1` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
