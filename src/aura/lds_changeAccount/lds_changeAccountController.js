({
	recordUpdated: function(component, event) {
		switch (event.getParams().changeType) {
			case 'ERROR' : handleError(); break;
			case 'LOADED' : handleLoaded(); break;
			case 'REMOVED' : handleRemoved(); break;
			case 'CHANGED' : handleChanged(); break;
		}
		
		function handleError() {
			// TODO:
		}
		function handleLoaded() {
			// TODO:
		}
		function handleRemoved() {
			// TODO:
		}
		function handleChanged() {
			component.find('forceRecord').reloadRecord();
		}
	}
})