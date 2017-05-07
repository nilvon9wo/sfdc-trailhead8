({
  getAccounts: function (component) {
	  this.getSObjects(component, 'account');
  },
  getContacts: function (component) {
	  this.getSObjects(component, 'contact');
  },
  getLeads: function (component) {
	  this.getSObjects(component, 'lead');
  },
  getSObjects: function (component, sObjectName) {
    var method = this.serverMethod(sObjectName);
    var action = component.get(method);
    action.setCallback(this, function (response) {
		var state = response.getState();
		if (state === 'SUCCESS') {
			component.set(this.componentAttribute(sObjectName), response.getReturnValue());
		}
    });
    $A.enqueueAction(action);
  },
  serverMethod: function (sObjectName) {
	  var proper = this.capitalizeFirstLetter(sObjectName);
	  return 'c.get' + proper + 'ListFromServer';
  },
  capitalizeFirstLetter: function (sObjectName) {
	  return sObjectName.charAt(0).toUpperCase() + sObjectName.slice(1);
  },
  componentAttribute: function (sObjectName) {
	  return 'v.' + sObjectName + 'List';
  }
})