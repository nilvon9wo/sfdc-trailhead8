({
	deleteResponseHandler: function(deleteResult) {
		switch (deleteResult.state) {
			case 'SUCCESS' :
			case 'DRAFT' : displaySuccess(); break;
			
			case 'INCOMPLETE': logOffline(); break;
			case 'ERROR': logError(); break;
			default: logUnknownState(); break;
		}
		
		function displaySuccess() {
			var resultsToast = $A.get('e.force:showToast');
			resultsToast.setParams({
				title: 'Deleted',
				message: 'The record was deleted.'
			});
			resultsToast.fire();
			$A.get('e.force:refreshView').fire();
		}
		
		function logOffline() {
			console.error('User is offline, device doesn\'t support drafts.');
		}
		
		function logError() {
			console.error('Problem saving record, error: ' + JSON.stringify(deleteResult.error));
		}
		
		function logUnknownState() {
			console.error(
					'Unknown problem, state: ' + deleteResult.state  
					+ ', error: ' + JSON.stringify(deleteResult.error)
				);
		}
	}
})