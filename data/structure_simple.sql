ALTER TABLE `task` ADD `description` TEXT NOT NULL DEFAULT '' AFTER `label`,
ADD `state_idfs` INT(11) NOT NULL DEFAULT '0' AFTER `description`,
ADD `featured_image` VARCHAR (255) NOT NULL DEFAULT '' AFTER `state_idfs`;