/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : louis

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2013-01-07 14:20:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `modules_boxes`
-- ----------------------------
DROP TABLE IF EXISTS `modules_boxes`;
CREATE TABLE `modules_boxes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `required_modules` text NOT NULL,
  `file` varchar(150) DEFAULT NULL,
  `template` varchar(150) DEFAULT NULL,
  `settings` text,
  `date_added` int(10) unsigned DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `fetchType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modules_boxes
-- ----------------------------
INSERT INTO `modules_boxes` VALUES ('8', 'slider', 'Slider', 'gallery', 'hooks/slider.php', 'slider.tpl', null, '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('9', 'latestProducts', 'Latest products', 'products', 'hooks/products/latestProducts.php', 'modules/products/latestProducts.tpl', '{\"just_results\":1,\"availability\":1,\"thumb\":1,\"sort\":\"date_added\",\"sort_direction\":\"DESC\",\"debug\":0,\"results_per_page\":10,\"fields\":\"id,title,permalink\"}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('6', 'map', ' Map', 'maps', 'gmaps.php', 'gmaps.tpl', 'a:::', '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('7', 'tagCloud', 'Tag Cloud', 'products', 'tag_cloud.php', 'tag_cloud.tpl', '0:::', '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('5', 'extraFields', 'Extra Fields', 'content', 'items/extraFields.php', 'admin2/ajax/item/extraFields.tpl', null, '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('4', 'mediaFiles', 'Media files', 'content', 'items/mediaFiles.php', 'admin2/ajax/item/mediaFiles.tpl', null, '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('3', 'relatedItems', 'Related items', 'content', 'items/relatedItems.php', 'admin2/ajax/item/relatedItems.tpl', null, '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('2', 'itemsTranslations', 'Translations', 'content', 'items/itemsTranslations.php', 'admin2/ajax/item/itemsTranslations.tpl', null, '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('1', 'itemsGeneral', 'General', 'content', 'items/itemsGeneralForm.php', 'admin2/ajax/item/itemsGeneralForm.tpl', '{\"required\":\"1\",\"dataType\":\"json\",\"trigger\":\"loadComplete\",\"includes\":{\"eshop\":{\"file\":\"modules\\/eshop\\/admin\\/itemQuickPrice.tpl\",\"modules\":[\"products\"]}}}', '1204185426', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('16', 'Filter', 'Filter', '', 'content/GeneralFilter.php', 'modules/content/FilterTpl.tpl', '{\"modules\":[\"content\",\"listings\",\"products\"]}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('18', 'orders', 'Orders', 'eshop', 'eshop/admin/orders.php', 'modules/eshop/admin/orders.tpl', '{}', '1204185426', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('19', 'shipping_methods', 'Shipping Methods', 'eshop', 'eshop/admin/shipping_methods.php', 'modules/eshop/admin/shipping_methods.tpl', '{}', '1204185426', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('11', 'CategoriesEdit', 'ediTreeview', '', null, 'modules/categories/EditCategories.tpl', '', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('13', 'CategorySearch', 'CategorySearch', 'content', 'items/BoxCategories.php', 'modules/categories/CategorySearch.tpl', '{\"action\":\"getCategories\",\"dataType\":\"json\",\"trigger\":\"loadTabs\",\"columns\": [{\"field\": \"id\",\"order\":0,\"width\": \"10%\",\"title\":\"ID\"},{\"field\": \"text\",\"order\":1,\"width\": \"80%\",\"title\": \"text\"}]}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('10', 'CategoriesTree', 'treeview', '', '', 'modules/categories/CreateCategories.tpl', '', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('12', 'PagesSearch', 'Άρθρα', 'content', 'content/LoadContent.php', 'modules/content/PagesGrid.tpl', '{\"trigger\":\"loadTabs\",\"url\":\"itemsSearch.php\",\"get\": {\"action\": \"pagesFilter\",\"filter\":\"16\"},\"columns\": [{\"field\": \"id\",\"title\":\"ID\",\"order\":\"0\",\"width\":\"10%\",\"sort\":\"true\"},{\"field\": \"title\",\"title\": \"title\",\"order\":\"3\",\"width\":\"45%\",\"sort\":\"true\"},{\"field\": \"active\",\"title\": \"status\",\"order\":\"4\",\"width\":\"15%\", \"sort\":\"false\"}]}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('15', 'CategoriesFeatured', 'Κατηγορίες', '', 'items/BoxCategories.php', 'modules/categories/Featured_cat.tpl', '{\"dataType\":\"json\",\"trigger\":\"loadTabs\",\"columns\": [{\"field\": \"id\",\"title\":\"ID\",\"width\":\"50px\"},{\"field\": \"text\",\"title\": \"text\"}],\"get\":{\"action\":\"allFeauturedCategories\"}}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('17', 'ShowUsers', 'Users', 'content', 'content/LoadContent.php', 'modules/content/PagesGrid.tpl', '{\"trigger\":\"loadTabs\",\"url\":\"usersFront.php\",\"get\": {\"action\": \"filterUsers\"},\"columns\": [{\"field\": \"id\",\"title\":\"ID\",\"width\":\"10%\",\"order\":0},{\"field\": \"uname\",\"title\": \"username\",\"width\":\"20%\",\"order\":1},{\"field\": \"user_name\",\"title\": \"name\",\"width\":\"20%\",\"order\":2},{\"field\": \"user_surname\",\"title\": \"surname\",\"width\":\"20%\",\"order\":3},{\"field\": \"email\",\"title\": \"e-mail\",\"width\":\"20%\",\"order\":4}]}', '1204185485', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('20', 'payment_methods', 'Payment Methods', 'eshop', 'eshop/admin/payment_methods.php', 'modules/eshop/admin/payment_methods.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('21', 'pclasses', 'Product Classes', 'eshop', 'eshop/admin/pclasses.php', 'modules/eshop/admin/pclasses.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('22', 'subscriptions', 'Subscriptions', 'eshop', 'eshop/admin/subscriptions.php', 'modules/eshop/admin/subscriptions.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('23', 'settings', 'Eshop Settings', 'eshop', 'eshop/admin/settings.php', 'modules/eshop/admin/settings.tpl', '{}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('28', 'itemsMap', 'Map', 'maps', 'items/itemsMap.php', 'common/placeItemOnMap.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('24', 'dashboard_graph', 'dashboard_graph', '', 'dashboard/dashboard.php', 'admin2/dashboard/main.tpl', '{\"ajax\":1,\"action\":\"drawposts\",\"type\":\"line\",\"field\":[{\"field\":\"posts\",\"name\":\"posts\"}],\"dataProperties\":{\"module\":\"content\",\"dataType\":\"json\",\"categoryid\":1,\"results_per_page\":5,\"orderby\":\"date_added\",\"way\":\"desc\",\"trigger\":\"loadNews\"}}', '1204185426', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('25', 'UserFilter', 'Filter', '', 'content/GeneralFilter.php', 'modules/users/admin/FilterTpl.tpl', '{\"file\": \"modules/users/admin/UserFilterTpl.tpl\"}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('26', 'index', 'Eshop', 'eshop', 'eshop/admin/index.php', 'modules/eshop/admin/home.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('29', 'TranslateFrom', 'Translation', '', 'Languages.php', 'admin2/languages/lang_select.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('31', 'ExtraFieldsCreate', 'Create New', '', 'extra_fields/extra_fields.php', 'admin2/extra_fields/extra_field.tpl', '{}', null, 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('32', 'updater', 'Updater', 'updater', 'updater/updater.php', null, '{}', null, 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('33', 'Filter', 'Filter', '', 'content/GeneralFilter.php', 'plugins/facebook/admin/FilterTpl.tpl', '{\"boxid\":25}', '1204185485', 'back', '1', null);
INSERT INTO `modules_boxes` VALUES ('27', 'dashboard_graph_inac', 'dashboard_graph_inactive', '', 'dashboard/dashboard.php', 'admin2/dashboard/main.tpl', '{\"ajax\":1,\"action\":\"drawactinact\",\"type\":\"bar\", \"field\":[{\\\"field\\\":\\\"active\\\",\\\"color\\\":\\\"\\#309B46\\\",\\\"name\\\":\\\"active\\\"},{\\\"field\\\":\\\"inactive\\\",\\\"color\\\":\\\"\\#FD0100\\\",\\\"name\\\":\\\"inactive\\\"}],\"dataProperties\":{\"module\":\"content\",\"dataType\":\"json\",\"categoryid\":1,\"results_per_page\":5,\"orderby\":\"date_added\",\"way\":\"desc\",\"trigger\":\"loadNews\"}}', '1204185426', 'back', '1', 'ajax');
INSERT INTO `modules_boxes` VALUES ('39', 'cruise', 'Cruise Page', 'cruise', 'hooks/cruises/cruisePage.php', 'hooks/cruises/cruise.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('34', 'Plan your Cruise', 'plan_cruise', 'content', 'hooks/MegaMenu/plan_cruise.php', 'hooks/MegaMenu/plan_cruise_menu.tpl', '{\"id\": 42}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('35', 'Welcome on board', 'welcome_board', 'content', 'hooks/MegaMenu/welcome_board.php', 'hooks/MegaMenu/welcome_board_menu.tpl', '{\"id\": 43}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('36', 'Costumer Support', 'costumer_support', 'content', 'hooks/MegaMenu/costumer_support.php', 'hooks/MegaMenu/costumer_support_menu.tpl', '{\"id\": 44}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('37', 'destinations', 'Top Destinations', 'content', 'hooks/cruises/latestDestinations.php', 'hooks/cruises/latestCruises.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('38', 'FindCruise', 'Find A Cruise', 'cruises', 'hooks/cruises/findCruise.php', 'hooks/cruises/findCruise.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('40', 'calendarCruise', 'Cruise Calendar', 'cruise', 'hooks/cruises/calendarCruise.php', 'hooks/cruises/calendarCruise.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('41', 'shipPage', 'Ship Page', 'ships', 'hooks/cruises/shipPage.php', 'hooks/cruises/shipPage.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('42', 'DreamPage', 'Dream Page', 'itineraries', 'hooks/cruises/itineraryPage.php', 'hooks/cruises/itineraryPage.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('43', 'destinations', 'destinations list', 'destinations', 'hooks/cruises/Destinations.php', 'hooks/cruises/destinations.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('44', 'components', 'Component', 'components', 'hooks/components/componentPage.php', 'hooks/components/component.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('45', 'excursions', 'excursions', 'excursions', 'hooks/components/componentList.php', 'hooks/components/componentList.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('46', 'shipList', 'Ships', 'shipd', 'hooks/cruises/shipList.php', 'hooks/cruises/shipList.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('47', 'bookNow', 'bookNow', 'bookNow', 'bookNow.php', 'modules/booking/main.tpl', '{}', '1204185485', 'front', '1', 'static');
INSERT INTO `modules_boxes` VALUES ('48', 'destination', 'destination', 'destination', 'hooks/cruises/Destination.php', 'hooks/cruises/destination.tpl', '{}', '1204185485', 'front', '1', 'static');
