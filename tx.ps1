param([string]$Action="Push")

if (!$env:APPVEYOR) {
    Write-Error "Script not running in AppVeyor... Exiting!"
    exit
}


function Tx-Init {
Write-Host "Setup TX"
@"
[https://www.transifex.com]
api_hostname = https://api.transifex.com
hostname = https://www.transifex.com
password = $env:TX_TOKEN
username = api
"@ -f 'string' | Out-File "$HOME/.transifexrc" -Encoding ASCII
}

function Tx-Push {
    Write-Host "Running Tx-Push for branch $env:APPVEYOR_REPO_BRANCH"
    
    Tx-Init
    
    if($env:APPVEYOR_REPO_BRANCH -like 'master') {
        tx push --source --no-interactive 
    } else {
        tx push --source --no-interactive --branch "$env:APPVEYOR_REPO_BRANCH"
    }
}

function Tx-Pull {
    Write-Host "Running Tx-Pull for branch $env:APPVEYOR_REPO_BRANCH"
   
    Tx-Init

    if ($env:APPVEYOR_REPO_BRANCH -like 'master') {
        tx pull --all --force
    } else {
        tx pull --all --force --branch "$env:APPVEYOR_REPO_BRANCH"
    }
    
    $NEW_TRANSLATIONS = $(git diff-index --name-only HEAD --)

    if ($NEW_TRANSLATIONS -and $env:TX_COMMIT_TRANSLATIONS) {    
        # Enable credential store
        git config --global credential.helper store

        # Set access token in .git-credentials
        Set-Content -Path "$HOME\.git-credentials" -Value "https://$($env:ACCESS_TOKEN):x-oauth-basic@github.com`n" -NoNewline

        # Set git email and name
        git config --global user.email "transifex+bot@example.com"
        git config --global user.name "Transifex Bot (AppVeyor)"

        # Commit translation files
        git checkout -b $env:APPVEYOR_REPO_BRANCH
        git add locales/*.json
        git commit -m "Translation update from Transifex" -m "[ci skip]"
    }

}

&"Tx-$Action"