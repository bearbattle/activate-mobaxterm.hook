if (-Not $packageScript) {
    Write-Host "Skipping activation as there is no install script for this package"
    return
}

[string]$pyVersion
try {
    $pyVersion = (py -3 --version)
    if (!$pyversion.StartsWith("Python 3")) {
        throw "Python version not match."
    }    
}
catch {
    "Python 3 is required to run this hook"
    return -1
}

$pp = Get-PackageParameters
if (!$pp['UserName']) { $pp['UserName'] = $Env:UserName }

[string]$mobaVersion
[string]$mobaInstLocation
try {
    $mobaVersion = (choco list -r -e mobaxterm).Split('|')[1]
    $mobaLog = "$env:TEMP\$packageName.$mobaVersion.MsiInstall.log"
    $matchResult = Get-Content $mobaLog | Select-String -Pattern "MobaXtermFolder = (.*)"
    $mobaInstLocation = $matchResult.Matches[0].Groups[1].Value
}
catch {
    $_
    "Cannot find MobaXterm version info"
    return -2
}

if (Test-ProcessAdminRights) {
    $mobaLiscense = Join-Path $mobaInstLocation -ChildPath 'Custom.mxtpro'
    if ((Test-Path $mobaLiscense -PathType Leaf)) {
        "!!! Already Have Liscense !!!"
        return
    }
    $hookDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $hookScript = Join-Path $hookDir -ChildPath 'MobaXterm-keygen.py'
    # Generate Liscense File
    py -3 "$hookScript" $pp['UserName'] $mobaVersion
    # Copy File to installation directory
    Move-Item -Path "./Custom.mxtpro" -Destination $mobaInstLocation
    "!!! Successfully Installed Liscense !!!"
}

