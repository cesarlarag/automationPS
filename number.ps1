function DisplayNumber ()
{
    Write-Host "please enter a number"
	$num = Read-Host
    Write-Host "your number is " $num
    $rand= Get-Random -Minimum 0 -Maximum $num 
    Write-Host "random number is " $rand
}

function prompt(){
$usr =$env:username
$mach = $env:COMPUTERNAME

$(if (test-path variable:/PSDebugContext) { '[DBG]: ' } else { '' }) + $(Get-Location) +
$(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '

}

function prompt1 {
$usr =$env:username
$mach = $env:COMPUTERNAME
$($usr) +'\' $($mach) + '\> '
}


function prompt(){
$usr =$env:username
$mach = $env:COMPUTERNAME

$(if (test-path variable:/PSDebugContext) { '[DBG]: ' } else { '' })+ $($mach) +'\'+ $($usr) + ' ' + $(Get-Location) +
$(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '

}
