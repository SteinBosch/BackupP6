<?php

class PatientAdmin extends ModelAdmin {

  	private static $managed_models = array('Patient'); // Can manage multiple models
  	private static $url_segment = 'patients'; // Linked as /admin/products/
	private static $menu_title = 'Patients';

	public function canView($member = null) {
        return Permission::check('CMS_ACCESS_CMSMain', 'any', $member);
    }
    public function canEdit($member = null) {
        return Permission::check('CMS_ACCESS_CMSMain', 'any', $member);
    }
    public function canDelete($member = null) {
        return Permission::check('CMS_ACCESS_CMSMain', 'any', $member);
    }
    public function canCreate($member = null) {
        return Permission::check('CMS_ACCESS_CMSMain', 'any', $member);
    }

	private static $searchable_fields = array(
        'FirstName' => 'FirstName',
        'LastName' => 'LastName'
   	);
}