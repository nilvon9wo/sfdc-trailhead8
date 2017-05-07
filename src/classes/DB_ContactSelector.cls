public with sharing class DB_ContactSelector {
    public List<Contact> selectAll() {
    	return [
    		SELECT Id, Name, Email, Phone, Title 
    		FROM Contact 
    		LIMIT 5
    	];
    }
    
}