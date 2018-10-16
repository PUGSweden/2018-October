# This is a demo.. dont run!
break
Set-Location C:\GITHUB\Posh-SenseHat

# In bash
pinout

sudo WIRINGPI_CODES=1 ~/powershell/pwsh

# in powershell

import-module Microsoft.PowerShell.IoT

Get-Command -Module Microsoft.PowerShell.IoT


# GPIO
Clear-Host
Set-GpioPin -Id 1 -Value Low

Set-GpioPin -Id 1 -Value High

Set-GpioPin -Id 1 -Value Low

0..3 | ForEach-Object -Process { 
    Set-GpioPin -Id $_ -Value High
    Start-Sleep -Seconds 1
    Set-GpioPin -Id $_ -Value Low
}


# I2C

# Get all connected devices
i2cdetect -y 1

# Connect to device (IMU, compass)
$DeviceIDMagnetometer = '0x1C'
$Magnetometer = Get-I2CDevice -Id $DeviceIDMagnetometer -FriendlyName 'LSM9DS1Magnetometer'
$WhoAmI = '0x0F'
Get-I2CRegister -Device $Magnetometer -Register $WhoAmI
# Documentation states return value 00111101 byte, value 61

# Get current temp using SenseHat temp sensor
Import-Module -Name ./git/Posh-SenseHat/Sensors/HTS221_Humidity_Temperature
Get-CurrentTemperature


# Maths, maths and more maths
Set-Location C:\GITHUB\Posh-SenseHat
ise .\Sensors\HTS221_Humidity_Temperature\HTS221_Humidity_Temperature.psm1

# Sensehat.Matrix
Set-Location C:\GITHUB\Posh-SenseHat
ise .\LedMatrix\PowerShell\SenseHat.Matrix\SenseHat.Matrix.psm1

Import-Module -Name ./git/Posh-SenseHat/LedMatrix/PowerShell/SenseHat.Matrix

Write-SenseHatMatrix -Text "Its $(Get-CurrentTemperature)c here!"