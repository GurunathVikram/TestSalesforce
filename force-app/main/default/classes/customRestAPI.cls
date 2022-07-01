@RestResource(urlMapping = '/samplecase/*')
global with Sharing class customRestAPI {

/*    
    @HTTPGet
    Global static Contact conid(){
        RestRequest Req = RestContext.request;
        String conid = Req.requestURI.substring(Req.requestURI.lastIndexOf('/')+1);
        Contact con = [SELECT id,FirstName,LastName FROM Contact where id =: conid];
        return con;      
    }
    */
    @HTTPPost
    Global static id contactinsert( String  casefirstname , String caselastname){
        Contact css = new Contact(
            FirstName = casefirstname,
            LastName = caselastname
        );
        
        insert css;
        return css.Id;
    }
}