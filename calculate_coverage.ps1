$lf = 0
$lh = 0
Get-Content coverage\lcov.info | ForEach-Object {
    if ($_ -match '^LF:(\d+)') {
        $lf += [int]$matches[1]
    }
    elseif ($_ -match '^LH:(\d+)') {
        $lh += [int]$matches[1]
    }
}
Write-Host "Total Lines Found: $lf"
Write-Host "Total Lines Hit: $lh"
if ($lf -gt 0) {
    $coverage = ($lh / $lf) * 100
    Write-Host "Coverage: $([math]::Round($coverage, 2))%"
}
