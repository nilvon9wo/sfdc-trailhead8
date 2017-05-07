({
	callServer: function(component, event, helper) {
		var action = component.get('c.hello');
		action.setParams({
			name: component.get('v.firstName')
		});
	}
})