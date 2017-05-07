public with sharing class DB_WidgetSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
        		Widget__c.id,
                Widget__c.name,
                Widget__c.text__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Widget__c.sObjectType;
    }

    public List<Widget__c> selectAll() {
        return (List<Widget__c>) Database.query(
                newQueryFactory()
                .toSOQL()
        );
    }
}