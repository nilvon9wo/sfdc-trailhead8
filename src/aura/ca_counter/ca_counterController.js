({
	getValue: function (component) {
		component.set('v.value', window.counter.getValue());
	},
	increment: function (component) {
		component.set('v.value', window.counter.increment());
	}
})