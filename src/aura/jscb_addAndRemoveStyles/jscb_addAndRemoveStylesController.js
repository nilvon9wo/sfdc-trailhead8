({
	applyCSS: function(component, event, helper) {
		helper.change(component.find('changeIt'), 'addClass');
	},
	removeCSS: function(component, event, helper) {
		helper.change(component.find('changeIt'), 'removeClass');
	}
})