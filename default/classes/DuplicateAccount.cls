public with sharing class DuplicateAccount {
   public static void DuplicateAccountHandler(List<Account> listAccount){
        Set<String> accountName = new Set<String>();
        for(Account accVar : listAccount){
            accountName.add(accVar.Name);
        }
        List<Account> duplicateAccounts = [SELECT Id, Name 
                                             FROM Account 
                                             WHERE Name IN :accountName]; 
        
        for(Account acc : listAccount){ // Use Trigger.new records
            if(duplicateAccounts.size()!=0){
                acc.Name.addError('Account allready exist');
            }
        }
    }
}