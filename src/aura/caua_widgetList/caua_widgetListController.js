({
	getWidgetArray: function(component) {
		var action = component.get('c.getWidgets');
		action.setCallback(this, function(response){
			var state = response.getState();
			if (state === 'SUCCESS') {
				component.set('v.widgetArray', response.getReturnValue());
			}
		});
		$A.enqueueAction(action);
	}
})