({
	onEventFire: function (component, event, type) {
		var upperCaseType = type.toUpperCase();
		var context = event.getParam('context');
		component.set('v.mostRecentEvent', 'Most recent event handled: ' + upperCaseType + ' event, from ' + context);

		var targetNumber = 'v.numberOf' + type + 'EventsHandled';
		var newNumberOfEvents = parseInt(component.get(targetNumber), 10) + 1;
		component.set(targetNumber, newNumberOfEvents);
	}
})