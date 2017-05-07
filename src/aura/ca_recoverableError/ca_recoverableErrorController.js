({
	throwErrorForKicks: function (helper) {
		var hasPermission = false;
		try {
			if (!hasPermission) {
				throw new Error('You don\'t have permission to edit this record.');
			}
		}
		catch (Exception exception) {
			$A.createComponents([
				['ui:message', {
					title: 'Sample Thrown Error',
					severity: 'error'
				}],
				['ui:outputText', {
					value: exception.message
				}]
			], function (components, status, errorMessage) {
				helper.componentCreationHandler(component, components, status, errorMessage)
			});
		}
	}
})