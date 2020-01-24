--
-- Base Table
--
CREATE TABLE `task` (
  `Task_ID` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `task`
  ADD PRIMARY KEY (`Task_ID`);

ALTER TABLE `task`
  MODIFY `Task_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Task\\Controller\\TaskController', 'Add', '', '', 0),
('edit', 'OnePlace\\Task\\Controller\\TaskController', 'Edit', '', '', 0),
('index', 'OnePlace\\Task\\Controller\\TaskController', 'Index', 'Tasks', '/task', 1),
('list', 'OnePlace\\Task\\Controller\\ApiController', 'List', '', '', 1),
('view', 'OnePlace\\Task\\Controller\\TaskController', 'View', '', '', 0);

--
-- Form
--
INSERT INTO `core_form` (`form_key`, `label`) VALUES ('task-single', 'Task');

--
-- Index List
--
INSERT INTO `core_index_table` (`table_name`, `form`, `label`) VALUES
('task-index', 'task-single', 'Task Index');

--
-- Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES ('task-base', 'task-single', 'Task', 'Base', 'fas fa-cogs', '', '0', '', '');

--
-- Buttons
--
INSERT INTO `core_form_button` (`Button_ID`, `label`, `icon`, `title`, `href`, `class`, `append`, `form`, `mode`, `filter_check`, `filter_value`) VALUES
(NULL, 'Save Task', 'fas fa-save', 'Save Task', '#', 'primary saveForm', '', 'task-single', 'link', '', ''),
(NULL, 'Edit Task', 'fas fa-edit', 'Edit Task', '/task/edit/##ID##', 'primary', '', 'task-view', 'link', '', ''),
(NULL, 'Add Task', 'fas fa-plus', 'Add Task', '/task/add', 'primary', '', 'task-index', 'link', '', '');

--
-- Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_ist`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'text', 'Name', 'label', 'task-base', 'task-single', 'col-md-3', '/task/view/##ID##', '', 0, 1, 0, '', '', '');

COMMIT;