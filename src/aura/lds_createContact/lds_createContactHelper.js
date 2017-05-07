({
	createContactInitializer: function(component) {
		return function() {
			var newContact = component.get('v.newContact');
			var error = component.get('v.newContactError');
			if (error || (newContact === null)) {
				console.error('Error initializing record template: ' + error);
			} else {
				console.info ('Record template initialized: ' + newContact.sobjectType);
			}
		}
	},
	
	saveContact: function(component) {
		component.set('v.newContact.AccountId', component.get('v.recordId'));
		component.find('contactRecordCreator')
			.saveRecord(this.saveResponseHandler)
	},
	
	saveResponseHandler: function(saveResult) {
		switch (saveResult.state) {
			case 'SUCCESS' :
			case 'DRAFT' : displaySuccess(); break;
			
			case 'INCOMPLETE': logOffline(); break;
			case 'ERROR': logError(); break;
			default: logUnknownState(); break;
		}
		
		function displaySuccess() {
			var resultsToast = $A.get('e.force:showToast');
			resultsToast.setParams({
				title: 'Contact Saved',
				message: 'The new contact was created.'
			});
			resultsToast.fire();
			$A.get('e.force:refreshView').fire();
		}
		
		function logOffline() {
			console.error('User is offline, device doesn\'t support drafts.');
		}
		
		function logError() {
			console.error('Problem saving contact, error: ' + JSON.stringify(saveResult.error));
		}
		
		function logUnknownState() {
			console.error(
					'Unknown problem, state: ' + saveResult.state  
					+ ', error: ' + JSON.stringify(saveResult.error)
				);
		}
	},
	
	validateContactForm: function () {
		// TODO:
		return true;
	}
})