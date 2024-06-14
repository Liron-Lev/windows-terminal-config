Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -Colors @{Prediction="`e[90m"}
Set-Theme Paradox

function cdg {
    Push-Location E:\git
}

function gitsu {
    git submodule update --init --recursive
}

function wsliron {
	wsl --login liron
}

function Set-PowerState {
    [CmdletBinding()]
    param (
          [System.Windows.Forms.PowerState] $PowerState = [System.Windows.Forms.PowerState]::Suspend
        , [switch] $DisableWake
        , [switch] $Force
    )

    begin {
        Write-Verbose -Message 'Executing Begin block';

        if (!$DisableWake) { $DisableWake = $false; };
        if (!$Force) { $Force = $false; };

        Write-Verbose -Message ('Force is: {0}' -f $Force);
        Write-Verbose -Message ('DisableWake is: {0}' -f $DisableWake);
    }

    process {
        Write-Verbose -Message 'Executing Process block';
        try {
            $Result = [System.Windows.Forms.Application]::SetSuspendState($PowerState, $Force, $DisableWake);
        }
        catch {
            Write-Error -Exception $_;
        }
    }

    end {
        Write-Verbose -Message 'Executing End block';
    }
}

function bash {
    & "$env:ProgramFiles\Git\bin\bash.exe" --login -i -l
}