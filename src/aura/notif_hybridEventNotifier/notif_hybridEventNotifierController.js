({
	fireApplicationEvent: function (component) {
		var parentName = component.get('v.parentName');
		var appEvent = $A.get('e.c:notif_appEvent');
		appEvent.setParam('context', parentName);
		appEvent.fire();
	},
	fireComponentEvent: function (component) {
		var parentName = component.get('v.parentName');
		var compEvent = component.getEvent('componentEventFired');
		compEvent.setParam('context', parentName);
		compEvent.fire();
	}
})