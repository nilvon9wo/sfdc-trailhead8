({
	sendMessage: function(component) {
		component.find('ReactApp')
			.message({
				name: 'General',
				value: component.get('v.messageToSend')
			});
	},
	
	handleMessage: function(compoent) {
		var payload = message.payload;
		
		switch(payload.name) {
			case 'General' : component.set('v.messageReceived', payload.value); break;
			case 'Foo' : /* TODO: A different response */ break;
		}
	},
	
	handleError: function(component, event, helper) {
		var error = event;
		// TODO: ???
	}
})