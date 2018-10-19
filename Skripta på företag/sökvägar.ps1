# Sökvägar till där skriptet körs bör vara dynamiska.
#
# Men lite beroende på hur man kör skript, editor/vilken editor eller inte så funkar det ibland lite olika.
# Jag använder ofta denna funktion ifrån Sapien.
# Den funkar klockrent i alla editorer och utan editor.

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

$ScriptDirectory