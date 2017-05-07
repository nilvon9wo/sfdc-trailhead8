public with sharing class CAUA_SimpleAuraCtrl {
	private static final String GREETING_PREFIX = 'Hello ';
	private static final String GREETING_SUFFIX = '!';

	private static final Set<String> BAD_WORDS_SET = new Set<String>{
		'bad', 'words', 'here'
	};
	
	@AuraEnabled
	public static String hello(String name) {
		try {
			return (new CAUA_SimpleAuraCtrl()).greet(name);
		}
		catch (CAUA_BadWordException badWordException) {
			throw new AuraHandledException(badWordException.getMessage());
		}
	}
	
	@testVisible
	private String greet(String name) {
		if (BAD_WORDS_SET.contains(name)) {
			throw new CAUA_BadWordException('NSFW name detected');
		} else {
			for (String badWord : new List<String>(BAD_WORDS_SET)) {
				if (name.containsIgnoreCase(badWord)) {
					throw new CAUA_BadWordException('Name contains unsafe uncontent.');
				}
			}
		}
		
		return (GREETING_PREFIX + name + GREETING_SUFFIX);
	}    
}