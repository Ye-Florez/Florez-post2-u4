# Florez-post2-u4

## Descripción
Laboratorio 2 de la Unidad 4: Macros con parámetros y control de flujo.

Implementación de macros reutilizables, bucles con LOOP y condicionales
con CMP/Jcc en ensamblador NASM para entorno DOS de 16 bits.

## Prerrequisitos
- DOSBox 0.74+
- NASM 3.01+
- ALINK (Win32 version)

## Compilación y ejecución
Desde CMD de Windows, dentro de la carpeta del proyecto:
nasm -f obj programa.asm -o programa.obj
alink programa.obj -oEXE -o programa.exe -entry main

Luego abrir DOSBox, montar la carpeta y ejecutar:

mount C C:\DOSWork\LAB4POS2

C:

prog2.exe
