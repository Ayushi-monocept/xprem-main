param()

# Frees port 3000 (if any process is listening) and starts the Go backend
$port = 3000
$conns = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue
if ($null -ne $conns) {
  $conns | ForEach-Object {
    $procId = $_.OwningProcess
    Get-Process -Id $procId -ErrorAction SilentlyContinue | Select-Object Id,ProcessName
    Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue
    Write-Output "KILLED:$procId"
  }
} else {
  Write-Output "NONE"
}

Set-Location "$PSScriptRoot\.."
& 'C:\Program Files\Go\bin\go.exe' run ./cmd/api
