@RestResource(urlMapping = '/LeadCreate/')
global class APIClass1 {
    
    @HTTPPost
    global static String dopost(){
        String fieldValue;
        String fieldName;
        String fName;
        String lName;
        String comp;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        System.debug('Param is:'+ req.params);
        System.debug('Param is:' + req.params);
        
        String arr = req.requestBody.toString();
        JSONParser parser = JSON.createParser(arr);
        
        While(parser.nextToken()!=null){
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT){
                parser.nextValue();
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                if(fieldName == 'First Name'){
                    fName = parser.getText();
                }
                else if(fieldName == 'Last Name'){
                    lName = parser.getText();
                }
                else if(fieldName == 'Company'){
                    comp = parser.getText();
                }
            }
        }
        Lead lc = new Lead(FirstName = fName,LastName = lName,Company = comp);
        insert lc;
        return lc.ID;
    }

}