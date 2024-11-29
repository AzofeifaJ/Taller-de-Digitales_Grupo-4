###   Interfaz para teclado hexadecimal
La Figura 1 muestra un diagrama básico de una interfaz para un teclado hexadecimal. En el
 laboratorio 1 se desarrollaron los bloques combinacionales presentes en el sub-cuadro protoboard.
 En este laboratorio se completará la interfaz por medio de bloques implementados en la FPGA.
 
 ![Captura de pantalla 2024-10-01 171330](https://github.com/user-attachments/assets/8654f870-8f90-4ca7-b785-eb6e64f8aace)

## Planteamiento del problema
El proyecto consiste en desarrollar un sistema que gestione un teclado hexadecimal conectado a una FPGA, con la finalidad de implementar la selección de tres imágenes predefinidas. La idea principal es detectar de forma eficiente qué tecla se presiona y, con base en ello, seleccionar una de las imágenes asignadas. Para esto, se diseñará un sistema que asocie cada tecla a una imagen específica, de la siguiente manera:

- **La tecla `0` estará vinculada a la Imagen 1.**
- **La tecla `1` seleccionará la Imagen 2.**
- **La tecla `2` permitirá elegir la Imagen 3.**

Cualquier otra tecla, o la ausencia de pulsaciones, resultará en un estado inactivo en el sistema.
El funcionamiento del teclado requiere escanear constantemente las filas y columnas para identificar las combinaciones activas que representan la tecla presionada. Además, es fundamental eliminar el ruido o rebote producido al pulsar las teclas, para garantizar lecturas precisas y estables. Este sistema se apoyará en un divisor de reloj que ajuste la velocidad de operación, y un contador que active cada fila del teclado de forma secuencial.
Una vez detectada una pulsación válida, el sistema asignará un código único a la imagen seleccionada. Este código será enviado a través de una interfaz UART hacia un dispositivo externo, lo que permitirá integrar esta funcionalidad con otros sistemas, como pantallas o módulos de procesamiento.
## Tabla de la Verdad
| **Tecla Presionada** | **Imagen Seleccionada** | **Código UART** |
|-----------------------|--------------------------|-----------------|
| `0`                  | Imagen 1                | `8'h01`         |
| `1`                  | Imagen 2                | `8'h02`         |
| `2`                  | Imagen 3                | `8'h03`         |
| Otras teclas         | Ninguna                 | `8'h00`         |

