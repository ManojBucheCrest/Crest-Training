@isTest
public class Testaccounthome {
@isTest
    public static void accounthometestmethod(){
	List<Account> acc = new List<Account>();
	acc = accountHome.accounthometab();
    string acclisttostring = JSON.serialize(acc);
    string name;
    acclisttostring = accountHome.accountaddbutton(name);
      	System.Assert(string.isBlank(acclisttostring));
}

 @isTest
    public static void accountaddbuttontest(){
        
        
       Account acct2   = new Account();
    acct2.Name      = 'testAccount';
    Insert acct2;
Test.startTest();
        accounthome.accountaddbutton('testAccount');
        Test.stopTest();
    }   
}