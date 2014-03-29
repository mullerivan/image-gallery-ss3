<?php
require 'PHPMailer/PHPMailerAutoload.php';

Email::set_mailer(new SmtpMailer);
Object::useCustomClass('Email', 'SMTPEmail');