public class accload implements schedulable{
    public static String Output{get;set;}
    @future(callout=true)
    public static void accmethod(){
Http h = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v53.0/sobjects/ContentVersion/0685g000002m1HHAAY/VersionData');
req.setMethod('GET');
req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
req.setHeader('Content-Type', 'application/json');
HttpResponse res = h.send(req);
//system.debug(res.getBody());
Output = res.getBody() ; //will contain complete json body
//system.debug('Output : ' + Output);

try
{
String[] listOfOutput = Output.split('\\s{2,}');

for(integer i=1;i<listOfOutput.size();i++)
{
Account accObj = new Account();
// system.debug('size :'+listOfOutput.size());
string[] csvRecordData = listOfOutput[i].split(',');
// system.debug('csvRecordData'+csvRecordData);
accObj.Name = csvRecordData.get(0);
accObj.AccountNumber = csvRecordData.get(1);
accObj.Phone = csvRecordData.get(2);

Account []queriedAccount = [SELECT Name FROM Account WHERE Name = :accObj.Name];
if(queriedAccount.size() == 0)
{
insert accObj;
System.debug('I value :'+i);
}


}

}
finally
{
System.debug('excuted finally');
}
    }
    public void execute(SchedulableContext context){
        accmethod();
    }
}