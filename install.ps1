Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
winget install JanDeDobbeleer.OhMyPosh -s winget
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Push-Location .
cd "$env:LOCALAPPDATA\Programs\oh-my-posh\bin"
oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH/paradox.omp.json" | Invoke-Expression
Pop-Location