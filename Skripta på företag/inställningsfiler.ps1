function Get-ScriptDirectory
{
	if ($hostinvocation -ne $null)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

# XML fil
$myFile = "$($ScriptDirectory)\settings.xml"
$xml = New-Object -TypeName XML
$xml.Load($myFile)
$Xml.Settings.Setting 

# PSD1
Import-LocalizedData -BaseDirectory $ScriptDirectory -FileName "settings.psd1" -BindingVariable mySettings 
$mySettings 
 
