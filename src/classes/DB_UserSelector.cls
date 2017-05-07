public with sharing class DB_UserSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
        		User.id,
                User.name
        };
    }

    public Schema.SObjectType getSObjectType() {
        return User.sObjectType;
    }
}