/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-26-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-25-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class CaseTriggerHandler {
   
//================================Updates======================================
    //After Update
    public void handleAfterUpdate(List<Case> lstCaseNew,Map<ID,Case> mapNewCase,Map<ID,Case> mapOldCase){
        AP01_MaintainanceRequestStatusChange m = new AP01_MaintainanceRequestStatusChange();
        MaintenanceRequestHelper.updateWorkOrders(lstCaseNew,mapNewCase,mapOldCase);
    }
}
