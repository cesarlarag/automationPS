$application = New-Object -comobject word.application
#$application.visible = $false
$document = $application.documents.open("C:\temp\testdoc.docx")
$selection = $application.Selection
$words = "Intel Confidential"
$matchCase = $false
$matchWholeWord = $true
$matchWildCards = $false
$matchSoundsLike = $false
$matchAllWordForms = $false
$forward = $true
$wrap = 1
$format = $true
$replace = 2
$RO = $true
$Name = $document.FullName
$isThere = $false

Foreach ($word in $words)
 {
 $findText = $word
 #$replaceWith = $word
 #$selection.find.replacement.font.italic = $true
 $exeRTN = $selection.find.execute($findText,$matchCase,
 $matchWholeWord,$matchWIldCards,$matchSoundsLike,
 $matchAllWordForms,$forward,$wrap,$format,$RO)#,$replaceWith,$replace)
 if ($exeRTN){
 
 		$isThere = $true
 	} 
 }	

$document.close()
$application.quit()
$application = $null
[gc]::collect()
[gc]::WaitForPendingFinalizers()
 
 
 if ($isThere){
 
 echo "the phrase $word was found in $Name" 
 
 } else {
 
 echo "nothing found on $Name"
 
 }
 
 
# $application = New-Object -comobject word.application
#$application.visible = $false
#$words = Get-Content C:\fso1\words.txt
#$docs = Get-ChildItem -Path c:\fso1 -Include *.doc,*.docx -Recurse
#Foreach ($doc in $docs)
#{
# $document = $application.documents.open($doc.FullName)
# $selection = $application.Selection
# $matchCase = $false
# $matchWholeWord = $true
# $matchWildCards = $false
# $matchSoundsLike = $false
# $matchAllWordForms = $false
# $forward = $true
# $wrap = 1
# $format = $true
# $replace = 2
# Foreach ($word in $words)
# {
#  $findText = $word
#  $replaceWith = $word
#  $selection.find.replacement.font.italic = $true
#  $exeRTN = $selection.find.execute($findText,$matchCase,
#  $matchWholeWord,$matchWIldCards,$matchSoundsLike,
#  $matchAllWordForms,$forward,$wrap,$format,$replaceWith,
#  $replace)
#  } #end foreach word
# $document.save()
# $document.close()
#} #end foreach doc
#$application.quit()
#$application = $null
#[gc]::collect()
#[gc]::WaitForPendingFinalizers()
 
 
 