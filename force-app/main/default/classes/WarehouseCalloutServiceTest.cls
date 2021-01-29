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
private class WarehouseCalloutServiceTest {
    @isTest
    static void testWarehouseCalloutService(){
        Test.startTest();
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        WarehouseCalloutService.runWarehouseEquipmentSync();
        
        //System.assertEquals(2,[SELECT count() FROM Product2]);
        Test.stopTest();
    }
}