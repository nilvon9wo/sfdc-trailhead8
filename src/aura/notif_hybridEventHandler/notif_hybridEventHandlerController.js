({
	handleApplicationEventFired: function (component, event, helper) {
		helper.onEventFire(component, event, 'Application');
	},
	handleComponentEventFired: function (component, event, helper) {
		helper.onEventFire(component, event, 'Component');
	}
})