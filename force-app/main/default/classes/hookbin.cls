public class hookbin {
    
    @future(callout=true)
    public static void method123(id opptyid){
        String endpoint = 'https://hookb.in/XkKM2xPREzuDYMQQYxL2';



//Set Method and Endpoint and Body
Http http=new Http();
HttpRequest req= new HttpRequest();
req.setMethod('POST');
req.setEndpoint(endpoint);
//json string in body
system.debug('Opportunity ID' + opptyid);
        


List<Opportunity> Op = [select id, Name, Stagename, Account.Name from Opportunity where stagename = 'Closed Won'and id = : opptyid];
//List<Opportunity> Op = [SELECT id, Name, Stagename, Account.Name from Opportunity where stagename = 'Closed Won' order by LastModifiedById DESC limit 1];
System.debug('with pretty' + JSON.serializePretty(Op));
system.debug('without pretty' + JSON.serialize(Op));
String JsonString = JSON.serializePretty(Op);
req.setBody(JsonString);
system.debug(JsonString);
HTTPResponse res = http.send(req);
System.debug(res.getBody());
    }
}