({
	doAction: function (component, event, helper) {
		var inputComponent = component.find('inputComponent');
		var value = inputComponent.get('v.value');

		var errors = (isNaN(value))
			? [{ message: 'Input not a number: ' + value}]
			: null;
		inputComponent.set('v.errors', errors);
	},
	handleError: function (component, event) {
		var errorArray = event.getParam('errors');
		errorArray.forEach(function (error, index) {
			console.error('error ' + index + ': ' + JSON.stringify(error));
		});
	},
	handleClearError: function () {
	}
})