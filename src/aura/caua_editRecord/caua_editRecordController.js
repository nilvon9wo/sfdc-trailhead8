({
	edit: function(component, event, helper) {
		var editRecordEvent = $A.get('e.force:editRecord');
		editRecordEvent.setParams({
			recordId: component.get('v.contact.Id');
		});
		editRecordEvent.fire();
	}
})