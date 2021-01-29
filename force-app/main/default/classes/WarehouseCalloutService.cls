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

public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @Future(callout=true)
    public static void runWarehouseEquipmentSync(){
        List<Product2> lstOfEqup = new List<Product2>();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200){
            List<Json2Apex> lstOfEquipments = (List<Json2Apex>) JSON.deserialize(response.getBody(), List<Json2Apex>.class);
            
            for(Json2Apex inst : lstOfEquipments){
                Product2 prod = new Product2();
                prod.Cost__c = inst.cost;
                prod.Lifespan_Months__c = inst.lifespan;
                prod.Maintenance_Cycle__c = inst.maintenanceperiod;
                prod.Name = inst.name;
                prod.Current_Inventory__c = inst.quantity;
                prod.Replacement_Part__c = inst.replacement;
                prod.Warehouse_SKU__c = inst.sku;
                
                lstOfEqup.add(prod);
            }
        }
        
        if(lstOfEqup != null && lstOfEqup.size() > 0){
            UPSERT lstOfEqup Warehouse_SKU__c;
        }
    }
    
    //Wrapper class for Responce details.
    private class Json2Apex{
        private String id;
        private Integer cost;
        private Integer lifespan;
        private Integer maintenanceperiod;
        private String name;
        private Integer quantity; 
        private boolean replacement;
        private String sku;          
    }

}
// public with sharing class WarehouseCalloutService {

//     private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
   

//     private class dataResponseParam{
//         public String id;
//         public String replacement;
//         public Decimal quantity;
//         public String name;
//         public String maintenanceperiod;
//         public String lifespan;       
//         public Decimal cost;     
//         public String sku;       
//     }

//     @future(callout=true)
//     public static void runWarehouseEquipmentSync() {
//         //ToDo: complete this method to make the callout (using @future) to the
//         //      REST endpoint and update equipment on hand.
//         //Creates the HTTP Request and set the values before making the call
//         HttpResponse response;
//         Integer statuscode;

//         Http http = new Http();
//         HttpRequest request = new HttpRequest();  
//         request.setEndpoint(WAREHOUSE_URL); //Gets the url from the SysConfig meta data       
//         request.setMethod('GET');
//         request.setTimeout(12000);//12 sec
        
//         try{
//             response = http.send(request);
//             System.debug('@@@@@@@@@@Response : '+response.getBody());
//         }catch(Exception e){
//             System.debug('@@@@@@@@@@Error could not complete the request');
//         }
//         if(response != null){            
//             statuscode = response.getStatusCode();
//             if(statuscode == 200){
//                 System.debug('@@@@@@@@@@Request successfull');
            
//                 String replaced = response.getBody().replaceAll('"_id"', '"id"');                  

//                 List<dataResponseParam> results = (List<dataResponseParam>) JSON.deserialize(replaced,List<dataResponseParam>.class);
                

//                 List<Product2> lstEqpUpd = new List<Product2>();
//                 List<String> externalSku = new List<String>();

//                 for(dataResponseParam eqp:results){
//                     externalSku.add(eqp.sku);
//                 }

//                 list<Product2> LstProdToUpsert = new list<Product2>([SELECT ID,ProductCode,Name,Current_Inventory__c,Cost__c,Lifespan_Months__c,Maintenance_Cycle__c,Replacement_Part__c,Warehouse_SKU__c
//                                                                         FROM Product2
//                                                                         WHERE Warehouse_SKU__c IN : externalSku]);
//                 //
//                 Map<String,Product2> mapProd2 = new Map<String,Product2>();
//                 for(Product2 prd2:LstProdToUpsert){
//                     mapProd2.put(prd2.Warehouse_SKU__c,prd2);
//                 }

//                 for(dataResponseParam eqp:results){
//                     Integer lfSpan = Integer.valueOf(eqp.lifespan);
//                     Integer mntCycle = Integer.valueOf(eqp.maintenanceperiod);
//                     if(mapProd2.get(eqp.sku)==null){

//                         lstEqpUpd.add(new Product2(ProductCode=eqp.id ,Name=eqp.name, Cost__c=eqp.cost , Current_Inventory__c=eqp.quantity , Lifespan_Months__c=lfSpan ,
//                         Maintenance_Cycle__c=mntCycle , Replacement_Part__c=true , Warehouse_SKU__c=eqp.sku ));

//                     }else{
//                         Product2 prod= mapProd2.get(eqp.sku);
//                         prod.ProductCode=eqp.id ;
//                         prod.Name=eqp.name;
//                         prod.Cost__c=eqp.cost; 
//                         prod.Current_Inventory__c=eqp.quantity ;
//                         prod.Lifespan_Months__c=lfSpan   ;                         
//                         prod.Maintenance_Cycle__c=mntCycle ;
//                         prod.Replacement_Part__c=true ;
//                         prod.Warehouse_SKU__c=eqp.sku ;
//                         lstEqpUpd.add(prod);
//                     }
                    
//                 }


//                 upsert lstEqpUpd ;

//             }else {
//                 System.debug('@@@@@@@@@@Error could not complete the request'+statuscode);
//             }
//         }
//         else{
//             //in some error cases there may be no response
//             statuscode = 500;
//             System.debug('@@@@@@@@@@No response received');
//         }  

//     }
// }