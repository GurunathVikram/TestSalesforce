public  class ContactTestApex  {
    
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<contact> acclist{get;set;}
      public ContactTestApex(){
       
        csvFileLines = new String[]{};
        acclist = New List<Contact>(); 
      }
      
public void importCSVFile(){
try{
    csvAsString = csvFileBody.toString();
    csvFileLines = csvAsString.split('\n');
    for(Integer i=1;i<csvFileLines.size();i++){
    Contact accObj = new Contact() ;
    string[] csvRecordData = csvFileLines[i].split(',');
    accObj.FirstName = 'Hello';//csvRecordData[0] ;
    accObj.LastName = 'Rock'; // csvRecordData[1];
    accObj.Email = csvRecordData[2];
    accObj.MobilePhone = csvRecordData[3];
    Contact []queriedContact = [SELECT Account.Name FROM Contact WHERE FirstName = :accObj.FirstName];
        if(queriedContact.size()==0)
        insert accObj;
        else
        {
        //queriedContact[0].Phone=accObj.Phone;
        //update queriedContact[0];
        accObj.Id=queriedContact[0].Id;
        update accObj;
        }
        }
            }
        catch (Exception e)
        {
        ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,e.getMessage());
        ApexPages.addMessage(errorMessage);
            }
}
     
}