function executeAction(action) {
    return new Promise(function(resolve, reject) {
        action.setCallback(this, function(response) {
          convert(response, resolve, reject);
        });
    $A.enqueueAction(action);
    });
  
   function convert(response, resolve, reject) {
     switch(response.getState()) {
       case 'SUCCESS' : resolve(response.getReturnValue()); break;
       case 'ERROR' : rejectError(response.getError()); break;
     }

     function rejectErrors(errors) {
       var errorMessage = (errors && errors[0] && errors[0].message) ? errors[0].message : 'Unknown error';
       reject(Error('Error message: ' + errorMessage));
     }
  }
}

