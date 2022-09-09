trigger assignmentcontacttrigger on Account (after insert) {
List<contact> accList = new List<contact>();        
        for(Account objAcc : trigger.new){                
            
             Contact objCon = new Contact();
       		 objCon.LastName='chaya';
       		 objCon.AccountId=objAcc.id;
        	 accList.add(objCon);
                                   
        }      
        insert accList;
}