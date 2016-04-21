
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null


function DisplayNumber ()
{
	$objForm = New-Object System.Windows.Forms.Form 
	$objForm.Text = "Let's play"
	$objForm.Size = New-Object System.Drawing.Size(300,200) 
	$objForm.StartPosition = "CenterScreen"

	$objForm.KeyPreview = $True
	$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
	    {$num=$objTextBox.Text;$objForm.Close()}})
#	$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
#	    {$objForm.Close()}})

	$OKButton = New-Object System.Windows.Forms.Button
	$OKButton.Location = New-Object System.Drawing.Size(75,120)
	$OKButton.Size = New-Object System.Drawing.Size(75,23)
	$OKButton.Text = "OK"
	$OKButton.add_Click({$num=$objTextBox.Text;$objForm.Close()})
	$objForm.Controls.Add($OKButton)

#	$CancelButton = New-Object System.Windows.Forms.Button
#	$CancelButton.Location = New-Object System.Drawing.Size(150,120)
#	$CancelButton.Size = New-Object System.Drawing.Size(75,23)
#	$CancelButton.Text = "Quit"
#	$CancelButton.Add_Click({$objForm.Close();})
#	$objForm.Controls.Add($CancelButton)

	$objLabel = New-Object System.Windows.Forms.Label
	$objLabel.Location = New-Object System.Drawing.Size(10,20) 
	$objLabel.Size = New-Object System.Drawing.Size(280,20) 
	$objLabel.Text = "Please enter a number in the space below:"
	$objForm.Controls.Add($objLabel) 

	$objTextBox = New-Object System.Windows.Forms.TextBox 
	$objTextBox.Location = New-Object System.Drawing.Size(10,40) 
	$objTextBox.Size = New-Object System.Drawing.Size(260,20) 
	$objForm.Controls.Add($objTextBox) 

	$objForm.Topmost = $True

	$objForm.Add_Shown({$objForm.Activate();$objTextBox.Focus()})
	[void] $objForm.ShowDialog()
	
	


    # Write-Host "please enter a number"
	# InputBox 
	# $num = $x
    Write-Host "your number is " $num
    $rand= Get-Random -Minimum 0 -Maximum 100 
    Write-Host "random number is " $rand
	
	if( $num -gt $rand)
	{
 		Write-Host "you win"
		$msgWIn = [System.Windows.Forms.MessageBox]::Show("You win!! your number is $num `n my number is $rand" , "Winner" , 0)
		PlayAgain

	}
	else {
	
		Write-Host "I win"
		$msgWIn = [System.Windows.Forms.MessageBox]::Show("I win!! my number is $rand `n your number is $num" , "Winner" , 0)
		PlayAgain
	}

}

function PlayAgain()
{
	$OUTPUT= [System.Windows.Forms.MessageBox]::Show("wanna play again?" , "Game" , 4)

	if ($OUTPUT -eq "YES" ) 
	{

		DisplayNumber

	} 
	else 
	{ 
		break
	}
}

DisplayNumber 

