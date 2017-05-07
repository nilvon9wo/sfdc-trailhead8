({
	getOpportunityArray: function(component) {
		var action = component.get('c.getOpportunities');
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === 'SUCCESS') {
				component.set('v.opportunityArray', response.getReturnValue());
			}
		});
		$A.enqueueAction(action);
	}
})