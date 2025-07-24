Import-Module -Name PSProcessa
$ConnectionString = "host=192.168.60.218;username=Compensar;password=Compensar;virtualhost=Compensar"

$RoutingKey = "Processa.RabbitMQ.Services.Bifrost.Contracts.ActivationCardRequest:Processa.RabbitMQ.Services.Bifrost"
$Exchange = "easy_net_q_rpc"

$Body = @{
   CorrelationalId=(New-Guid).ToString()
   DocType="1"
   DocNumber="51777145"
   LastFourCardDigits="4476"
   Pin="GPePnglfVK/6hufl/XlqFYanRZfkpi4x+x+/SRM6aGplLsIRHW5JVZapoa/sCBLyx+NqrecB6BC1H0kiRwlIYPiTyFdMT//VGZALWzuLZW7Szv2oDBOPae98vgRcMjNGMScjTj1anoC9ehfDqsXmXEDlH0cFjVKluc1QF+dv4NP7eB7lecCNEmP0LmBXjho/ynmZRqd0/siQebLtUBDJqGGwRmuyT+PR/4umDXd43dkk28ssq7fNzNmVdDLENMWS/UIsQMiPjIU228wnC5PJEvAqNn8QoT65e09Yl8kodFNBNckq+tdAqkOG1OztMjScMftzXeL23Byu8VJ/z/LsQw=="
   VerificationCode="012608"
   Channel="COMPCN2SISSOIL27AJR8"
   CustomerCode="cmpcpf"
}

$Response=Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10)
#$Response |fl


Describe 'Consumo de la ruting'{
     It 'Code' {            
            $Response.ResponseCode| Should Be 200
        }
     It 'Message' {            
            $Response.ResponseMessage 
        }        
}

$resultado=  $Response.ResponseCode 


if ($resultado -eq 200  ) {
  write-host("Dato transaccional: ") $Response.Date
  write-host("Codigo de respuesta: ")$Response.ResponseCode
  write-host("Mensaje de respuesta: ") $Response.ResponseMessage
  write-host("Numero de las tarjetas: ")$Response.Accounts.AccountNumber
  
  
}else{
   write-host("Verifique la peticion, revise el cuerpo de la petición.")
   write-host("Mensaje de respuesta: ")$Response.ResponseMessage
}
