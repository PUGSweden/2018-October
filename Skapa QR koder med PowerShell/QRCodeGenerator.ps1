# Find Module
Find-Module QRCodeGenerator

# Install-Module
Install-Module QRCodeGenerator

# Import-Module
Import-Module QRCodeGenerator

# Get CMDLETs from QRCodeGenerator Module
Get-Command -Module QRCodeGenerator

# WiFi Access
New-QRCodeWifiAccess -SSID "Mitt WiFi" -Password "MittLösenord2018!" -Show

# VCard
New-QRCodeVCard -FirstName "Fredrik" -LastName "Wall" -Company "Retune AB" -Email "fredrik@poweradmin.se" -Show

# Geo Location
New-QRCodeGeolocation -Latitude "59.4074629" -Longitude "17.9443056" -Show
