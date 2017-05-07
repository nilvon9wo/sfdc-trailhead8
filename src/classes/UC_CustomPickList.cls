global class UC_CustomPickList extends VisualEditor.DynamicPickList {
    global override VisualEditor.DataRow getDefaultValue() {
    	return new VisualEditor.DataRow('red', 'RED');
    }
    
    global override VisualEditor.DynamicPickListRows getValues() {
    	VisualEditor.DynamicPickListRows listRows = new VisualEditor.DynamicPickListRows();
    	listRows.addRow(new VisualEditor.DataRow('red', 'RED'));
    	listRows.addRow(new VisualEditor.DataRow('yellow', 'YELLOW'));
    	return listRows;
    }
}