abstract public class CB_AbstractFooHandler {
    public String getLegacyLabel() {
    	String className = String.valueOf(this).split(':')[0];
    	Integer suffixLength = 'Handler'.length();
    	return className.left(className.length() - suffixLength);
    }
}