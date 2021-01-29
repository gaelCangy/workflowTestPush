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
public with sharing class WarehouseSyncSchedule implements Schedulable {
    // implement scheduled code here
    public void execute(SchedulableContext ctx) {
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }

}