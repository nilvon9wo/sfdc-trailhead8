({
	handleSaveRecord: function(component, event, helper) {
		component.find('recordHandler')
			.saveRecord($A.getCallback(helper.saveResponseHandler))
	}
})