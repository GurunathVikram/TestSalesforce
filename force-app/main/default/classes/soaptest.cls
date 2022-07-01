public class soaptest {
    @future(callout=true)
    public static void soapdemo(){    
     amsservice.AuthenticationHeader header =new amsservice.AuthenticationHeader();
        header.Account='gemdata';
        header.Username='';
        header.Password='';
        header.Onlinecode='PRIMETEST';


        amsservice.clientInsertMap   ClientImportRecord = new amsservice.clientInsertMap();
        ClientImportRecord.Guid='42ef3a29-e076-467e-ae64-asd55e85d27bc';
        ClientImportRecord.ClientName='MAMS';
        ClientImportRecord.Addr1='Ma Cha';
        ClientImportRecord.City='AAADD';
        ClientImportRecord.StateProvCd='IL';
        ClientImportRecord.Phone1Number=1234567890;
        ClientImportRecord.Phone1ExtensionNumber=2345;

                amsservice.TransporterSoap soapRequest=new amsservice.TransporterSoap();
                   soapRequest.AuthenticationHeader=header;

                   amsservice.Results result=new amsservice.Results();
                        result=soapRequest.clientInsert(ClientImportRecord);
                    System.debug(result.SagittaCode);
        
    }
}