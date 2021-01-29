/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-25-2020
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   08-25-2020   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger CaseTrigger on Case (after update) {

// //================================Inserts======================================
//     //Before
//     if(Trigger.isBefore && Trigger.isInsert){
//         AccountTriggerHandler beforeInsertHandler = new AccountTriggerHandler();  
//         beforeInsertHandler.handleBeforeInsert(Trigger.new,Trigger.newMap);
//     }   

//     //After 
//     if(Trigger.isAfter && Trigger.isInsert){
//         AccountTriggerHandler afterInsertHandler = new AccountTriggerHandler();  
//         afterInsertHandler.handleAfterInsert(Trigger.new,Trigger.old);
//     }   


//================================Updates======================================
    //Before
    // if(Trigger.isBefore && Trigger.isUpdate ){    
    //     AccountTriggerHandler beforeUpdateHandler = new AccountTriggerHandler();  
    //     beforeUpdateHandler.handleBeforeUpdate(Trigger.new,Trigger.newMap,Trigger.oldMap);                 
    // } 
    
    //After
    if(Trigger.isAfter && Trigger.isUpdate ){    
        CaseTriggerHandler afterUpdateHandler = new CaseTriggerHandler();  
        afterUpdateHandler.handleAfterUpdate(Trigger.new,Trigger.newMap,Trigger.oldMap);                 
    } 
}