<?php

class EmailReminder extends DailyTask {
	public function process() {
		Patient_Controller::init();
	}
}