# This script scans the current directory for folders starting with a date (YYYY-MM-DD)
# and updates folders.json with folder names and a random thumbnail if found

$folders = Get-ChildItem -Directory | Where-Object { $_.Name -match "^\d{4}-\d{2}-\d{2}" }
$results = foreach ($f in $folders) {
    $thumb = ""
    $indexPath = Join-Path $f.FullName "index.html"
    
    # Try 1: Extract from index.html __META__
    if (Test-Path $indexPath) {
        $content = Get-Content $indexPath -Raw
        # Improved regex to handle different spacing and single/double quotes
        if ($content -match '"thumbnail"\s*:\s*"([^"]+)"') {
            $thumb = $Matches[1]
        }
    }
    
    # Try 2: If no thumb in JS, look for any image in images folder
    if (-not $thumb) {
        $imagesDir = Join-Path $f.FullName "images"
        if (Test-Path $imagesDir) {
            $randomImg = Get-ChildItem -Path $imagesDir -Filter *.jpg -Recurse -File | Get-Random
            if ($randomImg) {
                # Make it relative to the folder
                $thumb = $randomImg.FullName.Replace($f.FullName + "\", "").Replace("\", "/")
            }
        }
    }

    [PSCustomObject]@{
        name = $f.Name
        thumbnail = $thumb
    }
}

$results | ConvertTo-Json | Out-File -FilePath "folders.json" -Encoding utf8
Write-Host "Successfully updated folders.json with $($results.Count) folders and thumbnails." -ForegroundColor Green
