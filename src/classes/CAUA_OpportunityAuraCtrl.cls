public with sharing class CAUA_OpportunityAuraCtrl {
	DB_OpportunitySelector opportunitySelector;
	
	public CAUA_OpportunityAuraCtrl(DB_OpportunitySelector opportunitySelector){
		this.opportunitySelector = opportunitySelector;
	}
	
	public CAUA_OpportunityAuraCtrl(){
		this(new DB_OpportunitySelector());
	}

	@AuraEnabled
	public static List<Opportunity> getOpportunities() {
		return (new CAUA_OpportunityAuraCtrl()).selectList();
	}
	
	@testVisible
	private List<Opportunity> selectList() { 
		return opportunitySelector.selectAll();
	}
	
	
	@AuraEnabled
	public static Opportunity getOpportunity(String id) {
		return (new CAUA_OpportunityAuraCtrl()).selectById((Id) id);
	}
	
	@testVisible
	private Opportunity selectById(Id id) {
		return opportunitySelector.selectWithAccountAndOwnerByOpportunityId(new Set<Id>{id})[0];
	}
}