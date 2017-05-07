({
	handleDeleteRecord: function(component, event, helper) {
		component.find('recordHandler')
			.deleteRecord($A.getCallback(helper.deleteResponseHandler))
	}
})