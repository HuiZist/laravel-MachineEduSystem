-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-12-18 14:43:08
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edusys`
--

-- --------------------------------------------------------

--
-- 表的结构 `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_first` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `answers`
--

INSERT INTO `answers` (`id`, `user_id`, `article_id`, `body`, `votes_count`, `comments_count`, `is_hidden`, `close_comment`, `is_first`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '<p><span style=\"color: rgb(82, 82, 82); font-family: &quot;Source Sans Pro&quot;, sans-serif; font-size: 14.5px; line-height: 24.65px; widows: 1; background-color: rgb(255, 255, 255);\">每个命令也包含了「帮助」界面，它会显示并概述命令可使的参数及选项</span></p>', 1, 27, 'F', 'F', 'F', '2017-06-02 16:29:12', '2017-12-08 09:19:19'),
(2, 1, 3, '<p>bilibilibilibili<br/></p>', 1, 8, 'F', 'F', 'F', '2017-06-02 16:42:21', '2017-06-28 22:15:30'),
(3, 1, 3, '<p>1<br/></p>', 1, 2, 'F', 'F', 'F', '2017-06-02 16:56:51', '2017-06-21 16:58:51'),
(4, 1, 3, '<p>123456789012</p>', 0, 2, 'F', 'F', 'F', '2017-06-02 17:00:59', '2017-06-21 17:23:57'),
(5, 3, 8, '<p>年后</p><p><br/></p>', 1, 3, 'F', 'F', 'F', '2017-06-28 22:14:30', '2017-06-29 10:13:14'),
(6, 3, 8, '<p>。。。。。。。。。。。。。。。。。。</p>', 0, 0, 'F', 'F', 'F', '2017-06-28 22:14:48', '2017-06-28 22:14:48'),
(7, 1, 8, '<p>haokankankanakana</p>', 0, 0, 'F', 'F', 'F', '2017-07-26 09:51:38', '2017-07-26 09:51:47'),
(8, 1, 10, '<p>1111111111111111111111111</p>', 0, 0, 'F', 'F', 'F', '2017-12-12 09:03:07', '2017-12-12 09:03:07');

-- --------------------------------------------------------

--
-- 表的结构 `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '1',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_first` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `user_id`, `comments_count`, `followers_count`, `answers_count`, `close_comment`, `is_hidden`, `is_first`, `created_at`, `updated_at`) VALUES
(2, '复仇者联盟', '<p><img src=\"/uploads/ueditor/php/upload/image/20170601/1496305199244508.jpeg\" title=\"1496305199244508.jpeg\" alt=\"75F58PICfj9.jpg\"/></p><p>《复仇者联盟》<em>（Marvel&#39;s The Avengers）</em>是<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%BC%AB%E5%A8%81\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">漫威</a>影业出品的一部科幻动作电影，取材自漫威漫画，是<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%BC%AB%E5%A8%81%E7%94%B5%E5%BD%B1%E5%AE%87%E5%AE%99\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">漫威电影宇宙</a>的第六部电影，同时也是第一阶段的收官作品。由<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E4%B9%94%E6%96%AF%C2%B7%E9%9F%A6%E7%99%BB\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">乔斯·韦登</a>执导，<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%B0%8F%E7%BD%97%E4%BC%AF%E7%89%B9%C2%B7%E5%94%90%E5%B0%BC\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">小罗伯特·唐尼</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%85%8B%E9%87%8C%E6%96%AF%C2%B7%E5%9F%83%E6%96%87%E6%96%AF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">克里斯·埃文斯</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%85%8B%E9%87%8C%E6%96%AF%C2%B7%E6%B5%B7%E5%A7%86%E6%96%AF%E6%B2%83%E6%96%AF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">克里斯·海姆斯沃斯</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%A9%AC%E5%85%8B%C2%B7%E9%B2%81%E6%B3%95%E6%B4%9B\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">马克·鲁法洛</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%96%AF%E5%98%89%E4%B8%BD%C2%B7%E7%BA%A6%E7%BF%B0%E9%80%8A\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">斯嘉丽·约翰逊</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%9D%B0%E7%91%9E%E7%B1%B3%C2%B7%E9%9B%B7%E7%BA%B3\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">杰瑞米·雷纳</a>和<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%B1%A4%E5%A7%86%C2%B7%E5%B8%8C%E5%BE%B7%E5%8B%92%E6%96%AF%E9%A1%BF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">汤姆·希德勒斯顿</a>联袂出演。影片于2012年5月5日在中国内地正式上映。</p><p>影片讲述了<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%A5%9E%E7%9B%BE%E5%B1%80\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">神盾局</a>指挥官<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%B0%BC%E5%85%8B%C2%B7%E5%BC%97%E7%91%9E\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">尼克·弗瑞</a>为了对付《<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%9B%B7%E7%A5%9E/871772\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">雷神</a>》中被流放的洛基，积极奔走寻找最强者，在神盾局斡旋下将<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%92%A2%E9%93%81%E4%BE%A0/1918968\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">钢铁侠</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E9%98%9F%E9%95%BF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">美国队长</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%9B%B7%E7%A5%9E%E6%89%98%E5%B0%94/3804120\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">雷神托尔</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%BB%BF%E5%B7%A8%E4%BA%BA/65931\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">绿巨人</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%BB%91%E5%AF%A1%E5%A6%87\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">黑寡妇</a>和<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%B9%B0%E7%9C%BC%E4%BE%A0\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鹰眼侠</a>六位超级英雄集结在一起，组成了复仇者联盟，共同携手应对邪神洛基<a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p><br/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-06-01 16:20:20', '2017-06-01 16:20:20'),
(3, 'Laravel 5.5 将是下一个 LTS 版本，预计 7/8 月份发布', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.46em; color: rgb(68, 68, 67); font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 18px; line-height: 29.16px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">Laravel 的上一个 LTS（长期支持）版本是 Laravel 5.1，发布于 2015 年 6 月，按照对 LTS 版本的约定，两年的 bug 修复支持到今年中旬就结束了，所以今年中旬必然要出一个 LTS 后继版本，就是 Laravel 5.5。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.46em; color: rgb(68, 68, 67); font-family: Georgia, &quot;Xin Gothic&quot;, &quot;Hiragino Sans GB&quot;, &quot;Droid Sans Fallback&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-size: 18px; line-height: 29.16px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">今天 Laravel 官方在 twitter 上发布消息，Laravel 5.5 版本预计在今年的 7 、8 月份就会发布，遵循约定，Laravel 5.5 LTS 版本同样包含两年的 bug 修复以及三年的安全修复支持。</p><p><img src=\"/uploads/ueditor/php/upload/image/20170602/1496385777774287.png\" title=\"1496385777774287.png\" alt=\"0540baaed781628b02aac992d1c8f.png\"/></p>', 1, 0, 1, 4, 'F', 'F', 'F', '2017-06-02 14:43:31', '2017-06-02 17:00:59'),
(4, 'Bootstrap', '<h2 class=\"bs-docs-featurette-title\" style=\"box-sizing: border-box; font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; font-weight: 400; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 5px; font-size: 40px; text-align: center; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">为所有开发者、所有应用场景而设计。</h2><p class=\"lead\" style=\"box-sizing: border-box; margin: 0px auto 20px; font-size: 21px; line-height: 1.4; max-width: 80%; color: rgb(85, 85, 85); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: center; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">Bootstrap 让前端开发更快速、简单。所有开发者都能快速上手、所有设备都可以适配、所有项目都适用。</p><hr/><p><img src=\"http://v3.bootcss.com/assets/img/sass-less.png\" alt=\"Sass and Less support\" class=\"img-responsive\"/></p><h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 400; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 5px; font-size: 24px;\">预处理脚本</h3><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">虽然可以直接使用 Bootstrap 提供的 CSS 样式表，不要忘记 Bootstrap 的源码是基于最流行的 CSS 预处理脚本 -&nbsp;<a href=\"http://v3.bootcss.com/css/#less\" style=\"box-sizing: border-box; color: rgb(51, 122, 183); text-decoration-line: none; background-color: transparent;\">Less</a>&nbsp;和&nbsp;<a href=\"http://v3.bootcss.com/css/#sass\" style=\"box-sizing: border-box; color: rgb(51, 122, 183); text-decoration-line: none; background-color: transparent;\">Sass</a>&nbsp;开发的。你可以采用预编译的 CSS 文件快速开发，也可以从源码定制自己需要的样式。</p><p><img src=\"http://v3.bootcss.com/assets/img/devices.png\" alt=\"Responsive across devices\" class=\"img-responsive\"/></p><h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 400; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 5px; font-size: 24px;\">一个框架、多种设备</h3><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">你的网站和应用能在 Bootstrap 的帮助下通过同一份代码快速、有效适配手机、平板、PC 设备，这一切都是 CSS 媒体查询（Media Query）的功劳。</p><p><img src=\"http://v3.bootcss.com/assets/img/components.png\" alt=\"Components\" class=\"img-responsive\"/></p><h3 style=\"box-sizing: border-box; font-family: inherit; font-weight: 400; line-height: 1.1; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 5px; font-size: 24px;\">特性齐全</h3><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px;\">Bootstrap 提供了全面、美观的文档。你能在这里找到关于 HTML 元素、HTML 和 CSS 组件、jQuery 插件方面的所有详细文档。</p><p><br/></p>', 3, 0, 1, 0, 'F', 'F', 'F', '2017-06-20 16:05:56', '2017-06-20 16:05:56'),
(5, '啦啦啦啦德玛西亚', '<p><strong>粗体</strong></p><p><em>斜体</em></p><p><span style=\"text-decoration: underline;\">下划线</span></p><p><span style=\"border: 1px solid rgb(0, 0, 0);\">边框</span></p><p><span style=\"text-decoration: line-through;\">删除线</span></p><p><sup><span style=\"text-decoration: none;\">上标</span></sup></p><p><sub>下标</sub></p><blockquote><p><span style=\"text-decoration: none;\">引用<br/></span></p></blockquote><p><span style=\"text-decoration: none; background-color: rgb(247, 150, 70);\">橙色</span><span style=\"text-decoration: none;\"><br/></span></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>列表1</p></li><li><p>列表2</p></li></ol><p><br/></p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">111</span><br/></p><p><a href=\"http://blog.csdn.net/?ref=toolbar\" target=\"_blank\" title=\"CSDN\">CSDN博客</a><br/></p><p><img src=\"/uploads/ueditor/php/upload/image/20170620/1497948919915313.jpeg\" title=\"1497948919915313.jpeg\" alt=\"63562396c7833aa.jpg\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p><p><img src=\"/uploads/ueditor/php/upload/image/20170620/1497949030429306.png\" title=\"1497949030429306.png\" alt=\"scrawl.png\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><pre class=\"brush:bash;toolbar:false\">vagrant&nbsp;ssh</pre><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span><br/></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"></span></span></p><hr/><p>2017-06-20<span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\">2017-06-20</span></span><br/></p><p><br/></p><p>16:59:06</p><p>∟</p><p><img width=\"530\" height=\"340\" src=\"http://api.map.baidu.com/staticimage?center=104.023344,30.617042&zoom=11&width=530&height=340&markers=104.023344,30.617042\"/></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p><span style=\"text-decoration: none;\"><span style=\"text-decoration: none;\"><br/></span></span></p><p style=\"display:none;\"><br/></p>', 3, 0, 1, 0, 'F', 'F', 'F', '2017-06-20 17:00:49', '2017-06-20 17:00:49'),
(7, 'GitHub', '<p>全球最大的社交编程及代码托管网站GitHub以其开创性的新型软件开发方式并且能高效利用有限的资源通过自力更生实现公司盈利和300%的年收入增长成功的吸引知名风投机构Andreessen Horowitz一亿美金的投资。新的资金注入将帮助GitHub平台得到进一步的改进和扩展。</p><p>事实上，这不仅对首次接受外部投资的GitHub意义重大，同样对于投资方Andreessen Horowitz而言，这也是其迄今为止进行过的最大一次单笔投资案。作为投资案的一部分，Andreessen Horowitz的<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%90%88%E4%BC%99%E4%BA%BA\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">合伙人</a>Peter Levine将入主GitHub<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E8%91%A3%E4%BA%8B%E4%BC%9A\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">董事会</a>。</p><p>根据GitHub官方解释，这笔资金除了用于扩充员工队伍，改进现有服务并移植到<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%A7%BB\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">移</a></p><p><a class=\"image-link\" href=\"http://baike.baidu.com/pic/github/10145341/0/0db2c9ca3ae9e614f21fe7d2?fr=lemma&ct=single\" target=\"_blank\" title=\"Github吉祥物Octocat\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; display: block; width: 220px; height: 220px;\"><img class=\"\" src=\"https://imgsa.baidu.com/baike/s%3D220/sign=f23b0796b74543a9f11bfdce2e178a7b/8b13632762d0f703d0ad4cbe08fa513d2697c5b1.jpg\" alt=\"Github吉祥物Octocat\"/></a><span class=\"description\" style=\"display: block; color: rgb(85, 85, 85); font-size: 12px; text-indent: 0px; font-family: 宋体; word-wrap: break-word; word-break: break-all; line-height: 15px; padding: 8px 7px; min-height: 12px; border-top: 1px solid rgb(224, 224, 224);\">Github吉祥物Octocat</span></p><p>动平台之外，还将服务对象从原来的编程爱好者和专业软件开发人员拓展至企业、<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E8%AE%BE%E8%AE%A1%E5%B8%88\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">设计师</a>、文字<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%B7%A5%E4%BD%9C\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">工作</a>者等更广泛的客户群体。</p><p>GitHub有170万名软件开发人员的忠实用户，他们平均每天更新8万个并新建7千个<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E8%BD%AF%E4%BB%B6%E5%BA%93\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">软件库</a>。对GitHub网站上托管的总计超过300万个软件库，其联合创始人Chris Wanstrath曾经形象地称其为“<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%A8%8B%E5%BA%8F%E5%91%98\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">程序员</a>的<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%BB%B4%E5%9F%BA%E7%99%BE%E7%A7%91\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">维基百科</a>全书”。</p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></p><p><br/></p>', 3, 0, 1, 0, 'F', 'F', 'F', '2017-06-21 15:07:07', '2017-06-21 15:07:07'),
(8, '变形金刚5：最后的骑士', '<p>地球陷入毁灭危机，擎天柱失踪，越来越多的汽车人和霸天虎来到地球，前海豹突击队成员威廉·伦诺克斯<em>（&nbsp;</em><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E4%B9%94%E4%BB%80%C2%B7%E6%9D%9C%E5%93%88%E6%98%8E\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\"><em>乔什·杜哈明</em></a><em>饰）</em>成为了政府军组建的TRF中的一员，负责绞杀地球上的汽车人——不论好坏。在芝加哥街头，伦诺克斯遇到了凯德·伊格尔<em>（</em><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%A9%AC%E5%85%8B%C2%B7%E6%B2%83%E5%B0%94%E4%BC%AF%E6%A0%BC\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\"><em>马克·沃尔伯格</em></a><em>饰）</em>孤儿伊莎贝拉<em>（</em><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E4%BC%8A%E8%8E%8E%E8%B4%9D%E6%8B%89%C2%B7%E8%8E%AB%E5%A5%88\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\"><em>伊莎贝拉·莫奈</em></a><em>饰）</em>。</p><p>凯德因为帮助、支持汽车人而成为政府通缉犯，所以他在一个垃圾场看管着一群幸存的汽车人。与此同时，失踪的擎天柱被女巫昆塔莎黑化，要毁灭地球。拯救世界的责任于是落在了这支由凯德为首的非同寻常的队伍身上，大黄蜂、一位英国爵士<em>（</em><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%AE%89%E4%B8%9C%E5%B0%BC%C2%B7%E9%9C%8D%E6%99%AE%E9%87%91%E6%96%AF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\"><em>安东尼·霍普金斯</em></a><em>饰）</em>还有一位牛津大学教授<em>（</em><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%8A%B3%E6%8B%89%C2%B7%E5%93%88%E5%BE%B7%E5%85%8B\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\"><em>劳拉·哈德克</em></a><em>饰）</em>，一场史诗浩劫彻底将地球变成了战场<span style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: default; padding: 0px 2px;\">[2]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p style=\"text-align:center\"><a class=\"image-link\" href=\"http://baike.baidu.com/pic/%E5%8F%98%E5%BD%A2%E9%87%91%E5%88%9A5%EF%BC%9A%E6%9C%80%E5%90%8E%E7%9A%84%E9%AA%91%E5%A3%AB/19672571/0/5ab5c9ea15ce36d3d096fc8a30f33a87e850b1fd?fr=lemma&ct=single\" target=\"_blank\" title=\"\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; display: block; width: 500px; height: 250px;\"><img class=\"\" src=\"https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D500/sign=8fbc29ad68d0f703e2b295dc38fb5148/5ab5c9ea15ce36d3d096fc8a30f33a87e850b1fd.jpg\" alt=\"\"/></a></p><p><strong><span style=\"font-family: arial, tahoma, &quot;Microsoft Yahei&quot;, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; widows: 1; color: rgb(255, 255, 255); background-color: rgb(255, 255, 255);\">内地上映</span></strong><br/></p>', 3, 0, 1, 3, 'F', 'F', 'F', '2017-06-28 22:14:11', '2017-07-26 09:51:38'),
(9, '111111111111111', '<p>1111111111111111111111111<br/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-07-27 17:46:44', '2017-07-27 17:46:44'),
(10, '2017.7.28任务计划', '<h1 style=\"font-size: 32px; font-weight: bold; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">2017.7.28任务计划</span></h1><p><img src=\"/uploads/ueditor/php/upload/image/20170728/1501225947101219.jpeg\" title=\"1501225947101219.jpeg\" alt=\"5257f27875c97e3.jpg\"/></p><h2><span style=\"font-family:宋体\">一、开发</span></h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><span style=\"text-decoration: line-through;\"><span style=\"text-decoration: line-through; font-family: 宋体;\">在</span>windows-apache<span style=\"text-decoration: line-through; font-family: 宋体;\">上开发</span></span></p></li><li><p><span style=\"text-decoration: line-through;\">npm run watch<span style=\"text-decoration: line-through; font-family: 宋体;\">问题</span></span></p></li><li><p>css<span style=\"font-family:宋体\">优化</span></p></li><li><p><span style=\"font-family:宋体\">控制器代码优化</span></p></li><li><p><span style=\"font-family:宋体\">文件存储改变</span></p></li></ul><p>&nbsp;</p><h2><span style=\"font-family:宋体\">二、W</span>eb</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><span style=\"font-family: 宋体; text-decoration: line-through;\">分页</span></p></li><li><p><span style=\"font-family: 宋体; text-decoration: line-through;\">底部异步加载组件</span></p></li><li><p><span style=\"font-family: 宋体; text-decoration: line-through;\">权限</span></p></li><li><p><span style=\"font-family:宋体\">消息通知</span></p></li><li><p><span style=\"font-family:宋体\">部分样式修改</span></p></li><li><p><span style=\"text-decoration: line-through;\"><span style=\"text-decoration: line-through; font-family: 宋体;\">模态框导航条</span>fixBUG</span></p></li><li><p><span style=\"font-family:宋体\">组件化</span></p></li></ul><p>&nbsp;</p><h2><span style=\"font-family:宋体\">三、</span>GitHub</h2><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p><span style=\"text-decoration: line-through;\">canvas<span style=\"text-decoration: line-through; font-family: 宋体;\">代码上传</span></span></p></li><li><p><span style=\"text-decoration: line-through;\">laravel<span style=\"text-decoration: line-through; font-family: 宋体;\">项目代码管理</span></span></p></li></ul><p><br/></p>', 1, 0, 1, 1, 'F', 'F', 'F', '2017-07-28 07:14:34', '2017-12-12 09:03:07'),
(11, '17.12.06计划', '<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"text-decoration: line-through;\">合并首页和文章区</span></p></li><li><p><span style=\"text-decoration: line-through;\">更改个人中心视图</span></p></li><li><p><span style=\"text-decoration: line-through;\">添加管理项</span></p></li><li><p>关注课程模块</p></li><li><p>消息通知</p></li><li><p>搜索栏显示<br/></p></li><li><p>考核信息显示<br/></p></li></ol>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-06 09:03:27', '2017-12-14 07:59:16'),
(12, '美国队长', '<p>&nbsp; 美国队长（Captain America）是美国<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%BC%AB%E5%A8%81\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">漫威</a>漫画旗下<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B6%85%E7%BA%A7%E8%8B%B1%E9%9B%84\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">超级英雄</a>，初次登场于《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E9%98%9F%E9%95%BF/7217717\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国队长</a>》（Captain America Comics）第1期（1941年3月），由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B9%94%C2%B7%E8%A5%BF%E8%92%99\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">乔·西蒙</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9D%B0%E5%85%8B%C2%B7%E7%A7%91%E6%AF%94\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">杰克·科比</a>联合创造，被视为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E7%B2%BE%E7%A5%9E\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国精神</a>的象征。本名史蒂文·“史蒂夫”·罗杰斯（Steven “Steve” Rogers），1920年7月4日出生于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD/125486\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%BD%E7%BA%A6/6230\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">纽约</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B8%83%E9%B2%81%E5%85%8B%E6%9E%97%E5%8C%BA\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">布鲁克林区</a>，原本是一名身体瘦弱的新兵，在接受<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E6%94%BF%E5%BA%9C\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国政府</a>的实验改造后变成了“超级士兵”，这使其力量、速度、耐力等各项体能都远超出于常人，且还被<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E6%94%BF%E5%BA%9C\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国政府</a>赋予了由世界上最坚硬的金属之一<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%B8%E9%9F%B3%E9%92%A2\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">吸音钢</a>制成的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%9B%BE%E7%89%8C\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">盾牌</a>，从此史蒂夫以美国队长的身份，为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD/125486\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">美国</a>及世界在<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%8C%E6%88%98\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">二战</a>中立下显赫战功，后来在二战尾声的一次行动中，美国队长与宿敌<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E9%AA%B7%E9%AB%85\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">红骷髅</a>战斗，并掉入大海之中被冰封近70年，直到被<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A5%9E%E7%9B%BE%E5%B1%80\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">神盾局</a>发现并解冻后才加入了<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%8D%E4%BB%87%E8%80%85%E8%81%94%E7%9B%9F\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">复仇者联盟</a>，此后在美国队长的领导下，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%8D%E4%BB%87%E8%80%85%E8%81%94%E7%9B%9F/391050\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">复仇者联盟</a>出生入死，赢得一次又一次近乎不可能的胜利。</p><p>&nbsp; 在2014年的漫画中，原美国队长史蒂夫·罗杰斯因遭反派铁钉（Iron Nail）的袭击导致血清流失而快速衰老，他选择由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%8C%8E%E9%B9%B0/534739\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">猎鹰</a>（Falcon）山姆·威尔逊（Sam Wilson）继任美国队长。</p><p><img src=\"/uploads/ueditor/php/upload/image/20171213/1513136360560704.jpeg\" title=\"1513136360560704.jpeg\" alt=\"9f2f070828381f30a9b17728a2014c086f06f083.jpg\"/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-13 03:39:26', '2017-12-13 03:39:26'),
(13, '正义联盟', '<p>《正义联盟》是由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%89%8E%E5%85%8B%C2%B7%E6%96%BD%E5%A5%88%E5%BE%B7\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">扎克·施奈德</a>执导，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%85%8B%E9%87%8C%E6%96%AF%C2%B7%E7%89%B9%E9%87%8C%E5%A5%A5\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">克里斯·特里奥</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B9%94%E6%96%AF%C2%B7%E9%9F%A6%E7%99%BB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">乔斯·韦登</a>编剧，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%AC%C2%B7%E9%98%BF%E5%BC%97%E8%8E%B1%E5%85%8B\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">本·阿弗莱克</a>，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%A8%E5%88%A9%C2%B7%E5%8D%A1%E7%BB%B4%E5%B0%94\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">亨利·卡维尔</a>，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%9B%96%E5%B0%94%C2%B7%E5%8A%A0%E6%9C%B5\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">盖尔·加朵</a>等主演的动作科幻奇幻冒险电影。</p><p>改编自<a target=\"_blank\" href=\"https://baike.baidu.com/item/DC%E6%BC%AB%E7%94%BB\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">DC漫画</a>，是<a target=\"_blank\" href=\"https://baike.baidu.com/item/DC%E6%89%A9%E5%B1%95%E5%AE%87%E5%AE%99\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">DC扩展宇宙</a>的第五部影片。故事发生在《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%9D%99%E8%9D%A0%E4%BE%A0%E5%A4%A7%E6%88%98%E8%B6%85%E4%BA%BA%EF%BC%9A%E6%AD%A3%E4%B9%89%E9%BB%8E%E6%98%8E\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">蝙蝠侠大战超人：正义黎明</a>》之后，主要讲述了面对一个全新的世界威胁，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B6%85%E4%BA%BA/13106\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">超人</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%9D%99%E8%9D%A0%E4%BE%A0/50335\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">蝙蝠侠</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A5%9E%E5%A5%87%E5%A5%B3%E4%BE%A0/79246\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">神奇女侠</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%97%AA%E7%94%B5%E4%BE%A0/47498\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">闪电侠</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B5%B7%E7%8E%8B/9093578\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">海王</a>和<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%92%A2%E9%AA%A8/2469567\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">钢骨</a>六位英雄聚首，与这股未知的威胁对抗的故事<span style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: default; padding: 0px 2px;\">[1]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p>该片于2017年11月16日在中国内地部分影院提前点映，11月17日与北美同步上映</p><p><img src=\"/uploads/ueditor/php/upload/image/20171213/1513139486123131.jpeg\" title=\"1513139486123131.jpeg\" alt=\"5d6034a85edf8db1f5a91ce40223dd54574e74ae.jpg\"/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-13 04:31:31', '2017-12-13 04:31:31'),
(14, '33333333333333333333', '<p>去去去去去去群群群群群群群群群群群群</p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-13 05:00:25', '2017-12-13 05:00:25'),
(15, '222222222222222222', '<p>的点点滴滴多多多多多多多多多</p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-13 05:00:59', '2017-12-13 05:00:59'),
(16, '呃呃呃鹅鹅鹅鹅鹅鹅饿鹅鹅鹅饿', '<p>2222222222222222222222222</p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-13 05:03:01', '2017-12-13 05:03:01');
INSERT INTO `articles` (`id`, `title`, `body`, `user_id`, `comments_count`, `followers_count`, `answers_count`, `close_comment`, `is_hidden`, `is_first`, `created_at`, `updated_at`) VALUES
(17, 'Laravel项目环境搭建：VirtualBox-Vagrant-HomeStead', '<p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: inherit; font-weight: 600;\">本文在Windows操作系统下搭建环境，其他操作系统请仅作参考</span></p><h2 style=\"box-sizing: inherit; margin: 20px 0px; font-variant-numeric: inherit; font-weight: 400; font-stretch: inherit; font-size: 24px; line-height: inherit; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">一、下载工具</h2><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">1.virtualBox</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">Oracle 公司的虚拟机软件, 能运行在当前大部分流行的系统上</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">网址：<a href=\"http://link.zhihu.com/?target=https%3A//www.virtualbox.org/wiki/Downloads\" class=\" wrap external\" target=\"_blank\" style=\"box-sizing: inherit; color: rgb(34, 85, 153); text-decoration: none; border-bottom: 1px solid rgba(64, 64, 64, 0.721569); word-break: break-all; cursor: pointer;\">Downloads - Oracle VM VirtualBox<span class=\"icon-external\" style=\"box-sizing: inherit; font-size: 24px; speak: none; font-feature-settings: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-family: icomoon !important;\"></span></a></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">2.vagrant</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">命令行接口，提供一种命令行接口, 允许自动化安装虚拟机, 并且因为是脚本编写成的 provision 文本文件, 给共享虚拟机配置提供了可能, Homestead 正是构建在 Vagrant 之上</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">网址：<a href=\"http://link.zhihu.com/?target=https%3A//www.vagrantup.com/downloads.html\" class=\" wrap external\" target=\"_blank\" style=\"box-sizing: inherit; color: rgb(34, 85, 153); text-decoration: none; border-bottom: 1px solid rgba(64, 64, 64, 0.721569); word-break: break-all; cursor: pointer;\">Download - Vagrant by HashiCorp<span class=\"icon-external\" style=\"box-sizing: inherit; font-size: 24px; speak: none; font-feature-settings: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-family: icomoon !important;\"></span></a></p><h2 style=\"box-sizing: inherit; margin: 20px 0px; font-variant-numeric: inherit; font-weight: 400; font-stretch: inherit; font-size: 24px; line-height: inherit; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/uploads/ueditor/php/upload/image/20171214/1513239082697545.jpeg\" title=\"1513239082697545.jpeg\" alt=\"7a406073b512ef16a891127824c7b.jpg\"/></h2><h2 style=\"box-sizing: inherit; margin: 20px 0px; font-variant-numeric: inherit; font-weight: 400; font-stretch: inherit; font-size: 24px; line-height: inherit; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">二、安装</h2><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">1.将vagrant和VirtualBox安装完成后打开Gitbash命令窗口进入本地路径<span style=\"box-sizing: inherit; font-weight: 600;\">（没有Git请先下载安装Git）</span></p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">cd&nbsp;~</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">2.克隆 homestead 项目</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">git&nbsp;clone&nbsp;https://github.com/laravel/homestead.git&nbsp;Homestead</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">3.在virtualbox虚拟机中加入 homestead box</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">有两种方法：</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">（1）执行以下命令添加 box，这种方法下载很慢，容易被墙，我即使开着VPN也下不了，所以我果断用第二种</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">vagrant&nbsp;box&nbsp;add&nbsp;laravel/homestead</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">（2）命令行下下载速度太慢的话可以利用工具下载以下链接加速，即先将资源下载到本地，再添加到虚拟机中<span style=\"box-sizing: inherit; font-weight: 600;\">（我用迅雷下载的）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">资源地址：</p><p><a href=\"http://link.zhihu.com/?target=https%3A//atlas.hashicorp.com/laravel/boxes/homestead/versions/2.1.0/providers/virtualbox.box\" class=\" external\" target=\"_blank\" style=\"box-sizing: inherit; color: rgb(34, 85, 153); text-decoration: none; border-bottom: 1px solid rgba(64, 64, 64, 0.721569); word-break: break-all; cursor: pointer; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"invisible\" style=\"box-sizing: inherit; font-stretch: normal; font-size: 0px; line-height: 0; font-family: a; color: transparent; text-shadow: none; background-color: transparent;\">https://</span><span class=\"visible\" style=\"box-sizing: inherit;\">atlas.hashicorp.com/lar</span><span class=\"invisible\" style=\"box-sizing: inherit; font-stretch: normal; font-size: 0px; line-height: 0; font-family: a; color: transparent; text-shadow: none; background-color: transparent;\">avel/boxes/homestead/versions/2.1.0/providers/virtualbox.box</span><span class=\"ellipsis\" style=\"box-sizing: inherit;\"></span><span class=\"icon-external\" style=\"box-sizing: inherit; font-size: 24px; speak: none; font-feature-settings: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-family: icomoon !important;\"></span></a><span style=\"color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: rgb(255, 255, 255);\"></span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">下载完毕我们得到了一个virtualbox.box文件，将它放在C：根目录下<span style=\"box-sizing: inherit; font-weight: 600;\">（环境搭建完后可以删除这个文件）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">创建一个metadata.json文件放置在本地目录下（C:用户/当前用户/）<span style=\"box-sizing: inherit; font-weight: 600;\">（很重要）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">metadata.json内容：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;name&quot;:&nbsp;&quot;laravel/homestead&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;versions&quot;:&nbsp;[{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;version&quot;:&nbsp;&quot;2.1.0&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;providers&quot;:&nbsp;[{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;name&quot;:&nbsp;&quot;virtualbox&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;url&quot;:&nbsp;&quot;file://C:/virtualbox.box&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}]\r\n&nbsp;&nbsp;&nbsp;&nbsp;}]\r\n}</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: inherit; font-weight: 600;\">（我的盒子是2.1.0版所以version是2.1.0，virtualbox，vagrant最好都用最新版避免出现兼容和再更新问题）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">Gitbash：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">cd&nbsp;~\r\nvagrant&nbsp;box&nbsp;add&nbsp;metadata.json</pre><p><br/><span style=\"box-sizing: inherit; font-weight: 600; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: rgb(255, 255, 255);\">三、配置</span><span style=\"color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: rgb(255, 255, 255);\"></span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">1.生成配置文件</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">cd&nbsp;homestead\r\nbash&nbsp;init.sh</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">打开Homestead目录，可以找到Homestead.yaml文件</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">这时开始修改Homestead.yaml文件<span style=\"box-sizing: inherit; font-weight: 600;\">（我用的是Sublimt text）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">folders表示主机和虚拟机的共享文件</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">sites表示域名访问虚拟机位置</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">我的修改如下：<span style=\"box-sizing: inherit; font-weight: 600;\">（注意：请在源文件上修改，不要复制代码，yaml文件里多一个空格就会安装失败！）</span></p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">ip:&nbsp;&quot;192.168.10.10&quot;\r\nmemory:&nbsp;2048\r\ncpus:&nbsp;2\r\nprovider:&nbsp;virtualbox\r\n\r\nauthorize:&nbsp;~/.ssh/id_rsa.pub\r\nkeys:\r\n~/.ssh/id_rsa\r\n\r\nfolders:\r\n-&nbsp;map:\r\n~/Code/TaskManager\r\nto:\r\n/home/vagrant/Code/TaskManager\r\n\r\nsites:\r\n-&nbsp;map:\r\ntaskmanager.app\r\nto:\r\n/home/vagrant/Code/TaskManager/public\r\n\r\ndatabases:\r\n-homestead</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">为了对应共享的文件，在本地目录下新建目录Code，在Code下新建子目录TaskManager</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">2.域名重定向</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">修改主机hosts文件添加域重定向</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">位置：C:\\Windows\\System32\\drivers\\etc\\hosts</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">添加两条重定向代码：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">192.168.10.10&nbsp;taskmanager.app</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">（如果保存不了，右键hosts-属性-安全-编辑，给当前用户分配此文件的权限）</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">3.SSH密钥</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">在gitbash窗口输入：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">ssh-keygen</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">根据提示输入你要设置的密码<span style=\"box-sizing: inherit; font-weight: 600;\">（我没设置，全部enter跳过）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">然后打开homestead/scripts/homestead.rb，查看版本限制：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">config.vm.box_version&nbsp;=&nbsp;settings[&quot;version&quot;]&nbsp;||=&nbsp;&quot;&gt;=&nbsp;2.0.0&quot;</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">如果不符则修改</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: inherit; font-weight: 600;\">（注意：不要看网上的执行vagrant init laravel/homestead 命令，否则Vagrantfile会被初始化，vagrant up的时候不会执行yaml配置！）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">4.安装环境</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">cd&nbsp;homestead\r\nvagrant&nbsp;up</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">等待一段时间安装完成</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: inherit; font-weight: 600;\">（命令执行后，显示信息第二行如果是import...laravel/homeatead才是正确的）</span></p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">vagrant&nbsp;ssh</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">进入虚拟机</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">ls</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">看是否有个Code文件，如果有，则yaml配置文件执行成功了</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: inherit; font-weight: 600;\">四、Box内部署</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">1.composer</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">修改虚拟机内composer下载地址到中国镜像</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">composer&nbsp;config&nbsp;-g&nbsp;repo.packagist&nbsp;composer&nbsp;Packagist&nbsp;/&nbsp;Composer</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">下载laravel项目</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">cd&nbsp;Code\r\nsudo&nbsp;composer&nbsp;create-project&nbsp;laravel/laravel&nbsp;TaskManager</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">在主机浏览器输入域名：taskmanager.app</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">访问到Laravel首页则配置成功！</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">2.修改laravel配置</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">修改.env文件内数据库名</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">...</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">3.安装phpmyadmin</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">网址：<a href=\"http://link.zhihu.com/?target=http%3A//www.phpmyadmin.net\" class=\" wrap external\" target=\"_blank\" style=\"box-sizing: inherit; color: rgb(34, 85, 153); text-decoration: none; border-bottom: 1px solid rgba(64, 64, 64, 0.721569); word-break: break-all; cursor: pointer;\">phpMyAdmin<span class=\"icon-external\" style=\"box-sizing: inherit; font-size: 24px; speak: none; font-feature-settings: normal; line-height: 1; -webkit-font-smoothing: antialiased; font-family: icomoon !important;\"></span></a></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">下载安装解压改名为phpMyAdmin放在主机的Code目录下（注意：phpMyAdmin目录下就是doc、examples等子目录）</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">修改yml文件：</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">在共享文件后添加</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">-&nbsp;map:\r\n~/Code/phpMyAdmin\r\nto:\r\n/home/vagrant/Code/phpMyAdmin</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">在域名重定向后添加：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">-&nbsp;map:\r\nphpmyadmin.app\r\nto:\r\n/home/vagrant/Code/phpMyAdmin</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">在hosts文件添加：</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">192.168.10.10&nbsp;phpmyadmin.app</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">4.重载yaml</p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">登录虚拟机</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">vagrant&nbsp;up</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">重新加载配置</p><pre style=\"box-sizing: inherit; margin-top: 1em; margin-bottom: 1em; padding: 10px; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14px; word-wrap: normal; background-color: rgb(246, 246, 246); border-radius: 4px;\">vagrant&nbsp;provision\r\nvagrant&nbsp;ssh</pre><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 20px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\">主机浏览器url输入phpmyadmin.app，出现phpmyadmin页面，部署完成！</p><p><br/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-14 08:07:25', '2017-12-14 08:11:28'),
(18, 'Laravel文件存储问题', '<p><span style=\"font-size:19px\">Laravel</span><span style=\"font-size:19px\">有多种文件存储方式，包括：local、public、第三方云存储等，存储方式定义在config/filesystem.php中</span></p><p><span style=\"font-size:19px\">本地存储选择local或者public方式</span></p><p><span style=\"font-size:19px\">旧版本中：</span></p><p><span style=\"font-size:19px\">本地存储磁盘直接放在/public下，用户可以直接访问到</span></p><p><span style=\"font-size:19px\">新版本中：</span></p><p><span style=\"font-size:19px\">本地磁盘在/storage/app/public下，用户上传的文件不会被直接访问到，在项目根目录下执行：</span></p><p style=\"margin: 10px 0 20px;line-height: 200%;vertical-align: middle\"><span style=\"font-size: 19px;line-height: 200%;font-family: 楷体;background: lightgrey\">php artisan storage</span><span style=\"font-size:19px;line-height:200%;font-family:楷体;color:#999999;background:lightgrey;background:lightgrey\">:</span><span style=\"font-size: 19px;line-height: 200%;font-family: 楷体;background: lightgrey\">link</span></p><p><span style=\"font-size:19px\">建立一个/storage/app/public到/public/storage的软链接</span></p><p><span style=\"font-size:19px\">在filesystem中设置url即可</span></p><p><strong><span style=\"font-size:19px\">（但是在virtualbox中出于安全考虑，共享文件夹中禁止建立软链接，这样最好将文件系统部署在云端）</span></strong></p><p><img src=\"/uploads/ueditor/php/upload/image/20171214/1513239218815409.jpeg\" title=\"1513239218815409.jpeg\" alt=\"7a406073b512ef16a891127824c7b.jpg\"/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-14 08:13:42', '2017-12-14 08:13:42'),
(19, 'Laravel5.4用户授权-policies/Gate', '<p><img src=\"/uploads/ueditor/php/upload/image/20171214/1513239407896222.jpeg\" title=\"1513239407896222.jpeg\" alt=\"7a406073b512ef16a891127824c7b.jpg\"/></p><p>（1）创建策略类</p><p>映射策略类：注册模型与策略类的映射</p><p>在\\App\\Providers\\AuthServiceProvider.php文件的protected $policies属性中添加映射，如：</p><pre class=\"brush:php;toolbar:false\">\\App\\User::class&nbsp;=&gt;&nbsp;\\App\\Policies\\UserPolicy::class,</pre><p>使用Artisan命令生成改模型的policy文件：</p><pre class=\"brush:bash;toolbar:false\">php&nbsp;artisan&nbsp;make:policy&nbsp;UserPolicy</pre><p>这样我们就可以在这个policy文件中编写对应的授权策略</p><p>（2）编写策略</p><p>创建策略方法，传入当前用户实例和发送实例做为参数，如：在\\App\\Policies\\ UserPolicy.php文件中添加方法</p><pre class=\"brush:php;toolbar:false\">public&nbsp;function&nbsp;update(User&nbsp;$currentUser,User&nbsp;$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;$currentUser-&gt;id&nbsp;===&nbsp;$user-&gt;id;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p>这是一个更新用户信息的授权策略</p><p>传入当前用户实例和要更改的用户实例</p><p>返回是一个bool值，当当前登录的用户的id是要更改的用户id时，返回true，这个操作允许进行</p><p>▲当策略为create类型方法时只需要传入当前用户实例一个参数</p><p>（3）使用策略</p><p>策略一般在控制器中使用，如：</p><p>在UsersController控制器的用户信息更改控制器中</p><pre class=\"brush:php;toolbar:false\">$user=User::where(&#39;id&#39;,$request-&gt;get(&#39;userId&#39;))-&gt;first();\r\n$this-&gt;authorize(&#39;update&#39;,&nbsp;$user);</pre><p>$request是用户信息变更的表单请求</p><p>$user是请求中的用户id对应的用户实例</p><p>通过传入User类实例$user找到provider中映射的policy</p><p>用过该policy中的’update’方法，返回的值判断当前用户的操作是否可以继续</p><p>如果返回false，则自动跳转到403页面</p><p>403页面可以在\\resources\\views\\errors\\403.blade.php中自定义编写</p><p>▲create类策略使用时只需要传入模型类，如：</p><pre class=\"brush:php;toolbar:false\">$this-&gt;authorize(&#39;create&#39;,Lesson::class);</pre><p>（4）策略过滤</p><p>在policy类中创建before方法</p><p>在该策略所有方法执行之前都会先执行这个方法，如：</p><p><code><span style=\"font-size:16px\"></span></code></p><pre class=\"brush:php;toolbar:false\">public&nbsp;function&nbsp;before($user,&nbsp;$ability)\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;($user-&gt;isSuperAdmin())&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre><p><code><span style=\"font-size:16px\"></span></code></p><p>（5）不虚传入模型实例的策略可以用gate编写</p><p>在AuthServiceProvider文件boot方法中添加策略，如：</p><pre class=\"brush:php;toolbar:false\">Gate::define(&#39;memberShow&#39;,&nbsp;function&nbsp;($user)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;$user-&gt;is_admin&nbsp;===&nbsp;2;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</pre><p>定义策略名，回调函数第一个参数默认为当前登录的用户实例，其他参数自定义</p><p>在blade中调用：</p><pre class=\"brush:html;toolbar:false\">@can(&#39;memberShow&#39;)\r\n&nbsp;&nbsp;&nbsp;&lt;li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;a&nbsp;href=&quot;&quot;&gt;管理&lt;/a&gt;\r\n&nbsp;&nbsp;&nbsp;&lt;/li&gt;\r\n@endcan</pre><p><br/></p>', 1, 0, 1, 0, 'F', 'F', 'F', '2017-12-14 08:16:54', '2017-12-14 09:46:04');

-- --------------------------------------------------------

--
-- 表的结构 `article_topic`
--

CREATE TABLE `article_topic` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `article_topic`
--

INSERT INTO `article_topic` (`id`, `article_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(1, 1, 12, '2017-06-01 15:21:04', '2017-06-01 15:21:04'),
(2, 1, 13, '2017-06-01 15:21:04', '2017-06-01 15:21:04'),
(3, 2, 14, '2017-06-01 16:20:20', '2017-06-01 16:20:20'),
(4, 2, 15, '2017-06-01 16:20:20', '2017-06-01 16:20:20'),
(6, 2, 17, '2017-06-01 18:03:30', '2017-06-01 18:03:30'),
(7, 3, 2, '2017-06-02 14:43:31', '2017-06-02 14:43:31'),
(8, 3, 3, '2017-06-02 14:43:31', '2017-06-02 14:43:31'),
(9, 3, 18, '2017-06-02 14:43:31', '2017-06-02 14:43:31'),
(10, 4, 8, '2017-06-20 16:05:56', '2017-06-20 16:05:56'),
(11, 4, 19, '2017-06-20 16:05:56', '2017-06-20 16:05:56'),
(12, 4, 13, '2017-06-20 16:05:56', '2017-06-20 16:05:56'),
(13, 5, 21, '2017-06-20 17:00:49', '2017-06-20 17:00:49'),
(14, 6, 21, '2017-06-20 17:01:44', '2017-06-20 17:01:44'),
(15, 7, 13, '2017-06-21 15:07:07', '2017-06-21 15:07:07'),
(16, 7, 23, '2017-06-21 15:07:07', '2017-06-21 15:07:07'),
(17, 7, 17, '2017-06-21 15:07:07', '2017-06-21 15:07:07'),
(18, 8, 14, '2017-06-28 22:14:11', '2017-06-28 22:14:11'),
(19, 8, 26, '2017-06-28 22:14:11', '2017-06-28 22:14:11'),
(20, 9, 21, '2017-07-27 17:46:44', '2017-07-27 17:46:44'),
(21, 10, 25, '2017-07-28 07:14:34', '2017-07-28 07:14:34'),
(22, 10, 26, '2017-07-28 07:14:34', '2017-07-28 07:14:34'),
(23, 10, 27, '2017-07-28 07:14:34', '2017-07-28 07:14:34'),
(24, 11, 27, '2017-12-06 09:03:27', '2017-12-06 09:03:27'),
(25, 12, 14, '2017-12-13 03:39:26', '2017-12-13 03:39:26'),
(26, 12, 16, '2017-12-13 03:39:26', '2017-12-13 03:39:26'),
(27, 12, 17, '2017-12-13 03:39:26', '2017-12-13 03:39:26'),
(28, 13, 14, '2017-12-13 04:31:31', '2017-12-13 04:31:31'),
(29, 13, 17, '2017-12-13 04:31:31', '2017-12-13 04:31:31'),
(30, 13, 15, '2017-12-13 04:31:31', '2017-12-13 04:31:31'),
(31, 14, 14, '2017-12-13 05:00:25', '2017-12-13 05:00:25'),
(32, 15, 14, '2017-12-13 05:00:59', '2017-12-13 05:00:59'),
(33, 16, 21, '2017-12-13 05:03:01', '2017-12-13 05:03:01'),
(34, 17, 2, '2017-12-14 08:07:25', '2017-12-14 08:07:25'),
(35, 17, 28, '2017-12-14 08:07:25', '2017-12-14 08:07:25'),
(36, 17, 29, '2017-12-14 08:07:25', '2017-12-14 08:07:25'),
(37, 18, 2, '2017-12-14 08:13:42', '2017-12-14 08:13:42'),
(38, 18, 30, '2017-12-14 08:13:42', '2017-12-14 08:13:42'),
(39, 18, 31, '2017-12-14 08:13:42', '2017-12-14 08:13:42'),
(40, 19, 2, '2017-12-14 08:16:54', '2017-12-14 08:16:54'),
(41, 19, 30, '2017-12-14 08:16:54', '2017-12-14 08:16:54'),
(42, 19, 32, '2017-12-14 08:16:54', '2017-12-14 08:16:54');

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT '1',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `body`, `answer_id`, `parent_id`, `level`, `is_hidden`, `created_at`, `updated_at`) VALUES
(7, 1, '11', 1, NULL, 1, 'F', '2017-06-13 16:33:40', '2017-06-13 16:33:40'),
(8, 1, '12', 1, NULL, 1, 'F', '2017-06-13 16:37:12', '2017-06-13 16:37:12'),
(9, 1, '2', 1, NULL, 1, 'F', '2017-06-13 16:37:20', '2017-06-13 16:37:20'),
(10, 1, '111', 1, NULL, 1, 'F', '2017-06-13 16:42:07', '2017-06-13 16:42:07'),
(11, 1, '2', 1, NULL, 1, 'F', '2017-06-13 17:06:06', '2017-06-13 17:06:06'),
(12, 1, '1', 1, NULL, 1, 'F', '2017-06-13 17:11:20', '2017-06-13 17:11:20'),
(13, 1, '1', 1, NULL, 1, 'F', '2017-06-13 17:17:24', '2017-06-13 17:17:24'),
(14, 1, '2', 1, NULL, 1, 'F', '2017-06-13 17:17:26', '2017-06-13 17:17:26'),
(15, 1, '3', 1, NULL, 1, 'F', '2017-06-13 17:17:45', '2017-06-13 17:17:45'),
(16, 1, '1', 1, NULL, 1, 'F', '2017-06-13 17:20:59', '2017-06-13 17:20:59'),
(17, 1, '1', 2, NULL, 1, 'F', '2017-06-13 17:21:35', '2017-06-13 17:21:35'),
(18, 1, '2', 2, NULL, 1, 'F', '2017-06-13 17:21:41', '2017-06-13 17:21:41'),
(19, 1, '2', 2, NULL, 1, 'F', '2017-06-13 17:23:32', '2017-06-13 17:23:32'),
(20, 1, '3', 2, NULL, 1, 'F', '2017-06-13 17:23:35', '2017-06-13 17:23:35'),
(21, 1, '6', 2, NULL, 1, 'F', '2017-06-13 17:23:46', '2017-06-13 17:23:46'),
(22, 1, '胜多负少', 2, NULL, 1, 'F', '2017-06-13 17:23:50', '2017-06-13 17:23:50'),
(23, 1, '1', 2, NULL, 1, 'F', '2017-06-13 17:23:57', '2017-06-13 17:23:57'),
(24, 1, '2', 2, NULL, 1, 'F', '2017-06-13 17:24:02', '2017-06-13 17:24:02'),
(25, 1, '个会', 3, NULL, 1, 'F', '2017-06-13 17:26:14', '2017-06-13 17:26:14'),
(26, 1, 'vhhj', 3, NULL, 1, 'F', '2017-06-13 17:26:28', '2017-06-13 17:26:28'),
(27, 3, 'hello', 4, NULL, 1, 'F', '2017-06-16 10:39:14', '2017-06-16 10:39:14'),
(28, 3, 'jed', 4, NULL, 1, 'F', '2017-06-16 10:39:21', '2017-06-16 10:39:21'),
(29, 3, '1', 1, NULL, 1, 'F', '2017-06-21 17:10:59', '2017-06-21 17:10:59'),
(30, 3, '2', 1, NULL, 1, 'F', '2017-06-21 17:16:13', '2017-06-21 17:16:13'),
(31, 3, '111111111', 5, NULL, 1, 'F', '2017-06-28 22:14:56', '2017-06-28 22:14:56'),
(32, 3, '222222222222', 5, NULL, 1, 'F', '2017-06-28 22:14:59', '2017-06-28 22:14:59'),
(33, 3, '333333333333', 5, NULL, 1, 'F', '2017-06-28 22:15:02', '2017-06-28 22:15:02');

-- --------------------------------------------------------

--
-- 表的结构 `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lessons_sort_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `body`, `user_id`, `lessons_sort_id`, `created_at`, `updated_at`) VALUES
(3, 'Laravel5.4 技术文档', '<p>本文在Windows系统下搭建环境，其他操作系统请仅作参考！</p><p>附件如下：</p><p style=\"line-height: 16px;\"><img src=\"http://machineedusystem.app/laravel-u-editor/dialogs/attachment/fileTypeImages/icon_doc.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/uploads/ueditor/php/upload/file/20170626/1498462299446469.docx\" title=\"技术文档.docx\">技术文档.docx</a></p><p><br/></p>', 3, 16, '2017-06-26 15:31:44', '2017-06-26 15:31:44'),
(4, '1111111111111111111', '<p style=\"text-align:center\"></p><p><br/></p>', 3, 16, '2017-06-26 15:54:16', '2017-06-26 15:54:16'),
(5, '麻省理工算法导论公开课', '<p style=\"text-align:center\"><br/></p><p></p><p><br/></p>', 3, 16, '2017-06-27 16:11:11', '2017-06-27 16:11:11'),
(6, '111111111111111111111111', '<p>11111111111111111111111</p><p></p>', 3, 16, '2017-06-27 16:12:01', '2017-06-27 16:12:01'),
(7, '11111111', '<p>2222222222<br/></p><p>http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T1JGF-vimg1_ws_126_net//image/snapshot_movie/2011/5/S/8/M72MFOHS8-1430711943278.swf</p>', 3, 16, '2017-06-27 16:16:29', '2017-06-27 16:16:29'),
(8, '1111111', '<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T1JGF-vimg1_ws_126_net//image/snapshot_movie/2011/5/S/8/M72MFOHS8-1430711943278.swf\" width=\"420\" height=\"280\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', 3, 16, '2017-06-27 17:11:16', '2017-06-27 17:11:16'),
(9, '麻省理工算法导论-算法分析', '<p style=\"text-align:center\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T1JGF-vimg1_ws_126_net//image/snapshot_movie/2011/5/S/8/M72MFOHS8-1430711943278.swf\" width=\"900\" height=\"600\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p><p><br/></p>', 3, 16, '2017-06-28 17:40:33', '2017-06-28 17:40:33'),
(10, '麻省理工算法导论-分析', '<p>啦啦啦啦啦啦啦啦<br/></p><p style=\"text-align:center\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T4T2E-vimg1_ws_126_net//image/snapshot_movie/2011/5/C/9/M72MFNQC9-1430711943278.swf\" width=\"900\" height=\"600\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p><p><br/></p>', 3, 16, '2017-06-28 22:11:50', '2017-06-28 22:11:50'),
(11, 'MIT算法导论-数据结构', '<p><span style=\"color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px;\">本栏目（Algorithms）下</span><span style=\"color: rgb(149, 55, 52);\"><strong><span style=\"font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px; text-decoration: none;\">MIT</span></strong><strong><span style=\"font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px; text-decoration: none;\"></span></strong></span><span style=\"font-family: Arial; line-height: 26px; white-space: normal; widows: 1; font-weight: bold; background-color: rgb(255, 255, 255); font-size: 16px; color: rgb(149, 55, 52);\"><strong>算法</strong><strong><span style=\"font-size: 16px; color: rgb(149, 55, 52);\"></span></strong></span><span style=\"color: rgb(149, 55, 52);\"><strong><span style=\"font-size: 16px; color: rgb(149, 55, 52);\"></span></strong><strong><span style=\"font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px; color: rgb(149, 55, 52); text-decoration: none;\">导论</span></strong><strong><span style=\"font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px; color: rgb(149, 55, 52); text-decoration: none;\"></span></strong></span><span style=\"color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px;\">专题是个人对网易公开课MIT算法导论的学习心得与笔记</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255); font-size: 16px;\">所有内容均来自MIT公开课Introduction to Algorithms中Charles E. Leiserson和Erik Demaine老师的讲解</span></p><p style=\"color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 26px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(0, 153, 0); font-size: 18px;\">第一节——课程简介及算法分析 Analysis of algorithm</span></p><p style=\"color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 26px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px;\">算法分析：关于计算机程序在效率和资源利用方面的理论研究</span></p><p style=\"text-align:center\"><span style=\"font-size: 16px;\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T4T2E-vimg1_ws_126_net//image/snapshot_movie/2011/5/C/9/M72MFNQC9-1430711943278.swf\" width=\"600\" height=\"600\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></span></p><p style=\"text-align:center\"></p><p><br/></p>', 3, 11, '2017-07-17 13:47:05', '2017-07-17 13:47:05'),
(12, 'MIT算法导论-算法分析', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 11px; color: rgb(99, 107, 111); font-family: Raleway, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(245, 248, 250);\"><span style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\">本栏目（Algorithms）下</span><span style=\"box-sizing: border-box; color: rgb(149, 55, 52);\"><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\">MIT</span></strong><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\"></span></strong></span><span style=\"box-sizing: border-box; font-family: Arial; line-height: 26px; widows: 1; font-weight: bold; font-size: 16px; color: rgb(149, 55, 52);\"><strong style=\"box-sizing: border-box;\">算法</strong><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"></span></strong></span><span style=\"box-sizing: border-box; color: rgb(149, 55, 52);\"><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-size: 16px;\"></span></strong><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\">导论</span></strong><strong style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\"></span></strong></span><span style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\">专题是个人对网易公开课MIT算法导论的学习心得与笔记</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 11px; color: rgb(99, 107, 111); font-family: Raleway, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(245, 248, 250);\"><span style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; font-size: 16px;\">所有内容均来自MIT公开课Introduction to Algorithms中Charles E. Leiserson和Erik Demaine老师的讲解</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 11px; font-size: 14px; white-space: normal; color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; color: rgb(0, 153, 0); font-size: 18px;\">第一节——课程简介及算法分析 Analysis of algorithm</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 11px; font-size: 14px; white-space: normal; color: rgb(51, 51, 51); font-family: Arial; line-height: 26px; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-size: 16px;\">算法分析：关于计算机程序在效率和资源利用方面的理论研究</span></p><p style=\"text-align:center\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://swf.ws.126.net/openplayer/v01/-0-2_M6UTT5U0I_M6V2T4T2E-vimg1_ws_126_net//image/snapshot_movie/2011/5/C/9/M72MFNQC9-1430711943278.swf\" width=\"700\" height=\"600\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p><p><br/></p>', 3, 11, '2017-07-17 13:48:56', '2017-07-17 13:48:56'),
(13, '111', '<p>111111</p>', 1, 16, '2017-12-05 08:47:07', '2017-12-05 08:47:07'),
(14, '22222', '<p>22222222222222222</p>', 1, 16, '2017-12-05 08:53:19', '2017-12-05 08:53:19'),
(15, 'qqqqqqqqqqqq', '<p>qqqqqqqqqqqqqqqqqqqqq</p>', 1, 16, '2017-12-05 11:16:52', '2017-12-05 11:16:52'),
(16, '111111111111111111111', '<p>11111111111111111111111</p>', 1, 16, '2017-12-05 11:21:30', '2017-12-05 11:21:30'),
(17, '3333333333333333333333', '<p>333333333333333333333333</p>', 1, 17, '2017-12-06 08:32:31', '2017-12-06 08:32:31'),
(18, '第三部分', '<p>1111111111111111111111111111</p>', 1, 17, '2017-12-07 08:00:16', '2017-12-07 08:00:16'),
(19, '22222222222222222222', '<p>24444444444444444444444</p>', 1, 17, '2017-12-07 08:08:43', '2017-12-07 08:08:43'),
(20, '3333333333333333333', '<p>33333333333333333333333</p>', 1, 17, '2017-12-07 08:09:32', '2017-12-07 08:09:32');

-- --------------------------------------------------------

--
-- 表的结构 `lessons_sorts`
--

CREATE TABLE `lessons_sorts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `lessons_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lessons_sorts`
--

INSERT INTO `lessons_sorts` (`id`, `name`, `thumbnail`, `abstract`, `type`, `user_id`, `lessons_count`, `created_at`, `updated_at`) VALUES
(8, '繁华夜色', 'GiOXpXfKJT.jpg', '这是一门都市生活课程！', 0, 3, 0, '2017-06-22 21:09:53', '2017-06-22 21:09:53'),
(9, '星际大战', 'opHn6fX5XW.jpg', '这是一门太空作战课程！', 0, 3, 0, '2017-06-22 21:10:28', '2017-06-22 21:10:28'),
(10, '红蓝天体', 'bUmeGWBgti.jpg', '这是一门色彩识别课程！', 0, 3, 0, '2017-06-22 21:11:11', '2017-06-22 21:11:11'),
(11, '城市荒野', '7hYm84R3H0.jpg', '这是一门描述城市书籍！', 0, 3, 0, '2017-06-22 21:11:41', '2017-06-22 21:11:41'),
(12, '钢铁侠', 'k907DZ4Uy4.jpg', '这是一门超级英雄战斗课程！', 0, 3, 0, '2017-06-22 21:12:36', '2017-06-22 21:12:36'),
(13, '赤炎天体', 'etPeLCRrkT.jpg', '这是一门太空漂泊课程！', 0, 3, 0, '2017-06-22 21:13:16', '2017-06-22 21:13:16'),
(14, '旅行都市', 'pz4vsk1l9M.jpg', '这是一本都市流浪写实！', 0, 3, 0, '2017-06-22 21:13:51', '2017-06-22 21:13:51'),
(15, '战场咆哮', 'domV3i1egs.jpg', '这是一门歌唱技巧课程！', 0, 3, 0, '2017-06-22 21:14:33', '2017-06-22 21:14:33'),
(16, '学海无涯', 'DZTLVA2eef.jpg', '这是一门算法课程！', 0, 3, 0, '2017-06-22 21:15:23', '2017-06-22 21:15:23'),
(17, '2222222222222222222', 'O1d9H1Cg5n.jpg', '33333333333333333333333', 0, 1, 0, '2017-12-06 08:21:47', '2017-12-06 08:21:47');

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED NOT NULL,
  `to_user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_read` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `has_read`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'hahaha', 'F', NULL, '2017-06-12 14:56:07', '2017-06-12 14:56:07'),
(2, 2, 1, '11111111111111', 'F', NULL, '2017-06-12 14:59:00', '2017-06-12 14:59:00'),
(3, 2, 1, '1111111111', 'F', NULL, '2017-06-12 15:02:55', '2017-06-12 15:02:55'),
(4, 2, 1, '1111111111111111', 'F', NULL, '2017-06-12 15:04:36', '2017-06-12 15:04:36'),
(5, 2, 1, '1', 'F', NULL, '2017-06-12 15:06:51', '2017-06-12 15:06:51'),
(6, 2, 1, '2', 'F', NULL, '2017-06-12 15:08:04', '2017-06-12 15:08:04'),
(7, 2, 1, '1', 'F', NULL, '2017-06-12 15:08:27', '2017-06-12 15:08:27'),
(8, 2, 1, '12', 'F', NULL, '2017-06-12 15:10:50', '2017-06-12 15:10:50'),
(9, 2, 1, '23', 'F', NULL, '2017-06-12 15:13:46', '2017-06-12 15:13:46'),
(10, 2, 1, '2', 'F', NULL, '2017-06-12 15:16:24', '2017-06-12 15:16:24'),
(11, 2, 1, '2', 'F', NULL, '2017-06-12 15:19:32', '2017-06-12 15:19:32'),
(12, 2, 1, '2', 'F', NULL, '2017-06-12 15:20:42', '2017-06-12 15:20:42'),
(13, 2, 1, '3', 'F', NULL, '2017-06-12 15:22:24', '2017-06-12 15:22:24'),
(14, 2, 1, '1', 'F', NULL, '2017-06-12 15:30:47', '2017-06-12 15:30:47'),
(15, 2, 1, '1', 'F', NULL, '2017-06-12 15:34:27', '2017-06-12 15:34:27'),
(16, 2, 1, '2', 'F', NULL, '2017-06-12 15:34:36', '2017-06-12 15:34:36');

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_05_23_173234_create_articles_table', 1),
(4, '2017_05_26_120810_create_topics_table', 1),
(5, '2017_05_26_122026_create_articles_topics_table', 1),
(6, '2017_06_02_150244_create_answers_table', 2),
(7, '2017_06_05_162023_add_api_token_to_users', 3),
(8, '2017_06_06_143021_create_notifications_table', 4),
(9, '2017_06_06_151438_create_votes_table', 5),
(10, '2017_06_12_100300_create_messages_table', 6),
(12, '2017_06_12_161015_create_comments_table', 7),
(13, '2017_06_22_150851_create_lessons_sorts_table', 8),
(14, '2017_06_23_152903_create_lessons_table', 9),
(15, '2017_06_27_151432_create_works_table', 10),
(16, '2017_06_28_153300_create_posts_table', 11),
(19, '2017_07_25_160755_create_user_infos_table', 12);

-- --------------------------------------------------------

--
-- 表的结构 `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `articles_count` int(11) NOT NULL DEFAULT '1',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `topics`
--

INSERT INTO `topics` (`id`, `name`, `bio`, `articles_count`, `followers_count`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'Necessitatibus et nostrum nam molestias nihil repellat. Vel quis qui et vitae neque nihil. Nam soluta rem quidem. Aut ea expedita et non repudiandae voluptatibus voluptatem.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(2, 'Laravel', 'Tenetur quo doloribus quo officia omnis. Omnis esse quia voluptatem magni quia modi ut voluptate. Nihil illo doloremque nisi magni.', 20, 0, '2017-06-01 11:00:05', '2017-12-14 09:46:04'),
(3, 'Laravel框架', 'Iste aut voluptatem minus omnis. Eum accusantium in beatae eveniet veritatis quis omnis.', 4, 0, '2017-06-01 11:00:05', '2017-06-09 16:15:39'),
(4, '人生', 'Rerum amet voluptatum non sit aut et. Adipisci deserunt reiciendis omnis culpa a illum. Aliquam reprehenderit dolores nobis aut non.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(5, '心理学', 'Nulla nobis qui sed provident numquam velit quas et. Sit tempore assumenda et voluptatibus molestiae occaecati aspernatur. Similique autem deserunt voluptates necessitatibus magnam ipsum perspiciatis sunt. Omnis possimus unde ratione enim.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(6, 'Vue', 'Rem sint optio nulla laborum voluptate. Repudiandae aperiam voluptatem et quod velit. Dolorem consectetur est quasi excepturi nisi ea. Doloribus velit accusantium fugit asperiores odio. Quasi unde ea consequuntur temporibus.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(7, 'JavaScript', 'Voluptas magni nostrum ullam iusto. Harum assumenda similique eaque a rem ut cum eos. Rerum distinctio nam tempore praesentium. Modi qui id est id.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(8, '前端', 'Ea aut ad repellat ducimus. Et amet incidunt maiores molestias culpa dolore magnam.', 2, 0, '2017-06-01 11:00:05', '2017-06-20 16:05:56'),
(9, '框架', 'Iusto possimus fugit dolor hic rerum. Occaecati saepe porro at reiciendis unde id. Eos aut libero rem. Eos consequuntur quisquam eum.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(10, 'Web前端', 'Impedit veritatis optio cumque est. Nemo odit necessitatibus est illum dolores omnis. Nobis impedit ipsam voluptas officia culpa.', 1, 0, '2017-06-01 11:00:05', '2017-06-01 11:00:05'),
(11, 'React', NULL, 1, 0, '2017-06-01 15:14:51', '2017-06-01 15:14:51'),
(12, '视频', NULL, 1, 0, '2017-06-01 15:21:04', '2017-06-01 15:21:04'),
(13, '网站', NULL, 5, 0, '2017-06-01 15:21:04', '2017-06-21 17:30:52'),
(14, '电影', NULL, 11, 0, '2017-06-01 16:20:20', '2017-12-13 05:00:59'),
(15, '英雄', NULL, 8, 0, '2017-06-01 16:20:20', '2017-12-13 04:31:31'),
(16, '美国', NULL, 1, 0, '2017-06-01 16:20:20', '2017-06-01 16:20:20'),
(17, '科幻', NULL, 7, 0, '2017-06-01 18:03:30', '2017-12-13 04:31:31'),
(18, '后端', NULL, 3, 0, '2017-06-02 14:43:31', '2017-06-09 16:15:39'),
(19, '组件', NULL, 1, 0, '2017-06-20 16:05:56', '2017-06-20 16:05:56'),
(21, '测试', NULL, 4, 0, '2017-06-20 17:00:49', '2017-12-13 05:03:01'),
(23, '源码', NULL, 3, 0, '2017-06-21 15:07:07', '2017-06-21 17:30:52'),
(24, '平台', NULL, 3, 0, '2017-06-21 15:07:07', '2017-06-21 17:30:52'),
(25, '项目', NULL, 3, 0, '2017-07-28 07:14:34', '2017-12-12 01:22:11'),
(26, '工作', NULL, 3, 0, '2017-07-28 07:14:34', '2017-12-12 01:22:11'),
(27, '计划', NULL, 6, 0, '2017-07-28 07:14:34', '2017-12-14 07:59:16'),
(28, '环境搭建', NULL, 2, 0, '2017-12-14 08:07:25', '2017-12-14 08:11:28'),
(29, '技术文档', NULL, 2, 0, '2017-12-14 08:07:25', '2017-12-14 08:11:28'),
(30, '技术文章', NULL, 13, 0, '2017-12-14 08:13:42', '2017-12-14 09:46:04'),
(31, '文件存储', NULL, 1, 0, '2017-12-14 08:13:42', '2017-12-14 08:13:42'),
(32, '权限', NULL, 12, 0, '2017-12-14 08:16:54', '2017-12-14 09:46:04');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `articles_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `favorites_count` int(11) NOT NULL DEFAULT '0',
  `likes_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `followings_count` int(11) NOT NULL DEFAULT '0',
  `experience_count` int(11) NOT NULL DEFAULT '0',
  `setting` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//是否为管理员',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `confirmation_token`, `is_active`, `articles_count`, `answers_count`, `comments_count`, `favorites_count`, `likes_count`, `followers_count`, `followings_count`, `experience_count`, `setting`, `remember_token`, `is_admin`, `created_at`, `updated_at`, `api_token`) VALUES
(1, '铁锁横江', '863403035@qq.com', '$2y$10$XqoOcPS/JE1e.TgaM7yHe.pmRdPOvJhXQMh/heUVzWgKl0hPBVkt6', '/images/avatars/5f1bc82e007325f30571dc179cf33534.jpg', 'lDSHMWvG50JvH4js6BRFryP6HSZ3YuOcCiyL7I9I', 1, 1, 6, 28, 0, 0, 0, 0, 100, NULL, 'XLWEz6UQo8aBYe8hAshhdqMOUnhjXSwTXrNE9EqoCnNdK8JG2vRCTpjPKCvV', 2, '2017-05-26 21:19:44', '2017-12-18 06:25:38', 'TfyoWIBhWrqmYiiIjrsaBg1hJWtP9c729JNt9u0s4OfgCZ0tF8lq3XFgV8b3'),
(2, 'Query', '863403036@qq.com', '$2y$10$XqoOcPS/JE1e.TgaM7yHe.pmRdPOvJhXQMh/heUVzWgKl0hPBVkt6', '/images/avatars/d1b716463f040aef40a6bb5bab971718.jpg', 'qxW8LW2qLEUzrzKBTeljFeRfCGCa7IR2ZeERWbkd', 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'G5BJtLYlcuAMC4M3QuFYjq9gqiy3FLt3avZMbZrjAS0HpUJ65ezORatrdJnH', 0, '2017-06-12 11:12:53', '2017-12-15 08:39:06', 'pR9yDgxlYYU1m3xQdKrtlStoQsXE3JKma6s1ZiSkXsZ0BIvm1xOzwdrDAnGE'),
(3, 'SanLey', 'wy863403035@163.com', '$2y$10$EdzL5..mgN39JOfBtnZeKO42zq2GNvK9Umjh0dHnJjMF8tre11Y5m', '/images/avatars/fae4494c012f4ecf647da1d63c6d602a.jpg', 'z7Lzg1LTclCBehyA7aWRio0hHpxucngspbKW0LYU', 1, 0, 2, 7, 0, 0, 0, 0, 0, NULL, 'uLWkOIhetplq135G6vxgK7F8Y7VhFIulumZfpPw6iNblP0ObecskcuRvre76', 1, '2017-06-14 15:27:49', '2017-12-15 08:39:15', 'YHNxQCXAx7wfiF3OAEYYgHsvlOadljVgfwmzIzXVG4vUqrztibMnaITElYGr'),
(5, '东东', '863403037@qq.com', '$2y$10$zVKLxKHRIip/qxssrAvuPec.5lQhl0BibcfGVEugvxDIsn/gEzlkm', '/images/avatars/f35bdffb1a656f0438f04fe783a6696e.jpg', 'rJuyq0aiLgWuyovbUStjUxlx23DykozTR3X860BO', 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'A5N9V430lK7J6l3utaP1vhxCgqr6Nn5XKCldU1tpycqB8XVbs3WE9xrOZ3Tl', 0, '2017-07-26 16:04:34', '2017-12-15 08:38:34', 'tOctQczg5p8GlsfUWHVKgIqBQ4g0lcAEzXX7pmKJkzyOVlf8rn8UuyxXy4MA'),
(6, 'Newman', '863403038@qq.com', '$2y$10$BFVF8KcKb5i2q9jvOSXqVuOQGX8aiHtIueRadCcOMnk.DO.JR/tjG', '/images/avatars/default.png', 'oWtZNQpcfq31CptfV640Fu0j5s1ZalxKIT9QArBU', 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '50yrSOFNzYrFK7eDxh2uwteqXxGC0yr5AMtVqDaNi6eGn8yUIrXprnObt1JZ', 0, '2017-07-28 08:26:55', '2017-07-28 08:26:55', 'QV9XMtVvckAWxen9HKb5eOfDkX2ol2z0RXUzMXvO746gDpKhgB0mWulF77rM'),
(7, '张涛', 'voindy@hotmail.com', '$2y$10$gxAdhOsoXJ1a.14VNh.fz.3OBHzfcP14VLwm/vZBDh1wdquYmmFhO', '/images/avatars/default.png', 'HRPMVC92G61dfjd43hKVi7xtbN2kBW3Wu7FXpuKF', 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, '2017-07-31 03:37:32', '2017-12-15 08:40:55', 'G7j4qdTKcrHIVBiFE4KFMgiUm5SEvHIIUF0Cr3ULblfhoHLwANHYXcflkDFp'),
(8, '测试1', '1', '$2b$12$ztRwIcN3dHcJjzcl0kSnHuzzTb8Di90BQtWeXlQ9T/iULp5Sb3.US', '', '123', 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `user_infos`
--

CREATE TABLE `user_infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `blog` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webchat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `user_infos`
--

INSERT INTO `user_infos` (`id`, `user_id`, `blog`, `github`, `live`, `phone`, `webchat`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, NULL, NULL, NULL, NULL, '2017-07-25 19:25:37', '2017-07-25 19:26:29'),
(7, 1, 'http://www.uestc1430.iego.cn', 'https://github.com/HuiZist', '成都', '18328407750', '863403035', '2017-07-25 19:39:53', '2017-12-13 07:37:18'),
(8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, NULL, NULL, NULL, NULL, NULL, '2017-07-26 16:04:34', '2017-07-26 16:04:34'),
(10, 6, NULL, NULL, NULL, NULL, NULL, '2017-07-28 08:26:55', '2017-07-28 08:26:55'),
(11, 7, NULL, NULL, NULL, NULL, NULL, '2017-07-31 03:37:32', '2017-07-31 03:37:32');

-- --------------------------------------------------------

--
-- 表的结构 `votes`
--

CREATE TABLE `votes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `answer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `answer_id`, `created_at`, `updated_at`) VALUES
(17, 3, 3, '2017-06-21 16:58:51', '2017-06-21 16:58:51'),
(18, 3, 2, '2017-06-28 22:15:30', '2017-06-28 22:15:30'),
(19, 3, 5, '2017-06-29 10:13:14', '2017-06-29 10:13:14'),
(23, 1, 1, '2017-12-08 09:19:19', '2017-12-08 09:19:19');

-- --------------------------------------------------------

--
-- 表的结构 `works`
--

CREATE TABLE `works` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `works`
--

INSERT INTO `works` (`id`, `content`, `user_id`, `lesson_id`, `created_at`, `updated_at`) VALUES
(1, '<p>11111</p>', 3, 3, '2017-06-27 15:36:21', '2017-06-27 15:36:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_user_id_index` (`user_id`),
  ADD KEY `answers_question_id_index` (`article_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_topic`
--
ALTER TABLE `article_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_topic_article_id_index` (`article_id`),
  ADD KEY `article_topic_topic_id_index` (`topic_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons_sorts`
--
ALTER TABLE `lessons_sorts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_user_id_index` (`user_id`),
  ADD KEY `votes_answer_id_index` (`answer_id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `article_topic`
--
ALTER TABLE `article_topic`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `lessons_sorts`
--
ALTER TABLE `lessons_sorts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `works`
--
ALTER TABLE `works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
