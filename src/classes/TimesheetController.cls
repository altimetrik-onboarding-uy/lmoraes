public with sharing class TimesheetController {
    @AuraEnabled
    public static List<Timesheet__c> getAllTimesheets(){
        return [SELECT id, Employee__c, Employee__r.Name, Employee__r.Birthdate, Start_Date__c, 
               End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c
               FROM Timesheet__c];
    }
    
    @AuraEnabled
    public static List<Timesheet__c> getRecentTimesheets(){
        
        return [SELECT id, Employee__c, Employee__r.Name, Employee__r.Birthdate, Start_Date__c, 
               End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c
               FROM Timesheet__c order by lastModifiedDate DESC limit 4];
   
    }
    
}