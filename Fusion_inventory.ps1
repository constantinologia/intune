#----------- DOUTOR PC
#-----------
#----------- O que este script faz:
#----------- 1 - Instala o FusionInventory no computador silenciosamente
#----------- 
#----------- Criado em 04/07/2020
#----------- Modificado em 12/11/2021

$workdir = "c:\installer\fusion"

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir -ItemType directory }

#----------- ARQUIVO VBS -----------

$source = "http://amaremansa.com.br/intune/fusioninventory-agent-deployment.vbs" 
$destination = "$workdir\fusioninventory-agent-deployment.vbs"

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

#----------- INSTALADOR X64 BITS -----------

$source2 = "http://amaremansa.com.br/intune/fusioninventory-agent_windows-x64_2.6%20(1).exe"
$destination2 = "$workdir\fusioninventory-agent_windows-x64_2.6.exe"

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source2 -OutFile $destination2
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source2, $destination2)
}

#----------- INSTALADOR X32 BITS -----------

$source3 = "http://amaremansa.com.br/intune/fusioninventory-agent_windows-x86_2.6%20(1).exe"
$destination3 = "$workdir\fusioninventory-agent_windows-x86_2.6.exe"

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source3 -OutFile $destination3
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source3, $destination3)
}

#----------- EXECUÇÃO DO SCRIPT -----------

cscript $workdir\fusioninventory-agent-deployment.vbs

Start-Sleep -s 35