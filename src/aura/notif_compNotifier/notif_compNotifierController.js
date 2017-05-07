({
	fireComponentEvent: function (component) {
		var componentEvent = component.getEvent('compEvent');
		componentEvent.setParam('message', 'A component event fired me.  It all happened so fast.  I\'m here!');
		componentEvent.fire();
	}
})