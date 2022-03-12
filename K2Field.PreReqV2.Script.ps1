# Script:	K2Field.PreReqV2.Script.ps1
# Author: 	Mikhail Rodionov, based on K2Field.PreReq.Script.ps1 by Tim Hüttemeister - https://github.com/timmes/K2Field.PreReq
# Website: 	http://www.mikerodionov.com
# Purpose: 	Check if all K2 prerequisites are installed & install and configure the basic K2 prerequisites properly
# Version:  0.1
# Date:     12-03-2022

#
# Module needed to install Windows roles & features
#
Import-Module ServerManager

#
# Required Features lists
#

$features2012R2 = @(
    'Web-Default-Doc',
    'Web-Http-Errors',
    'Web-Http-Redirect',
    'Web-Static-Content',
    'Web-Dyn-Compression',
    'Web-Static-Content',
    'Web-Url-Auth',
    'Web-Windows-Auth',
    'Web-Net-Ext',
    'Web-Net-Ext45',
    'Web-AppInit',
    'Web-ISAPI-Ext',
    'Web-ISAPI-Filter',
    'Web-ASP',
    'Web-Asp-Net',
    'Web-Asp-Net45',
    'Web-Mgmt-Console',
    'Web-Mgmt-Service',
    'NET-HTTP-Activation',
    'NET-Framework-45-Core',
    'NET-Framework-45-ASPNET',
    'NET-WCF-Services45',
    'NET-WCF-HTTP-Activation45',
    'WAS-NET-Environment',
    'WAS-Config-APIs',
    'WAS-Process-Model'
)
# To be updated after testing
$features2012 = @(
    'Web-Default-Doc',
    'Web-Http-Errors',
    'Web-Http-Redirect',
    'Web-Static-Content',
    'Web-Dyn-Compression',
    'Web-Static-Content',
    'Web-Url-Auth',
    'Web-Windows-Auth',
    'Web-Net-Ext',
    'Web-Net-Ext45',
    'Web-AppInit',
    'Web-ISAPI-Ext',
    'Web-ISAPI-Filter',
    'Web-ASP',
    'Web-Asp-Net',
    'Web-Asp-Net45',
    'Web-Mgmt-Console',
    'Web-Mgmt-Service',
    'NET-HTTP-Activation',
    'NET-Framework-45-Core',
    'NET-Framework-45-ASPNET',
    'NET-WCF-Services45',
    'NET-WCF-HTTP-Activation45',
    'WAS-NET-Environment',
    'WAS-Config-APIs',
    'WAS-Process-Model'
)

#
# K2 logo ASCII art & intro message
#
Function Intro {
$logo = @"
       ++++++                       
++++++ ++++++  +; +'  ;+++,,              
++++++ ++++++  +;+'   ;  ;+              
++++++ ++++++  +++      +.             
++++++         +;+'    +,          
       ++++++  +; +;  +',,           
++++++ ++++++  +;  + :+++++
++++++ ++++++ 
++++++ ++++++  
++++++               
"@

Write-Host $logo -ForegroundColor DarkGreen
Write-Host "`n Welcome to the basic (unofficial) K2 prerequisite installer!" -ForegroundColor DarkGreen -BackgroundColor White
}

#
# Confirmation message
#
Function Config {
    $title = "K2 Prerequisites Configuration"
    $message = "Are you installing K2 Five or K2 Legacy (4.7)?"
    $five = New-Object System.Management.Automation.Host.ChoiceDescription "&Five", "Select for K2 Five installation."
    $legacy = New-Object System.Management.Automation.Host.ChoiceDescription "&Legacy", "Select for K2 4.7 installation."
 
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($Five, $Legacy)
    $result = $host.ui.PromptForChoice($title, $message, $options, 0)

    if ([System.Environment]::OSVersion.Version.Major -ge 6.3) {$global:features = $features2012R2}
    IF ([System.Environment]::OSVersion.Version.Major -lt 6.3) {$global:features = $features2012}

    switch ($result)
    {
        0{ $global:features = $features2012R2}
        1{ $global:features = $features2012R2 += ('MSMQ-Services','MSMQ-Directory') }
    }
}

#
# Confirmation message
#
Function Confirmation {
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Runs the script."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Stops the script."
    $checkPrereqisites = New-Object System.Management.Automation.Host.ChoiceDescription "&CheckFeatures", "Checks if all K2 prerequisites are installed."

    $title = "K2 Prerequisites"
    $message = "Do you want to install the basic K2 prerequisites?"

    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Runs the script."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Stops the script."
    $checkPrereqisites = New-Object System.Management.Automation.Host.ChoiceDescription "&CheckFeatures", "Checks if all K2 prerequisites are installed."

    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no, $checkPrereqisites)
    $result = $host.ui.PromptForChoice($title, $message, $options, 0) 

    switch ($result)
    {
        0{ InstallAndConfigurePrereqs }
        1{ Write-Host "You manually aborted the script. No changes will be made." -ForegroundColor Yellow }
        2{ CheckPrerequisites }
    }
}

#
# Check all prerequisites
#
Function CheckPrerequisites {    
    ForEach ($item In $global:features)
    {
        $windowsFeature=Get-WindowsFeature | Where-Object {$_.Name -eq $item}
        If($windowsFeature.Installed -ne "True")
        {
            Write-Host "Feature $item IS NOT installed." -ForegroundColor Red
            $missingFeaturesList.Add($item)
        }
        Else
        {
            Write-Host "Feature $item is installed." -ForegroundColor Green
        }
    }

    # Get user input for next steps
    If($missingFeaturesList.Count -gt 0)
    {
        $title = "Missing K2 Prerequisites"
        $message = "Do you directly want to install the missing K2 prerequisites?"

        $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Installs the missing prerequisites."
        $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Stops the script."

        $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
        $result = $host.ui.PromptForChoice($title, $message, $options, 0) 

        switch ($result)
        {
            0{ InstallAndConfigurePrereqs $true }
            1{ Write-Host "You manually aborted the script. No changes will be made." -ForegroundColor Yellow }
        }
    }
}

#
# Installation & configuration of the Windows roles & features
#
Function InstallAndConfigurePrereqs([bool]$installMissing = $false)
{
    Write-Host "Installing & configuring Windows roles & features. This can take some minutes..." -ForegroundColor Yellow
    If($installMissing -ne "True")
    {
        ForEach ($item In $features)
        {
            # Output feature category
            IF ($item.FeatureCategory -ne $lastFeatureCategory)
            {
                Write-Host "Feature category: $($item.FeatureCategory)" -ForegroundColor Yellow
                $lastFeatureCategory = $item.FeatureCategory
            }
            Add-WindowsFeature $item
        }
    }
    Else
    {
        ForEach ($feature in $missingFeaturesList)
        {
            Add-WindowsFeature $feature
        }
    }

    Write-Host "Windows roles & features changes completed." -ForegroundColor Green
    Write-Host "Basic K2 prerequisite installation & configuration finished. Please check manually to confirm the changes." -ForegroundColor Green
}

# Script execution starts here
$features = New-Object System.Collections.Generic.List[System.Object]
$missingFeaturesList = New-Object System.Collections.Generic.List[System.Object]

# Show intro screen and get user input
Intro
Config
Confirmation