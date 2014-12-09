<?php

class TestPage extends Page {
	private static $singular_name = "testpagina";
	private static $description = "dit is een testpagina voor json ouput";
}

class TestPage_Controller extends Page_Controller {
	public static $allowed_actions = array('json');
	public function json(SS_HTTPRequest $request) {
	    $f = new JSONDataFormatter();
	    $this->response->addHeader('Content-Type', 'application/json');
	    return $f->convertDataObject($this->dataRecord);
	}
}