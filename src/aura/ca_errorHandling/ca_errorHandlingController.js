({
	doAction: function (component, event, helper) {
		var inputComponent = component.find('inputComponent');
		var value = inputComponent.get('v.value');

		var errors = (isNaN(value))
			? [{ message: 'Input not a number: ' + value}]
			: null;
		inputComponent.set('v.errors', errors);
	}
})