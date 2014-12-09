<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => 'localhost',
	"username" => 'root',
	"password" => 'root',
	"database" => 'webapp_p6'
);


// Set the site locale
i18n::set_locale('nl_NL');

// Set environment
Director::set_environment_type("dev");

// set default login
Security::setDefaultAdmin('admin','123');

// redirect loged in users
Security::set_default_login_dest('admin/patients'); 