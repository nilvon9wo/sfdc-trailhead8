public with sharing class CAUA_AccountAuraCtrl {
	DB_AccountSelector accountSelector; 
	DB_GenericDml genericDML;
	
	public CAUA_AccountAuraCtrl(DB_AccountSelector accountSeelctor, DB_GenericDml genericDML) {
		this.accountSelector = accountSelector;
		this.genericDML = genericDML;
	}
	     
	public CAUA_AccountAuraCtrl() {
		this(new DB_AccountSelector(), new DB_GenericDml());
	}
	
	@AuraEnabled
	public static void updateAnnualRevenue(String accountId, Decimal annualRevenue) {
		(new CAUA_AccountAuraCtrl()).updateRevenue((Id) accountId, annualRevenue);
	}
	
	@testVisible
	private Account updateRevenue(Id accountId, Decimal annualRevenue) {
		Account account = new Account(
			id = accountId,
			annualRevenue = annualRevenue
		); 
		genericDml.doUpdate(new List<Account>{account});
		return account;
	}
}