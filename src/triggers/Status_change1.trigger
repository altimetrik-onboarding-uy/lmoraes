trigger Status_change1 on Timesheet__c (before insert) {
	  System.debug('Hello World!');
}