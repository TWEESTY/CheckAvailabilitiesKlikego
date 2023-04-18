param(
     [Parameter(Mandatory)]
     [string]$BourseEchangeCourseUrl,
     [Parameter(Mandatory)]
     [string]$NomEpreuve,
     [Parameter()]
     [int]$DureeEnSecondsEntreChaqueRecuperation = 120
 )


function Show-Notification {
    param (
        [string[]]$Title,
        [string[]]$Message
    )
    
    $balloon = New-Object System.Windows.Forms.NotifyIcon
    $path = (Get-Process -id $pid).Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
    $balloon.BalloonTipText = $Message
    $balloon.BalloonTipTitle = $Title
    $balloon.Visible = $true
    $balloon.ShowBalloonTip(10000)
}

Add-Type -AssemblyName System.Windows.Forms

$PSDefaultParameterValues['*:Encoding'] = 'utf8'

$dossardFoundMessage = "Un dossard a été trouvé."
$dossardNotFoundMessage = "Aucun dossard correspondant à votre course n'a été trouvé."

do{
    try{
        Write-Host "Récupération de la liste des dossards de la bourse..." 
        $response = Invoke-WebRequest $BourseEchangeCourseUrl

        if(-not $response -or -not $response.Content){
            Write-Host $dossardNotFoundMessage -ForegroundColor Yellow
            continue
        }

        if($response.Content -like "*Pas de chance*"){
            Write-Host $dossardNotFoundMessage -ForegroundColor Yellow
            continue
        }

        if($response.Content -like "*$NomEpreuve*"){
            Write-Host $dossardFoundMessage -ForegroundColor Green
            Show-Notification -Message $dossardFoundMessage -Title "GO!"
        }
        else{
            Write-Host $dossardNotFoundMessage -ForegroundColor Yellow
            continue
        }
    }
    catch{
        Write-Host "Une erreur est survenue." -ForegroundColor Red
        Write-Host $_ -ForegroundColor Red
    }
    finally{
        Write-Host "Réessai dans $DureeEnSecondsEntreChaqueRecuperation secondes..."
        Start-Sleep -Seconds $DureeEnSecondsEntreChaqueRecuperation
    }
}while($true)
 
