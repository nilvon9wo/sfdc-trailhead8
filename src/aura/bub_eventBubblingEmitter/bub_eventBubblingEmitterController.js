({
	fireEvent: function (component) {
		component.getEvent('bubblingEvent')
			.fire();
	}
})