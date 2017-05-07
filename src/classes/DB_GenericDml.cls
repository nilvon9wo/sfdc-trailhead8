public with sharing class DB_GenericDml { 
	private static final Boolean IS_ALL_OR_NONE = true; 
	
    public Database.DeleteResult[] doDelete(List<SObject> sObjectList) {
    	return Database.delete(sObjectList, IS_ALL_OR_NONE);
    }
    
    public Database.SaveResult[] doUpdate(List<SObject> sObjectList) {
    	return Database.update(sObjectList, IS_ALL_OR_NONE);
    }
    
    public Database.UpsertResult[] doUpsert(List<SObject> sObjectList) {
    	return Database.upsert(sObjectList, IS_ALL_OR_NONE); 
    } 
}