public class scheduleloadedcontact implements Schedulable{
    @future(callout=true)
    public static void loadedcontact(){
    List<Contact> fixOrderList = [Select Name,Phone from Contact];
List<Loadedcontact__c> partOrderList = New List<Loadedcontact__c>();
for(contact fixOrder : fixOrderList){

Loadedcontact__c partOrder = New Loadedcontact__c();
partOrder.Name__c = fixOrder.Name;
partOrder.Phone__c = fixOrder.Phone;
System.debug(partOrder.Name__c );
partOrderList.add(partOrder);
System.debug(partOrder);
}
Insert partOrderList;
    }
    public void execute(SchedulableContext sc)
{
loadedcontact();
}

}