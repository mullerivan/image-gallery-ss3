<?php
namespace UserformsSpam;

define ('FORM_FIELD_NAME', 'username');
define ('FORM_FIELD_NAME_TIMER', 'usernametimer');

class UserDefinedForm_ControllerExtension extends \DataExtension {

  public $blnBlockSpam = false;

  public function updateFormFields(&$fields) {
    \Requirements::css('userforms_spam/' . 'css/' . 'silverstripe_ext_ufs.css');

    // get custom script
    $honeypot = new \TextField(FORM_FIELD_NAME, 'Captcha', '');
    $honeypot->addExtraClass(FORM_FIELD_NAME);

    $fields->unshift($honeypot);

    $timer = new \HiddenField(FORM_FIELD_NAME_TIMER, 'CaptchaTime', time());

    $fields->push($timer);
  }

  public function updateEmail($email, $recipient, $emailData) {
    $submittedFieldContent = $_POST[FORM_FIELD_NAME];
    $timerContent = intval($_POST[FORM_FIELD_NAME_TIMER]);

    // if honeypot field has any value or no timer is set or submission was after less than 3 seconds or submission was after more than 1 day (and a bit) - redirect to form again
    if ($submittedFieldContent !== '' || $timerContent == 0 || (time() - $timerContent) < 3 || (time() - $timerContent) > 90000 ) {
      Controller::curr()->redirectBack();
    }
  }
}
