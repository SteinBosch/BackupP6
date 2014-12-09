<?php

class TherapistAdmin extends ModelAdmin {

  	private static $managed_models = array('Therapist'); // Can manage multiple models
  	private static $url_segment = 'therapist'; // Linked as /admin/products/
	private static $menu_title = 'Therapists';

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