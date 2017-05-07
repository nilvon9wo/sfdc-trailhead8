public with sharing class DB_OpportunitySelector extends fflib_SObjectSelector {
	DB_AccountSelector accountSelector;
	DB_UserSelector userSelector;
	
	public DB_OpportunitySelector(DB_AccountSelector accountSelector, DB_UserSelector userSelector) {
		this.accountSelector = accountSelector;
		this.userSelector = userSelector;
	}
	
	public DB_OpportunitySelector() {
		this(new DB_AccountSelector(), new DB_UserSelector());
	}
	

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
        		Opportunity.id,
        		Opportunity.amount,
                Opportunity.closeDate,
        		Opportunity.description,
                Opportunity.name,
        		Opportunity.stageName
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Opportunity.sObjectType;
    }

	public List<Opportunity> selectWithAccountAndOwnerByOpportunityId(Set<Id> idSet) {
 		fflib_QueryFactory opportunitiesQueryFactory = newQueryFactory();
 		this.accountSelector.configureQueryFactoryFields(opportunitiesQueryFactory, 'Account');
 		this.userSelector.configureQueryFactoryFields(opportunitiesQueryFactory, 'Owner');
        return (List<Opportunity>) Database.query(
                opportunitiesQueryFactory.setCondition('id IN :idSet').toSOQL()
        );		
    }
    
    public List<Opportunity> selectAll() {
        return (List<Opportunity>) Database.query(
                newQueryFactory()
                .setLimit(5)
                .toSOQL()
        );
    }
}