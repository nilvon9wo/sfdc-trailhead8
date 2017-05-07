public with sharing class CAUA_ExpenseAuraCtrl {
	private DB_ExpenseSelector expenseSelector;
	private DB_GenericDml genericDml;
	
	private final List<String> EXPENSE_ACCESS_FIELDS = new List<String>{
		'amount__c', 'client__c', 'createdDate', 'date__c', 'id', 'name', 'reimbursed__c'
	}; 
	
	public CAUA_ExpenseAuraCtrl(DB_ExpenseSelector expenseSelector, DB_GenericDml genericDml) {
		this.expenseSelector = expenseSelector;
		this.genericDml = genericDml;
	}
	
	public CAUA_ExpenseAuraCtrl() {
		this(new DB_ExpenseSelector(), new DB_GenericDml());
	}
	
    @AuraEnabled
    public static List<Expense__c> getExpenses() {
    	return (new CAUA_ExpenseAuraCtrl()).selectAll();
    }
    
    @testVisible 
    public List<Expense__c> selectAll() {
    	return expenseSelector.selectAll();
    }
    
    @AuraEnabled
    public static List<Expense__c> getExpensesAsSFDCRecommends() {
    	return (new CAUA_ExpenseAuraCtrl()).selectAllWithExplicitChecks();
    }
    
    @testVisible 
    private List<Expense__c> selectAllWithExplicitChecks() {
    	try {
    		hasAccessToExpensesFields();
    	}
    	catch (System.NoAccessException noAccessException) {
    		throw noAccessException;
    	}
    	
    	return expenseSelector.selectAll();
    }
    
    @testVisible 
    private Boolean hasAccessToExpensesFields() {
    	Map<String,Schema.SObjectField> expenseFieldMap = Schema.SObjectType.Expense__c.fields.getMap();
    	for (String fieldToCheck : EXPENSE_ACCESS_FIELDS) {
    		if (!expenseFieldMap.get(fieldToCheck).getDescribe().isAccessible()) {
    			throw new System.NoAccessException(); 
    		}
    	}
    	return true;
    }
    
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
    	return (new CAUA_ExpenseAuraCtrl()).save(expense);
    }
    
    @testVisible 
    private Expense__c save(Expense__c expense) {
    	this.genericDml.doUpsert(new List<Expense__c>{expense}); 
    	return expense;
    }
     
    @AuraEnabled
    public static Expense__c deleteExpense(Expense__c expense) {
    	return (new CAUA_ExpenseAuraCtrl()).doDelete(expense);
    }
    
    @testVisible 
    private Expense__c doDelete(Expense__c expense) {
    	this.genericDml.doDelete(new List<Expense__c>{expense}); 
    	return expense;
    }
}