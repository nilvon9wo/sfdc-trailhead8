({
	deleteExpense: function(component, expense, callback) {
		var action = component.get('c.deleteExpense');
		action.setParams({
			expense: expense
		});
		action.setCallback(this, function(response){
			this.deleteHandler(component, expense, response);
		});
		$A.enqueueAction(action);
	},
	
	deleteHandler: function (component, deletedExpense, response) {
		switch (response.getState()) {
			case 'SUCCESS': reviseExpenseList(); break;
		}
		
		function reviseExpenseList() {
			var revisedExpenseList = [];
			component.get('v.expenseList').forEach(function (expense){
				if (expenese !== deletedExpense) {
					revisedExpenseList.push(expense);
				}
			});
			component.set('v.expenseList', revisedExpenseList);
		}
	}
})