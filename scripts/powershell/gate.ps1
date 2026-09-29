# wap-harness gate — config-driven sensor runner (PowerShell).
#
# Reads harness.config.yml, runs the four sensors in order, prints a table,
# and exits 0 if all pass or 1 if any fail. Pass/fail is decided SOLELY by
# each sensor's exit code. Coverage % is read for display only, never fatal.

$ErrorActionPreference = "Stop"
$Config = if ($env:HARNESS_CONFIG) { $env:HARNESS_CONFIG } else { "harness.config.yml" }

if (-not (Test-Path $Config)) {
    Write-Error "harness: config não encontrado: $Config`nrode /harness-setup para criá-lo."
    exit 2
}

# --- minimal YAML reader for this file's fixed shape ---
function Get-Cfg([string]$key) {
    $line = Select-String -Path $Config -Pattern "^\s*$key\s*:\s*(.+)$" | Select-Object -First 1
    if (-not $line) { return "" }
    $v = $line.Matches[0].Groups[1].Value.Trim()
    return ($v -replace '^["'']', '') -replace '["'']\s*$', ''
}

$sensors = [ordered]@{
    contrato = Get-Cfg "contrato"
    build    = Get-Cfg "build"
    gate     = Get-Cfg "gate"
    eval     = Get-Cfg "eval"
}
$covSource = Get-Cfg "source"
$covField  = Get-Cfg "field"
$covMin    = Get-Cfg "min"

function Invoke-Sensor([string]$label, [string]$cmd) {
    $log = Join-Path $env:TEMP "harness-$label.log"
    if ([string]::IsNullOrWhiteSpace($cmd)) {
        "  {0,-10} —  (não configurado)" -f $label | Write-Host
        return $true
    }
    cmd /c "$cmd" *> $log
    if ($LASTEXITCODE -eq 0) {
        "  {0,-10} ok" -f $label | Write-Host
        return $true
    } else {
        "  {0,-10} FAIL   (log: {1})" -f $label, $log | Write-Host
        return $false
    }
}

Write-Host "-- wap-harness gate -----------------------------"
$fail = $false
foreach ($k in $sensors.Keys) {
    if (-not (Invoke-Sensor $k $sensors[$k])) { $fail = $true }
}

# coverage — display only, never changes the exit code
if ($covSource -and (Test-Path $covSource)) {
    $raw = Get-Content $covSource -Raw
    $pct = $null
    if ($raw -match "`"$covField`"\s*:\s*\{[^}]*`"pct`"\s*:\s*([0-9.]+)") { $pct = $Matches[1] }
    elseif ($raw -match "`"$covField`"\s*:\s*([0-9.]+)") { $pct = $Matches[1] }
    if ($pct) { "  {0,-10} {1}% (min {2})" -f "cobertura", [math]::Round([double]$pct), $covMin | Write-Host }
}

Write-Host "-------------------------------------------------"
if (-not $fail) {
    Write-Host "resultado: verde"
    exit 0
}
Write-Host "resultado: vermelho"
exit 1
