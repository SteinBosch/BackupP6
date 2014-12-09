<?php

class Exercise extends DataObject {

	private static $singular_name = "Oefening";

	private static $db = array(
		"Exposure" => "Varchar(255)",
		"FearScore" => "Int",
		"Prevention" => "Varchar(255)",
		"Date" => "Varchar(255)",
		"TimesPerWeek" => "Int"
	);

	private static $has_one = array(
		"Patient" => "Patient"
	);

	private static $has_many = array(
		"Messages" => "Message"
	);

	public function getCMSFields() {
		$fields = new FieldList();
		$fields->push(new TextField('Exposure', 'Exposure'));
		$fields->push(new TextField('FearScore', 'Angstscore'));
		$fields->push(new TextareaField('Prevention', 'Respons preventie'));
		$fields->push(new GridField('Messages', 'Berichten', $this->Messages()));
		return $fields;
	}
}

