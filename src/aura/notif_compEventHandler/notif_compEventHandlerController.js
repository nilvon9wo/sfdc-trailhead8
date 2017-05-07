({
	handleComponentEvent: function (component, event) {
		component.set('v.messageFromEvent', event.getParam('message'));
		component.set('v.numberOfEvents', parseInt(component.get('v.numberOfEvents') + 1, 10));
	}
})