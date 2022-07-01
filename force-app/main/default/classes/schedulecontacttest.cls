public class schedulecontacttest implements schedulable{
    public void execute(SchedulableContext context){
        ContactTestApex con = new ContactTestApex();
        con.importCSVFile();
    }
}