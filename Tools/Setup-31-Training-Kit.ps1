$ErrorActionPreference="Stop"
$Root=Split-Path $PSScriptRoot -Parent
python "$Root\Tools\Training\validate_dataset.py" --dataset "$Root\Training\dataset" --taxonomy "$Root\Flutter\assets\training\scrap_taxonomy.json"
if ($LASTEXITCODE -ne 0) { throw "Training dataset validation failed." }
Write-Host "Pack 31 installed. Empty dataset is valid and ready."
