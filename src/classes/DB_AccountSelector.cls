public with sharing class DB_AccountSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
        		Account.id,
                Account.billingCity,
                Account.billingState,
                Account.name,
                Account.ownerId,
                Account.phone,
                Account.website
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Account.sObjectType;
    }

	public List<Account> selectById(Set<Id> idSet) {
        return (List<Account>) selectSObjectsById(idSet);
    }
    
    public List<Account> selectAll() {
        return (List<Account>) Database.query(
                newQueryFactory()
                .setLimit(5)
                .toSOQL()
        );
    }
}