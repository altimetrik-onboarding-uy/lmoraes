trigger Prevent_Delete on Timesheet__c (before delete) {
    for(Timesheet__c t : Trigger.old){
        if(t.Submitted__c == true){
            t.addError('Cannot delete a submitted timesheet'); 
        }
    }
}