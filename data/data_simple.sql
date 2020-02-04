--
-- Core Form - Task Base Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'textarea', 'Description', 'description', 'task-base', 'task-single', 'col-md-12', '', '', 0, 1, 0, '', '', ''),
(NULL, 'text', 'Version', 'version', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'currency', 'Budget', 'budget', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'currency', 'Escalation Cost', 'escalation_cost', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'text', 'Escalation Time', 'escalation_time', 'task-base', 'task-single', 'col-md-1', '', '', 0, 1, 0, '', '', ''),
(NULL, 'date', 'planned Release', 'planned_release', 'task-base', 'task-single', 'col-md-2', '', '', 0, 1, 0, '', '', ''),
(NULL, 'multiselect', 'Categories', 'category_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single/category', 1, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Task\\Controller\\CategoryController'),
(NULL, 'select', 'State', 'state_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single/state', 1, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable','add-OnePlace\\Task\\Controller\\StateController'),
(NULL, 'select', 'Customer', 'customer_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/contact/list/0', 0, 1, 0, 'contact-single', 'OnePlace\\Contact\\Model\\ContactTable','add-OnePlace\\Contact\\Controller\\ContactController'),
(NULL, 'select', 'Assigned to', 'assigned_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/user/list/0', 0, 1, 0, 'user-single', 'OnePlace\\User\\Model\\UserTable','add-OnePlace\\User\\Controller\\UserController'),
(NULL, 'select', 'Reported By', 'reported_by_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/contact/list/0', 0, 1, 0, 'contact-single', 'OnePlace\\Contact\\Model\\ContactTable','add-OnePlace\\Contact\\Controller\\ContactController'),
(NULL, 'select', 'Priority', 'priority_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single/priority', 0, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Task\\Controller\\PriorityController'),
(NULL, 'select', 'Project', 'project_idfs', 'task-base', 'task-single', 'col-md-3', '', '/api/project/list/0', 0, 1, 0, 'project-single', 'OnePlace\\Project\\Model\\ProjectTable','add-OnePlace\\Project\\Controller\\ProjectController'),
(NULL, 'featuredimage', 'Featured Image', 'featured_image', 'task-base', 'task-single', 'col-md-3', '', '', 0, 1, 0, '', '', '');



--
-- Core Form - Task Gallery Tab Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'gallery', 'Images Upload', 'task_images', 'task-images', 'task-single', 'col-md-12', '', '', 0, 1, 0, '', '', '');

--
-- core Form Tabs
-- core Form Tabs
--
INSERT INTO `core_form_tab` (`Tab_ID`, `form`, `title`, `subtitle`, `icon`, `counter`, `sort_id`, `filter_check`, `filter_value`) VALUES
('task-images', 'task-single', 'Images', 'upload files', 'fas fa-upload', '', 1, '', '');

--
-- permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Task\\Controller\\CategoryController', 'Add Category', '', '', 0),
('add', 'OnePlace\\Task\\Controller\\StateController', 'Add State', '', '', 0),
('add', 'OnePlace\\Task\\Controller\\PriorityController', 'Add Priority', '', '', 0);


--
-- Custom Tags
--
-- todo: add select before and check if tag exists
--
INSERT INTO `core_tag` (`Tag_ID`, `tag_key`, `tag_label`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(NULL, 'priority', 'Priority', '1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
