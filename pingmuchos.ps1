 
#### Provide the computer name in $computername variable 
 
$ServerName = Get-Content "c:\Users\clara1\Desktop\hosts.txt"
 
##### Script Starts Here ######  
 
foreach ($Server in $ServerName) { 
 
        if (test-Connection -ComputerName $Server -Count 2 -Quiet ) {  
         
            write-Host "$Server is alive and Pinging " -ForegroundColor Green 
         
                    } else 
                     
                    { Write-Warning "$Server seems dead not pinging" 
             
                    }     
         
} 
 
 
########## end of script #######################