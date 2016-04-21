function DisplayNumber ()
{
    Write-Host "please enter a number"
	$num = Read-Host
    Write-Host "your number is " $num
    $rand= Get-Random -Minimum 0 -Maximum $num 
    Write-Host "random number is " $rand
}


DisplayNumber 
if( $num -gt $ran)
{
 Write-Host "I win"

}
else {
Write-Host "you win"

}