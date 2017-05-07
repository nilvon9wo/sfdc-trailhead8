({
	delete: function(component, event, helper) {
		component.getEvent('deleteExpenseItemEvent')
			.setParams({
				expense: component.get('v.expense') 
			})
			.fire();
	}
})