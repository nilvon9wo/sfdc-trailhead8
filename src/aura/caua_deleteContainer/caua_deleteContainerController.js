({
	deleteEvent: function(component, event, helper) {
		helper.deleteExpense(component, event.getParam('expense'));
	}
})