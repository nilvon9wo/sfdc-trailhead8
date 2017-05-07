public with sharing class DB_LeadSelector {
    public List<Lead> selectAll() {
    	return [
    		SELECT Id, Name, Company, Email, Phone, Status 
    		FROM Lead 
    		LIMIT 5
    	];
    }
}