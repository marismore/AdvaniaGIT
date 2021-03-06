﻿function Create-SetupParameters
{
    param (
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyname=$true)]
        [String]$InstanceVersion
    )

    $InstanceSetupParameters = New-Object -TypeName PSObject
    $InstanceSetupParameters | Add-Member -MemberType NoteProperty -Name navVersion -Value $InstanceVersion
    $InstanceSetupParameters | Add-Member -MemberType NoteProperty -Name mainVersion -Value (($InstanceSetupParameters.navVersion).Split('.').GetValue(0) + ($InstanceSetupParameters.navVersion).Split('.').GetValue(1))
    $InstanceSetupParameters | Add-Member -MemberType NoteProperty -Name navServicePath -Value (Get-NAVServicePath -SetupParameters $InstanceSetupParameters)
    Return $InstanceSetupParameters
}
