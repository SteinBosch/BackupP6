<?php

class TherapyGroup extends DataObject {

	private static $db = array(
		"Title" => "Varchar(255)",
		"Description" => "HTMLText"
	);

	private static $has_one = array(
		"Therapist" => "Therapist"
	);

	private static $has_many = array(
		"Patients" => "Patient"
	);

	public function getCMSFields() {
		$fields = new FieldList();
		$fields->push(new TextField('Title', 'Titel'));
		$fields->push(new TextareaField('Description', 'Beschrijving Therapiegroep'));
		return $fields;
	}
}