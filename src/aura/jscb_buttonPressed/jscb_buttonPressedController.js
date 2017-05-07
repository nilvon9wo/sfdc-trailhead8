({
	nameThatButton: function(component, event) {
		component.set('v.whichButton', event.getSource().getLocalId());
	}
})