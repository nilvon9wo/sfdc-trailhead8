public with sharing class TEST_ExpenseFactory extends TEST_SObjectFactory {
	private static Map<String, Object> defaultByKeyMap = new Map<String, Object>{
		'amount__c' => 20.0
	}; 
	
	public static List<Expense__c> createList(Expense__c template, Integer quantity, TEST_DummyInsertModeEnum insertMode){
		MockStrategyInterface strategy = new EquipmentInQuantityStrategy(template, quantity); 
		return (List<Expense__c>) TEST_SObjectFactory.createList(strategy, insertMode); 
	}
	
	public static Expense__c create(Expense__c template, TEST_DummyInsertModeEnum insertMode){
		Integer quantity = 1;
		return createList(template, quantity, insertMode)[0];
	}

	class EquipmentInQuantityStrategy extends SObjectInQuantityStrategy {
		EquipmentInQuantityStrategy(SObject template, Integer quantity) {
			super(template, quantity, 'Expense ', defaultByKeyMap);
		}
	}
}