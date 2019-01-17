({
    getTimesheets : function(component, event, methodName, targetAttribute) {
        var action = component.get('c.'+methodName);
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
	
                component.set('v.'+targetAttribute, data);
				console.log(data);
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    
    onGroup : function(component, event, helper){
        var selected = event.getSource().get("v.label");
        if(selected == "Recent Timesheets"){
            helper.getTimesheets(component, event, 'getRecentTimesheets', 'data');
        }
        else{
            helper.getTimesheets(component, event, 'getAllTimesheets', 'data');
        }
    },
            
})