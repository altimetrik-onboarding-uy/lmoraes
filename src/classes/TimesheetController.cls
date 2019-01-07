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
               FROM Timesheet__c order by createdDate DESC limit 4];
      /*  
        List<Timesheet__c> ret = [SELECT Start_Date__c, (SELECT Name, Birthdate FROM Contact LIMIT 1),
               End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c
               FROM Timesheet__c];
 
        List<Contact> c = [SELECT Name, Birthdate, (SELECT Start_Date__c, 
               End_Date__c, Gross_Pay__c, Type__c, Total_hours__c, Hour_rate__c, Submitted__c, Taxes__c, Timesheet_Status__c
               FROM Timesheet__c) FROM Contact LIMIT 1];   
        
        [SELECT Employee__r.Name FROM Timesheet__c GROUP BY Employee__r.Name HAVING COUNT(Employee__r.Name) < 2];
        
		*/
  
    }
    
}