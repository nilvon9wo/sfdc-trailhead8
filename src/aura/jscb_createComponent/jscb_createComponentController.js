({
	doInit : function (component, event, helper) {
		var componentOptions = {
				'aura:id' : 'findableAuraId',
				label : 'Presss me',
				press : component.getReference('c.handlePress')
		};
	
		$A.createComponent('ui:button', componentOptions, helper.onCreationHandler)
	},
	
	handlePress: function (component) {
		console.info('button pressed');
	}
})