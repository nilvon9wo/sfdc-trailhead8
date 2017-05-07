public with sharing class SearchResultAuraCtrl {
	DB_AccountSelector accountSelector;
	DB_ContactSelector contactSelector;
	DB_LeadSelector leadSelector;
	
	public SearchResultAuraCtrl(DB_AccountSelector accountSelector, DB_ContactSelector contactSelector, DB_LeadSelector leadSelector) {
		this.accountSelector = accountSelector; 
		this.contactSelector = contactSelector; 
		this.leadSelector = leadSelector; 
	}
	
	public SearchResultAuraCtrl() {
		this(new DB_AccountSelector(), new DB_ContactSelector(), new DB_LeadSelector());
	}
    
    @AuraEnabled
    public static List<Account> getAccountListFromServer(){
        return (new SearchResultAuraCtrl()).selectAccountList(); 
    }

    public List<Account> selectAccountList(){
        return this.accountSelector.selectAll(); 
    }
    
    @AuraEnabled
    public static List<Contact> getContactListFromServer(){
        return (new SearchResultAuraCtrl()).selectContactList();
    }

    public List<Contact> selectContactList(){
        return this.contactSelector.selectAll(); 
    }
    
    @AuraEnabled
    public static List<Lead> getLeadListFromServer(){
        return (new SearchResultAuraCtrl()).selectLeadList();
    }

    public List<Lead> selectLeadList(){
        return this.leadSelector.selectAll(); 
    }
}