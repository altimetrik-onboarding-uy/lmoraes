global class TimesheetScheduler implements Schedulable {
    global void execute(SchedulableContext ctx){
        List<Timesheet__c> timesheets = [SELECT Id, Employee__c, Employee__r.Name, Employee__r.Birthdate, Start_Date__c, 
               End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c
               FROM Timesheet__c WHERE Gross_Pay__c > 5000];
     
        for(Timesheet__c t : timesheets) {
            
                t.Submitted__c = true;
                            
        }
        
        update timesheets;
    }
}