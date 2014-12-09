<?php

class Therapist extends Member {

	private static $singular_name = "Therapist";

	private static $has_many = array(
		"Patients" => "Patient",
		"TherapyGroups" => "TherapyGroup"
	);
}