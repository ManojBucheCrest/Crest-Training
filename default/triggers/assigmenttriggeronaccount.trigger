trigger assigmenttriggeronaccount on Account (before insert, before update)
{
    if(trigger.isbefore &&(Trigger.isinsert && Trigger.isupdate))
    {
        DuplicateAccount.DuplicateAccountHandler(trigger.new);
    }
}