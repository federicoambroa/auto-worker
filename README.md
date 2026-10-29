# Mantener el equipo despierto

Programa para Windows que impide la suspension automatica mientras esta activo.
Utiliza `SetThreadExecutionState`, la API de administracion de energia de Windows.
No necesita instalar dependencias ni permisos de administrador.

## Uso

1. Descarga ambos archivos, `MantenerDespierto.cmd` y `MantenerDespierto.ps1`, en la misma carpeta.
2. Haz doble clic en `MantenerDespierto.cmd`.
3. Para terminar, pulsa Ctrl+C o cierra la ventana. Windows recuperara su comportamiento normal de energia.

Por defecto, la pantalla puede apagarse mientras el equipo sigue despierto.
Para mantener tambien la pantalla encendida, ejecuta desde una terminal:

```bat
MantenerDespierto.cmd -MantenerPantalla
```

Requiere Windows PowerShell 5.1, incluido en Windows 10 y 11. Si una politica de
PowerShell bloquea la ejecucion, utiliza el procedimiento autorizado para ejecutar
scripts en tu equipo; el lanzador respeta esa politica.

La aplicacion no impide el bloqueo de sesion ni modifica estados de presencia.
La suspension manual, el cierre de la tapa y las politicas del equipo pueden
prevalecer sobre esta solicitud. Mantener el equipo despierto consume bateria.

La comprobacion funcional debe hacerse en Windows: configura temporalmente un
intervalo corto de suspension automatica, ejecuta el programa y verifica que el
equipo sigue despierto pasado ese intervalo. Detenlo y comprueba que vuelve a
suspenderse normalmente. Restaura despues tus ajustes de energia.
