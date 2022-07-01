@RestResource(urlMapping = '/sampleopp/*')
global with Sharing class  oppapi{

   
    @HTTPGet
    Global static Opportunity conid(){
        RestRequest Req = RestContext.request;
        String conid = Req.requestURI.substring(Req.requestURI.lastIndexOf('/')+1);
        Opportunity con = [SELECT id,Name,CloseDate,StageName,Product__c,Opportunity_Owner__c FROM Opportunity where id =: conid];
        return con;      
    }
    
    @HTTPPost
    Global static id contactinsert( String  oppName,String oppCloseDate,String oppStageName ,String oppProduct,String oppowner,String attachmentFileNameWithExtension1,String TextFile1){
        Opportunity css = new Opportunity(
            Name = oppName,
            CloseDate = workingdays(oppCloseDate),
            StageName = oppStageName,
            Product__c = oppProduct
            
            
        );
        
        
        
        if(css.Product__c == 'Commercial'){
        css.Opportunity_Owner__c = 'Christine Sadofsky';
        }else if(css.Product__c == 'Private'){
            css.Opportunity_Owner__c = 'Steve Nelson';
        }else if(css.Product__c == ''){
            css.Opportunity_Owner__c = 'Beth Gardner';
        }
        insert css;
        css.email1__c = 'gurunath.viki@gmail.com';
        css.Name = css.Id + css.Product__c;
        sendNotification(css);
        Blob str = EncodingUtil.base64Decode(TextFile1);
        // Attachment 1
            /*     ContentVersion cVersion1 = new ContentVersion();
                    cVersion1.ContentLocation = 'S';
                    cVersion1.PathOnClient = attachmentFileNameWithExtension1;//File name with extention
                    cVersion1.Title = attachmentFileNameWithExtension1;//Name of the file
                    String csvBodyver1 = TextFile1;
                    blob str1 = EncodingUtil.base64Decode(csvBodyver1);
                    blob valueBlobver1 = (str1);
                    cVersion1.VersionData = valueBlobver1; //File content
                    Insert cVersion1;
                    
                    string Versid1=[select contentDocumentid from contentVersion where id=: cVersion1.id].contentDocumentid;
                    ContentDocumentLink Doclink1 = New ContentDocumentLink();
                    doclink1.ContentDocumentId = versid1;
                    doclink1.linkedEntityId = css.id;
                    doclink1.sharetype='V';
                    doclink1.visibility='ALLUsers';
                    insert doclink1;
                
                // Attachment 2
               ContentVersion cVersion2 = new ContentVersion();
                    cVersion2.ContentLocation = 'S';
                    cVersion2.PathOnClient = attachmentFileNameWithExtension1;//File name with extention
                    cVersion2.Title = attachmentFileNameWithExtension1;//Name of the file
                    String csvBodyver2 = TextFile1;
                    blob str = EncodingUtil.base64Decode(csvBodyver2);
                    blob valueBlobver2 = (str);
                    cVersion2.VersionData = valueBlobver2; //File content
                    Insert cVersion2;
                    
                    string Versid2=[select contentDocumentid from contentVersion where id=: cVersion2.id].contentDocumentid;
                    ContentDocumentLink Doclink2 = New ContentDocumentLink();
                    doclink2.ContentDocumentId = versid2;
                    doclink2.linkedEntityId = css.id;
                    doclink2.sharetype='V';
                    doclink2.visibility='ALLUsers';
                    insert doclink2;
                
                // Attachment 3
                ContentVersion cVersion3 = new ContentVersion();
                    cVersion3.ContentLocation = 'S';
                    cVersion3.PathOnClient = attachmentFileNameWithExtension1;//File name with extention
                    cVersion3.Title = attachmentFileNameWithExtension1;//Name of the file
                    String csvBodyver3 = TextFile1;
                    blob str3 = EncodingUtil.base64Decode(csvBodyver3);
                    blob valueBlobver3 = (str3);
                    cVersion3.VersionData = valueBlobver3; //File content
                    Insert cVersion3;
                    
                    string Versid3=[select contentDocumentid from contentVersion where id=: cVersion3.id].contentDocumentid;
                    ContentDocumentLink Doclink3 = New ContentDocumentLink();
                    doclink3.ContentDocumentId = versid3;
                    doclink3.linkedEntityId = css.id;
                    doclink3.sharetype='V';
                    doclink3.visibility='ALLUsers';
                    insert doclink3;
                
                // Attachment 4
                ContentVersion cVersion4 = new ContentVersion();
                    cVersion4.ContentLocation = 'S';
                    cVersion4.PathOnClient = attachmentFileNameWithExtension1;//File name with extention
                    cVersion4.Title = attachmentFileNameWithExtension1;//Name of the file
                    String csvBodyver4 = TextFile1;
                    blob str4 = EncodingUtil.base64Decode(csvBodyver4);
                    blob valueBlobver4 = (str4);
                    cVersion4.VersionData = valueBlobver4; //File content
                    Insert cVersion4;
                    
                    string Versid4=[select contentDocumentid from contentVersion where id=: cVersion4.id].contentDocumentid;
                    ContentDocumentLink Doclink4 = New ContentDocumentLink();
                    doclink4.ContentDocumentId = versid4;
                    doclink4.linkedEntityId = css.id;
                    doclink4.sharetype='V';
                    doclink4.visibility='ALLUsers';
                    insert doclink4;
                
                // Attachment 5
                ContentVersion cVersion5 = new ContentVersion();
                    cVersion5.ContentLocation = 'S';
                    cVersion5.PathOnClient = attachmentFileNameWithExtension1;//File name with extention
                    cVersion5.Title = attachmentFileNameWithExtension1;//Name of the file
                    String csvBodyver5 = TextFile1;
                    blob str5 = EncodingUtil.base64Decode(csvBodyver5);
                    blob valueBlobver5 = (str5);
                    cVersion5.VersionData = valueBlobver5; //File content
                    Insert cVersion5;
                    
                    string Versid5=[select contentDocumentid from contentVersion where id=: cVersion5.id].contentDocumentid;
                    ContentDocumentLink Doclink5 = New ContentDocumentLink();
                    doclink5.ContentDocumentId = versid5;
                    doclink5.linkedEntityId = css.id;
                    doclink5.sharetype='V';
                    doclink5.visibility='ALLUsers';
                    insert doclink5; */
        
       Attachment a = new Attachment (ParentId = css.id,
                                       Body = str,
                                       ContentType = 'multipart/form-data',
                                       Name = attachmentFileNameWithExtension1);
        insert a;
        update css; 
  /*      list<Messaging.SingleEmailMessage> mailList = new list<Messaging.SingleEmailMessage>();
        String[] toAddresses = new String[]{''};
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Test Mail opportunity created ' + css.Id);
        mail.setPlainTextBody('This is a test mail' + css.Id + ' ' + PathonClient);
        mail.setToAddresses(toAddresses);
        mailList.add(mail);
        if(!mailList.isEmpty()){
            messaging.sendEmail(mailList);
        } */

        return css.Id;
    }
    
     
    
     static Date workingdays(String opp){
         integer j=0;
         Date d = Date.valueOf(opp);
         Datetime dt = (DateTime)d;
         String dayOfWeek = dt.format('EEEE');
         for(integer i=0;i<7;i++){
         d = Date.valueOf(opp) + i;
         dt = (DateTime)d; 
        dayOfWeek = dt.format('EEEE');
        System.debug('before if:' +dayOfweek);
        System.debug(i);
         if(i == 6 && DayOfWeek == 'Sunday'){
             d = Date.valueOf(opp) + i + 1;
              break;
         }else if(i == 6 && DayOfWeek == 'Monday'){
             d = Date.valueOf(opp) + i + 1;
              break;
         }else if(i == 6 && DayOfWeek == 'Tuesday'){
             d = Date.valueOf(opp) + i + 1;
              break;
         }else if(i == 6 && DayOfWeek == 'Wednesday'){
             d = Date.valueOf(opp) + i + 1;
              break;
         }else if(i == 6 && DayOfWeek == 'Thursday'){
             d = Date.valueOf(opp) + i + 1;
              break;
         }else if(i == 5 && DayOfWeek == 'Friday'){
                 break;
             }else if(DayOfWeek == 'Saturday' && DayOfWeek == 'Saturday'){
                  d = Date.valueOf(opp) - i;
             System.debug('after if :' + dayOfweek);
             }
      
         }
          System.debug(d);
         return (d);
        }
    
    Public static void sendNotification(Opportunity oppEmail)
{
   Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
   Contact con = new Contact();
   con.Id = '0035g00000ZK2zSAAT';
   con.Email = 'gurunath.viki@gmail.com';
   message.setTargetObjectId(con.Id);
   //message.setSenderDisplayName('Company Support');
   //message.setReplyTo('no-reply@company.com');
   message.setUseSignature(false);
   message.setBccSender(false);
   message.setSaveAsActivity(false);
   EmailTemplate emailTemplate = [Select Id,Subject,Description,HtmlValue,DeveloperName,Body from EmailTemplate where name =: 'Opportunity Test'];
   //Get templete id for set the templete.

   message.setTemplateID(emailTemplate.Id);
   message.setWhatId(oppEmail.AccountId); //This is important for the merge fields in template to work
   message.toAddresses = new String[] {con.Email};

   Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};

   Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
 
 if (results[0].success)
 {
   System.debug('The email was sent successfully.');
 }
 else
 {
   System.debug('The email failed to send: ' +
   results[0].errors[0].message);
 }
}
}