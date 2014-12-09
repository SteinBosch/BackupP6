<?php

class Patient extends Member {

	private static $singular_name = "Patient";

	private static $db = array(
		"showProfile" => "Boolean(1)"
	);

	private static $has_one = array(
		"Therapist" => "Therapist",
		"TherapyGroup" => "TherapyGroup"
	);

	private static $has_many = array(
		"Exercises" => "Exercise"
	);
	
	// public function onBeforeWrite() {
	// 	parent::onBeforeWrite();
	// 	$result = $this->checkPassword($this->Password);
	// 	$valid = $result->valid();
	// 	if ($result->valid()) {
	// 		return false;
	// 	} else {
	// 		$email = new Email();	 
	//         $email->setTo($this->Email); 
	//         $email->setSubject($valid);
	//         $email->setFrom('no_reply@mysite.com'); 
	//         $email->setTemplate('AccesGranted');
	//         $email->populateTemplate(array(
	// 		    'Email' => $this->Email,
	// 		    'Password' => $this->Password
	// 		)); 
	//         $email->send();
	//    }
	// }
}
class Patient_Controller extends ContentController {
	public function init() {
		$email = new Email();
		$email->setTo($this->Email); 
	    $email->setSubject($this->ID);
	    $email->setFrom('no_reply@amc.nl'); 
	    $email->setTemplate('EmailReminder');
		$email->send();
	}
}