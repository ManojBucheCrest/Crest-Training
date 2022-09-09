@isTest
public class Testassigmenttasktrigger {
   private static testmethod void accounttrigger() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        Account acct = new Account(Name='Test Account');
        insert acct;
         Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();
        // Verify 
        // so verify that we got back an error.
        System.assert(result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        System.assertEquals('This Account is already Exists.',
                             result.getErrors()[0].getMessage());
    }

}