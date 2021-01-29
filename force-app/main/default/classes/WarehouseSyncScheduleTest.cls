/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-26-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-26-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
@isTest
public class WarehouseSyncScheduleTest{
    @isTest
    static void testWarehouseSyncSchd(){
        String sch = '0 0 0 * * ? 2020';
        Test.startTest();
            // Set mock callout class
            Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
            String jobId = System.schedule('ScheduledWarehouseTest', sch, new WarehouseSyncSchedule());
            
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
            
            System.assertEquals(sch, ct.CronExpression);
        Test.stopTest();
    }
}