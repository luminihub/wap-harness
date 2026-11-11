# wap-harness gate — config-driven sensor runner (PowerShell).
#
# Reads harness.config.yml, runs the four sensors in order, prints a table,
# and exits 0 if all pass or 1 if any fail. Pass/fail is decided SOLELY by
# each sensor's exit code. Coverage % is read for display only, never fatal.
#
# A sensor set to `skip` is not run and does not fail the gate, but is shown
# as "pulado" (and in the final line) so a missing suite is never mistaken
# for a passing one.

$ErrorActionPreference = "Stop"
$Config = if ($env:HARNESS_CONFIG) { $env:HARNESS_CONFIG } else { "harness.config.yml" }

if (-not (Test-Path $Config)) {
    Write-Error "harness: config não encontrado: $Config`nrode /speckit-harness-setup para criá-lo."
    exit 2
}

function Remove-Quotes([string]$v) {
    $v = ($v -replace '\s#.*$', '').Trim()
    return ($v -replace '^["'']', '') -replace '["'']\s*$', ''
}

# --- minimal YAML reader for this file's fixed shape ---
function Get-Cfg([string]$key) {
    $line = Select-String -Path $Config -Pattern "^\s*$key\s*:\s*(.+)$" | Select-Object -First 1
    if (-not $line) { return "" }
    return Remove-Quotes $line.Matches[0].Groups[1].Value
}

# --- optional `env:` block: KEY: value lines exported for the sensors ---
$inEnv = $false
foreach ($l in Get-Content $Config) {
    if ($l -match '^env:') { $inEnv = $true; continue }
    if ($l -match '^[^\s#]') { $inEnv = $false }
    if ($inEnv -and $l -match '^\s+([A-Za-z_][A-Za-z0-9_]*)\s*:\s*(.+)$') {
        $key = $Matches[1]
        $val = Remove-Quotes $Matches[2]
        if (-not $val) { continue }
        if ($key -eq "JAVA_HOME" -and -not (Test-Path $val)) {
            Write-Host "harness: env.JAVA_HOME não existe nesta máquina ($val) — mantendo o JDK atual"
            continue
        }
        Set-Item -Path "env:$key" -Value $val
    }
}
if ($env:JAVA_HOME -and (Test-Path (Join-Path $env:JAVA_HOME "bin"))) {
    $env:PATH = (Join-Path $env:JAVA_HOME "bin") + [IO.Path]::PathSeparator + $env:PATH
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
$skipped   = @()

function Invoke-Sensor([string]$label, [string]$cmd) {
    $log = Join-Path $env:TEMP "harness-$label.log"
    if ([string]::IsNullOrWhiteSpace($cmd)) {
        "  {0,-10} —  (não configurado)" -f $label | Write-Host
        return $true
    }
    if ($cmd -eq "skip") {
        "  {0,-10} pulado (skip no harness.config.yml)" -f $label | Write-Host
        $script:skipped += $label
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
    $pct = $null
    if ($covSource -like "*.csv") {
        $rows = Import-Csv $covSource
        $missed  = ($rows | Measure-Object -Property "$($covField)_MISSED" -Sum).Sum
        $covered = ($rows | Measure-Object -Property "$($covField)_COVERED" -Sum).Sum
        if (($missed + $covered) -gt 0) { $pct = $covered * 100 / ($missed + $covered) }
    } else {
        $raw = Get-Content $covSource -Raw
        if ($raw -match "`"$covField`"\s*:\s*\{[^}]*`"pct`"\s*:\s*([0-9.]+)") { $pct = $Matches[1] }
        elseif ($raw -match "`"$covField`"\s*:\s*([0-9.]+)") { $pct = $Matches[1] }
    }
    if ($pct) { "  {0,-10} {1}% (min {2})" -f "cobertura", [math]::Round([double]$pct), $covMin | Write-Host }
}

Write-Host "-------------------------------------------------"
if (-not $fail) {
    if ($skipped.Count -gt 0) {
        Write-Host ("resultado: verde — com sensor pulado: " + ($skipped -join " "))
    } else {
        Write-Host "resultado: verde"
    }
    exit 0
}
Write-Host "resultado: vermelho"
exit 1
