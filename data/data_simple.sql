--
-- Core Form - Task Base Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_ist`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'textarea', 'Description', 'description', 'task-base', 'task-single', 'col-md-12', '', '', 0, 1, 0, '', '', ''),
(NULL, 'text', 'Version', 'version', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'currency', 'Budget', 'budget', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'currency', 'Escalation Cost', 'escalation_cost', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'text', 'Escalation Time', 'escalation_time', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'date', 'planned Release', 'planned_release', 'task-base', 'task-single', 'col-md-2', '', '', 0, 1, 0, '', '', ''),
(NULL, 'multiselect', 'Categories', 'category_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single_1', 1, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Task\\Controller\\CategoryController'),
(NULL, 'select', 'Customer', 'customer_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/contact/list', 0, 1, 0, 'contact-single', 'OnePlace\\Contact\\Model\\ContactTable','add-OnePlace\\Contact\\Controller\\ContactController'),
(NULL, 'select', 'Assigned to', 'assigned_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/user/list', 0, 1, 0, 'user-single', 'OnePlace\\User\\Model\\UserTable','add-OnePlace\\User\\Controller\\UserController'),
(NULL, 'select', 'Reported By', 'reported_by_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/contact/list', 0, 1, 0, 'contact-single', 'OnePlace\\Contact\\Model\\ContactTable','add-OnePlace\\Contact\\Controller\\ContactController'),
(NULL, 'select', 'Priority', 'priority_idfs', 'task-base', 'task-single', 'col-md-3', '', '', 0, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Task\\Controller\\PriorityController'),
(NULL, 'select', 'Project', 'project_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/project/list', 0, 1, 0, 'project-single', 'OnePlace\\Project\\Model\\ProjectTable','add-OnePlace\\Project\\Controller\\ProjectController'),
(NULL, 'featuredimage', 'Featured Image', 'featured_image', 'task-base', 'task-single', 'col-md-3', '', '', 0, 1, 0, '', '', '');

(NULL, 'select', 'Test Tag', 'testtag_idfs', 'skeleton-base', 'skeleton-single', 'col-md-3', '', '/tag/api/list/skeleton-single_1', 0, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Tag\\Controller\\TagController');
--
-- Core Form - Task Gallery Tab Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_ist`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'gallery', 'Images Upload', 'task_images', 'task-gallery', 'task-single', 'col-md-12', '', '', 0, 1, 0, '', '', '');

--
-- book Form Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES
('task-gallery', 'task-single', 'File', 'upload', 'fas fa-upload', '', 1, '', '');

INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Task\\Controller\\CategoryController', 'Add Category', '', '', 0),
('add', 'OnePlace\\Task\\Controller\\PriorityController', 'Add Priority', '', '', 0);