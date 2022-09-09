trigger assigmenttasktrigger on Account (before insert, before update) {
Set<String> accNameSet = new Set<String>();
    Map<String,Account> accMap = new Map<String,Account>();   
    for(Account objAcc : trigger.new){
        if(String.isNotBlank(objAcc.Name)){            
            if(trigger.isInsert && trigger.isBefore){
	            accNameSet.add(objAcc.Name); 
            }            
            if(trigger.isUpdate && trigger.isBefore){
                if(objAcc.Name != trigger.oldMap.get(objAcc.Id).Name){
                    accNameSet.add(objAcc.Name); 
                }
            }                       
        }
    }                  
        for(Account objAcc : [select Id, Name from Account where Name IN : accNameSet]){
            accMap.put(objAcc.Name, objAcc);        
    }    
    
        for(Account objAcc : trigger.new){
            if(accMap.containsKey(objAcc.Name)){
                objAcc.addError('Please Select other Account Name');
            }                   
    }           
}