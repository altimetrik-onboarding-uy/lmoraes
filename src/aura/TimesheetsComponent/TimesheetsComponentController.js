({
    doInit : function(component, event, helper) {
        
        // if(radio.checked)helper.getTimesheets(component, event, 'getAllTimesheets', 'data');
        helper.getTimesheets(component, event, 'getAllTimesheets', 'data');
        
    },
    
    onGroup : function(component, event, helper){
        var selected = event.getSource().get("v.label");
        if(selected == "Recent Timesheets"){
            helper.getTimesheets(component, event, 'getRecentTimesheets', 'data');
        }
        else{
            helper.getTimesheets(component, event, 'getAllTimesheets', 'data');
        }
    }
    
    
})