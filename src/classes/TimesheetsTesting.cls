@isTest
public class TimesheetsTesting {
    
    @isTest static void Status_ChangeTest() {
        Timesheet__c t = new Timesheet__c();
        t.Type__c = 'Regular';
        t.Submitted__c = true;
        
        Test.startTest();
        try{
            insert t;    
        }
        catch(exception e){
            
        }
        
        Test.stopTest();
        
    }
    
    @isTest static void Prevent_DeleteTest(){
        
        Contact c = new Contact();
        c.LastName = 'testing1';
        insert c;
        Timesheet__c timesheet = new Timesheet__c();
        timesheet.Submitted__c = true;
        timesheet.Employee__c = c.id;
        insert timesheet;
        
        
        Test.startTest();
        
        Database.DeleteResult drLst = Database.delete(timesheet, false);        
        
        System.assert(!drLst.isSuccess());
        System.assertEquals('Cannot delete a submitted timesheet', drLst.getErrors()[0].getMessage());
        
        Test.stopTest();
    }
    
    @isTest static void TimesheetControllerTest(){
       
            Contact c = new Contact(LastName = 'Test');
        insert c;
            Timesheet__c timesheet = new Timesheet__c();
        timesheet.Employee__c = c.Id;  
        
        insert timesheet;
        
        Test.startTest();
        
        System.assertEquals(1, TimesheetController.getAllTimesheets().size());
        System.assertEquals(1, TimesheetController.getRecentTimesheets().size());
        Test.stopTest();
        
    }
    
}