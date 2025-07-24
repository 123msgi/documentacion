Import-Module -Name PSProcessa
Import-Module Pester 
$ConnectionString = "host=192.168.60.218;virtualHost=Compensar;username=Compensar;password=Compensar"
$RoutingKey = "Processa.RabbitMQ.Services.Bc.Contracts.Commands.CustomerCreditsRequest:Processa.RabbitMQ.Services.Bc.Contracts"
$Exchange = "easy_net_q_rpc"
$Body = @{
  DatosBasicos = @{
    NumPet = "1"
    Aplicacion = "CAJASAP"
    PtoIPSer = 4567
    SecRev = ""
    DirIPDes = "128.0.0.1"
    DirIPSer = "129.0.0.1"
    Canal = "33"
    SecOri = "64d6be770d7b41ada32cfb8c99860"
    TipHor = "0"
    CodEntOri = "91"
    PtoIPDes = "1234"
    CodTra = "X06"
    CodCau = "00"
    MaqDes = "otra"
    HorTraOri = "15:50:00"
    DirIPOri = "127.0.0.1"
    MaqOri = "ninguna"
    FecTraOri = "2019-07-23"
    CodUsu = "CAJASAP"
    CodSub = "00"
    TipOpe = "0"
  }
  DatosEntrada = @{
    Id = (
      @{
        NumIdeInfCre = "1024470771"
        TipIdeInfCre = "1"
      },
      @{
        NumIdeInfCre = "51777145"
        TipIdeInfCre = "1"
      },
      @{
        NumIdeInfCre = "79100200"
        TipIdeInfCre = "1"
      },
      @{
        NumIdeInfCre = "79100200"
        TipIdeInfCre = "1"
      }
    )
  }
}

$Response=Invoke-RabbitRequest -ConnectionString $ConnectionString -Body $Body -Queue $RoutingKey -Exchange $Exchange -Timeout (New-TimeSpan -Seconds 10) 
$Response | fl


Describe 'Consumo de la ruting'{
     It 'RespuestaAdicional' {            
            $Response.RespuestaAdicional
        }
     It 'RespuestaBasica' {            
            $Response.RespuestaBasica
                   }
        
}

$resultadoRB=  $Response.RespuestaBasica 
$resultadoRA=  $Response.RespuestaAdicional 


if ($resultadoRB -ne $null -and $resultadoRA -ne $null  ) {

  write-host("Nombre del cliente: ") $Response.RespuestaAdicional.Cliente.NomCliRsp
  write-host("Id del cliente: ")$Response.RespuestaAdicional.Cliente.NumIdeRsp
  write-host("Mensaje de la transacción: ") $Response.RespuestaBasica.MsjErr
  write-host("Fecha del proceso: ")$Response.RespuestaBasica.FecPro
  write-host("Titulo de la persona ") $Response.RespuestaAdicional.Cliente.Registro.TipRelRsp
  
  
  
  
}else{
   write-host("Verifique la peticion, revise el cuerpo de la petición.")
}