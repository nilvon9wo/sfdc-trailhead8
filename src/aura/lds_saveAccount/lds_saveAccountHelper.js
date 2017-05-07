({
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
				title: 'Saved',
				message: 'The record was updated.'
			});
			resultsToast.fire();
			$A.get('e.force:refreshView').fire();
		}
		
		function logOffline() {
			console.error('User is offline, device doesn\'t support drafts.');
		}
		
		function logError() {
			console.error('Problem saving record, error: ' + JSON.stringify(saveResult.error));
		}
		
		function logUnknownState() {
			console.error(
					'Unknown problem, state: ' + saveResult.state  
					+ ', error: ' + JSON.stringify(saveResult.error)
				);
		}
	}
})