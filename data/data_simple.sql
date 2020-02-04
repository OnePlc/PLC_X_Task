--
-- Core Form - Task Base Fields
--
INSERT INTO `core_form_field` (`Field_ID`, `type`, `label`, `fieldkey`, `tab`, `form`, `class`, `url_view`, `url_list`, `show_widget_left`, `allow_clear`, `readonly`, `tbl_cached_name`, `tbl_class`, `tbl_permission`) VALUES
(NULL, 'textarea', 'Description', 'description', 'task-base', 'task-single', 'col-md-12', '', '', 0, 1, 0, '', '', ''),
(NULL, 'multiselect', 'Categories', 'category_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single/category', 1, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable', 'add-OnePlace\\Task\\Controller\\CategoryController'),
(NULL, 'select', 'State', 'state_idfs', 'task-base', 'task-single', 'col-md-3', '', '/tag/api/list/task-single/state', 1, 1, 0, 'entitytag-single', 'OnePlace\\Tag\\Model\\EntityTagTable','add-OnePlace\\Task\\Controller\\StateController'),
(NULL, 'featuredimage', 'Featured Image', 'featured_image', 'task-base', 'task-single', 'col-md-3', '', '', 0, 1, 0, '', '', '');

--
-- permissions
--
INSERT INTO `permission` (`permission_key`, `module`, `label`, `nav_label`, `nav_href`, `show_in_menu`) VALUES
('add', 'OnePlace\\Task\\Controller\\CategoryController', 'Add Category', '', '', 0),
('add', 'OnePlace\\Task\\Controller\\StateController', 'Add State', '', '', 0);

