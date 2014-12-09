<?php

class Message extends DataObject {

	private static $singular_name = "Bericht";

	private static $db = array(
		"FearScore" => "Int",
		"Message" => "HTMLText",
		"Date" => "Varchar(255)"
	);

	private static $has_one = array(
		"Exercise" => "Exercise"
	);

	private static $summary_fields = array(
		"FearScore" => "Angstscore",
		"Message" => "Bericht",
		"Created" => "Datum"
	);

	public function getCMSFields() {
		$fields = new FieldList();
		$fields->push(new TextField('FearScore', 'Angstscore'));
		$fields->push(new TextareaField('Message', 'Bericht'));
		return $fields;
	}
}