({
	componentCreationHandler: function(component, components, status, errorMessage) {
		if (status === 'SUCCESS') {
			var message = components[0];

			var outputText = components[1];
			message.set('v.body', outputText)
			
			var div1 = component.find('div1');
		}
	}
})