Import-module PSProcessa 
Import-Module Pester 
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.BalanceRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"
#$From = @{AccountType='80'}


$Body = @{
   DocType="CC"
   DocNumber="63366591"
   CorrelationalId=(New-Guid).ToString()
   #channel= "COMPMOV60A6GLOB8L013"
   #Amount=28000
   #AccountType=80
   #From=$From
}


$Response=Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)



Describe 'Consumo de la ruting'{
     It 'Code' {            
            $Response.ResponseCode| Should Be 200
        }
     It 'Message' {            
            $Response.ResponseMessage | Should Be 'OK'
        }
     It 'Body' {  
                    
            $Response.Accounts
        }
        
}

$resultado=  $Response.Accounts 


if ($resultado -ne $null) {
  write-host("El cliente tiene estos bolsillos: ") $Response.Accounts.AccountTypeName
  write-host("El monto de cada tarjeta es: ")$Response.Accounts.AccountBalance
  write-host("Tipo bolsillos: ") $Response.Accounts.AccountTypeId
  write-host("Id de las tarjetas: ")$Response.Accounts.CardId
  write-host("Numero de las tarjetas: ")$Response.Accounts.AccountNumber
  
  
}else{
   write-host("Verifique la peticion, revise el cuerpo de la petición.")
}