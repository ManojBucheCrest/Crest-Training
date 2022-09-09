trigger DuplicateAccounttrigger on Account (before insert, before update) {
 if(trigger.isBefore && trigger.isInsert){
        DuplicateAccount.DuplicateAccountHandler(trigger.new);
    }
}