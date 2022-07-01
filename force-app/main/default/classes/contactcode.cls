public class contactcode {
    public static void loadedcontact(){
    List<Contact> fixOrderList = [Select Name,Phone from Contact];
    List<LoadedContact__c> contactList = [Select id,Name__c,Phone__c from LoadedContact__c];
  
List<Loadedcontact__c> partOrderList =new List<Loadedcontact__c>();
for(contact fixOrder : fixOrderList){

Loadedcontact__c partOrder = New Loadedcontact__c();
partOrder.Name__c = fixOrder.Name;
partOrder.Phone__c = fixOrder.Phone;
    

  


System.debug(partOrder.Name__c );
partOrderList.add(partOrder);
System.debug(partOrder);
}
        
insert partOrderList;
    }
    
}