({
	fireApplication: function () {
		var appEvent = $A.get('e.c:notif_appEvent');
		var message = 'An application event fired me.' +
			'  It all happened so fast.' +
			'  Now, I\'m everywhere!';
		appEvent.setParam('message', message);
		appEvent.fire();
	}
})