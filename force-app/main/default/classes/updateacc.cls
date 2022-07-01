global class updateacc implements Database.Batchable<sObject>
{
    
    global Database.QueryLocator  start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select Id,Name from Account');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> acclist)
    {
   
        for(Account acc: acclist){
            
            if(acc.Id == '0015g00000PyNtUAAV'){
              //acc.RecordTypeId = '0124A000001gzlj';
              acc.Name = 'kieron122';
            }
        }
        System.debug('IN the execute method');
        update acclist;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
    //updateacc upd = new updateacc();
    //Database.executeBatch(upd);
}