({
	onCreationHandler: function (newButton, status, errorMessage) {
			switch(status) {
				case 'SUCCESS': displayButton(); break;
				case 'INCOMPLETE': logNoResponse(); break;
				case 'ERROR': logError(); break;
			}
		
			function displayButton() {
				var body = component.get('v.body');
				body.push(newButton);
				component.set('v.body', body);
			}
			
			function logNoResponse() {
				console.error('No response from server or client is offline.');
			}
		
			function logError() {
				console.error('Error: ', errorMessage);
			}
		}
})