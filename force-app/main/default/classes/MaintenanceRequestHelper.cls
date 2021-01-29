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
public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> lstCaseNew,Map<ID,Case> mapNewCase,Map<ID,Case> mapOldCase){
            List<Case> lstCaseValid = new List<Case>();
            List<Case> lstCaseIns = new List<Case>();
    
            for(Case cse:lstCaseNew){
                if(cse.Status != mapOldCase.get(cse.Id).Status && cse.Status == 'Closed' ){
                    lstCaseValid.add(cse);
                }
            }
    
            if(lstCaseValid.size() > 0){
                Map<Id, Product2> mapEquip = new Map<Id, Product2>([SELECT Id, Maintenance_Cycle__c,Lifespan_Months__c,Replacement_Part__c,Name
                                                                    from Product2
                                                                    ]);
    
    
                for(Case cse:lstCaseValid){
                    Date dateClosed = date.newinstance(cse.ClosedDate.year(), cse.ClosedDate.month(), cse.ClosedDate.day());
                    Integer noDays =  Integer.valueOf(mapEquip.get(cse.Equipment__c).Maintenance_Cycle__c);
                    System.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@ maintainance cycle: '+ mapEquip.get(cse.Equipment__c).Maintenance_Cycle__c);
        
                    lstCaseIns.add(new Case(Vehicle__c=cse.Vehicle__c , Equipment__c = cse.Equipment__c , Type = 'Routine Maintenance' ,
                                             Subject = 'Maintenance', Date_Reported__c = dateClosed , Date_Due__c=dateClosed.addDays(noDays)
                                            ));
                }
        
                insert lstCaseIns;
            }
        }
    }        
    
