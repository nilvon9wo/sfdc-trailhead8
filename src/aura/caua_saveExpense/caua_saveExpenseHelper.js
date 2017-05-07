({
	createExpense: function(component, expense) {
		this.upsertExpense(component, expense, function(action) {
			var expenses = component.get('v.expenses');
			expenses.push(action.getReturnValue());
			component.set('v.expenses', expenses);
		});
	},
	
	upsertExpense: function(component, expense, callback) {
		var action = component.get('c.saveExpense');
		action.setParams({
			expense: expense
		});
		if (callback) {
			action.setCallback(this, callback);
		}
		$A.enqueueAction(action);
	}
})