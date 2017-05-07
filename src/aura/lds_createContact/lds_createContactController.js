({
	doInit: function(component, event, helper) {
		var sObjectType = 'Contact';
		var recordType = null;
		var recordValues = null;
		var skipCache = false;
		var callback = $A.getCallback(helper.createContactInitializer(component));
	
		component.find('contactRecordCreator')
			.getNewRecord(sObjectType, recordType, recordValues, skipCache, callback);
	},
	
	handleSaveContact: function(component, event, helper) {
		if (helper.validateContactForm(component)) {
			helper.saveContact(component);
		}
	}
})