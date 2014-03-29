<?php

global $project;
$project = 'mainlinetrack';

global $database;
$database = 'mainlinetrack';

require_once('conf/ConfigureFromEnv.php');
FulltextSearchable::enable();
// Set the site locale
i18n::set_locale('en_US');
Image::add_extension('GalleryImageExtension');

//SmtpMailer::set_conf(array(
//    'default_from'      => array(
//        'name'  => 'mullerivan',
//        'email' => 'mullerivan@gmail.com'
//    ),
//    'charset_encoding'  => 'utf-8',
//    'server'            => 'smtp.gmail.com',
//    'port'              => 587,
//    'secure'            => 'tls',
//    'authenticate'      => true,
//    'user'              => 'mullerivan@gmail.com',
//    'pass'              => 'xxxxx',
//    'debug'             => 0,
//    'lang'              => 'en'
//));


SmtpMailer::set_conf(array(
    'default_from'      => array(
        'name'  => 'mainlinecommercials.co.nz',
        'email' => 'kiwimail@tuatara.secureserver.net.nz'
    ),
    'charset_encoding'  => 'utf-8',
    'server'            => 'tuatara.secureserver.net.nz',
    'port'              => 25,
    'secure'            => null,
    'authenticate'      => true,
    'user'              => 'kiwimail',
    'pass'              => 'kim0815!i',
    'debug'             => 0,
    'lang'              => 'en'
));

