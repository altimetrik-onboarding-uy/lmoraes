({
    doInit : function(component, event, helper) {
        
        helper.getTimesheets(component, event, 'getAllTimesheets', 'data');
        
    },
    
    onGroup : function(component, event, helper){
        
        helper.onGroup(component, event, helper);
    },
    
    
})