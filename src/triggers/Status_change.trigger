trigger Status_change on Timesheet__c (before insert, before update) {
	  List<Timesheet__c> timesheets = new List<Timesheet__c>();
            
        for (TImesheet__c t : Trigger.new){
            if(t.Submitted__c){
                t.Timesheet_Status__c = 'Submitted';
                timesheets.add(t);
            }
                
        }
}