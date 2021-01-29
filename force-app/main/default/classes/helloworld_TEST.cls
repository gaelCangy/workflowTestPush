/**
 * @File Name          : ContentDocumentTriggerHandler.cls
 * @Description        : 
 * @Author             : abdool.miskin@sc-mauritius.com
 * @Group              : 
 * @Last Modified On   : 11-25-2020
 * @Modification Log   : 
 *===================================================================================
 * Ver         Date                           Author                  Modification
 *===================================================================================
 * 1.0    06/12/2019, 09:53:01     abdool.miskin@sc-mauritius.com    Initial Version
**/
@IsTest
public without sharing class helloworld_TEST {
    @isTest
    public static void helloworld(){
        Test.startTest();
            helloworld.helloworld();
        Test.stopTest();

        system.assert(true);
        System.debug('hello world');
    }
}