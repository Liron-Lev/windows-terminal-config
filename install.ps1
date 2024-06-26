Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
winget install JanDeDobbeleer.OhMyPosh -s winget
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Push-Location .
cd "$env:LOCALAPPDATA\Programs\oh-my-posh\bin"
oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH/paradox.omp.json" | Invoke-Expression
Pop-Location

New-Item "$env:HOMEPATH\Documents\PowerShell\" -ItemType Directory -ea 0
Copy-Item ./Microsoft.PowerShell_profile.ps1 "$env:HOMEPATH\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

Copy-Item "settings.json" $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
Copy-Item "images" $env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\ -Recurse
