Public with sharing class accountHome {
    @AuraEnabled(cacheable=true)
    public static List<Account> accounthometab(){
        try {
            return[SELECT Id, Name, Phone, Website, AnnualRevenue, Industry, Type FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string accountaddbutton(String accountName){
        try {
            List<Account> accListToBeDeleted = [SELECT Id, Name FROM Account WHERE Name =: accountName];
            delete accListToBeDeleted;
            return accountName;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    // @AuraEnabled
    // public static string accountdeletebutton(){
    //     try {
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
}
