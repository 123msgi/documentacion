Import-Module PSProcessa
Import-Module Pester 
#Conexión a la VirtualHost asignada a Bifrost
$ConnectionString= "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"
#RoutingKey que se desea consultar
$RoutingKey="Processa.RabbitMQ.Services.Bifrost.Contracts.CardHolderRequest:Processa.RabbitMQ.Services.Bifrost"
#Exchangue
$Exchangue="easy_net_q_rpc"



#Parametros enviados 
$Body = @{
    "DocType"= "CC"
    "DocNumber"="79538294"
    "CorrelationalId"=(New-Guid).ToString()

}


$Response=Invoke-RabbitRequest -ConnectionString $ConnectionString  -Queue $RoutingKey -Exchange $Exchangue -Body $Body -Timeout (New-TimeSpan -Seconds 10)

#$result= $Response.CardHolders | ConvertTo-Json

Describe 'Consumo de la ruting'{
     It 'Code' {            
            $Response.ResponseCode| Should Be 200
        }
     It 'Message' {            
            $Response.ResponseMessage | Should Be 'OK'
        }
     It 'Body' {  
                    
            $Response.CardHolders 
        }
        
}
 

$resultado=  $Response.CardHolders 


if ($resultado -ne $null) {
  write-host("Name: ") $Response.CardHolders.CardLabel
  write-host("TypeDoc: ")$Response.CardHolders.DocType
  write-host("Doc")$Response.CardHolders.DocNumber
  write-host("PersonId:")$Response.CardHolders.PersonId
}else{
   write-host("Verifique la peticion, revise el cuerpo de la petición.")
}