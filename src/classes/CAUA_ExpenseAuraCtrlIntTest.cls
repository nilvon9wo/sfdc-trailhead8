@isTest
public with sharing class CAUA_ExpenseAuraCtrlIntTest {
	private static final User TEST_RUNNER = TEST_RunAsUserFactory.create();
	
    @isTest public static void testSaveExpense() {
	    // Arrange
	    String description = 'My New Expense';
	    Expense__c expenseTemplate = new Expense__c(description__c = description);
	    Expense__c testExpense = TEST_ExpenseFactory.create(expenseTemplate, TEST_DummyInsertModeEnum.REAL);
	
	    // Act 
	    Expense__c resultExpense;
	    System.runAs(TEST_RUNNER){
	        Test.startTest();
	        {
	            resultExpense = CAUA_ExpenseAuraCtrl.saveExpense(testExpense);
	        }
	        Test.stopTest();
	    }
	
	    // Assert
	    System.assertEquals(testExpense, resultExpense);
	    
	    List<Expense__c> resultList = [SELECT id FROM Expense__c WHERE description__c = :description];
	    System.assertEquals(1, resultList.size());
	    System.assertEquals(description, resultList[0].description__c);
	}
}