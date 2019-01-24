global class TimesheetBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Employee__c, Employee__r.Name, Employee__r.Birthdate, Start_Date__c,  End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c FROM Timesheet__c WHERE Gross_Pay__c > 5000'
                                       );
    }
    
    global void execute(Database.BatchableContext bc, List<Timesheet__c> scope){
        String jobID = System.schedule('Update Timesheets', '0 0 0 ? * * *', new TimesheetScheduler());
    } 
    
    global void finish(Database.BatchableContext bc){
        Id job= bc.getJobId();
        System.debug(job);
    }    
}