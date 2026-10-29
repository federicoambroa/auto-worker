param(
    [switch]$MantenerPantalla
)

$ErrorActionPreference = 'Stop'

if ($env:OS -ne 'Windows_NT') {
    throw 'Este programa requiere Windows.'
}

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class EstadoDeEnergia
{
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern uint SetThreadExecutionState(uint flags);
}
'@

# ES_CONTINUOUS | ES_SYSTEM_REQUIRED; opcionalmente ES_DISPLAY_REQUIRED.
[uint32]$flags = 2147483649
if ($MantenerPantalla) {
    $flags = $flags -bor 2
}

try {
    if ([EstadoDeEnergia]::SetThreadExecutionState($flags) -eq 0) {
        throw 'Windows no pudo activar la solicitud para impedir la suspension.'
    }

    Write-Host 'Equipo despierto. Pulsa Ctrl+C o cierra esta ventana para terminar.'
    if ($MantenerPantalla) {
        Write-Host 'La pantalla tambien permanecera encendida.'
    }

    while ($true) {
        Start-Sleep -Seconds 1
    }
}
finally {
    # Restaura la administracion normal de energia al detener el script.
    [void][EstadoDeEnergia]::SetThreadExecutionState([uint32]2147483648)
}
