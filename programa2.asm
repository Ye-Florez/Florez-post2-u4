; programa2.asm — Laboratorio Post2 Unidad 4

%include "macros.asm"

segment data
    titulo      db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, 24h
    linea_a     db "[Linea A] Primera impresion", 0Dh, 0Ah, 24h
    linea_b     db "[Linea B] Segunda impresion", 0Dh, 0Ah, 24h
    msg_mayor   db "El valor mayor es: ", 24h
    msg_iguales db "Los valores son iguales.", 0Dh, 0Ah, 24h
    msg_suma    db "Resultado de la suma: ", 24h
    msg_fin     db "Fin del programa.", 0Dh, 0Ah, 24h

segment bss
    valor_a resw 1
    valor_b resw 1

segment code
    global main

main:
    mov ax, data
    mov ds, ax

    ; 1. Imprimir encabezado
    print_str titulo

    ; 2. Demostración de repetir_str
    repetir_str linea_a, 3
    repetir_str linea_b, 2

    ; 3. Suma 1+2+3 = 6
    mov cx, 3
    call sumar_serie        ; AX = 6
    print_str msg_suma
    print_digito            ; imprime "6"
    nueva_linea

    ; 4. Comparar 9 vs 4 → mayor es 9
    mov ax, 9
    mov bx, 4
    call comparar_e_imprimir

    ; 5. Comparar 5 vs 5 → iguales
    mov ax, 5
    mov bx, 5
    call comparar_e_imprimir

    ; 6. Mensaje final y terminación
    print_str msg_fin
    fin_dos

; ── Procedimiento: suma acumulativa 1+2+...+N ──────────────────────────
; Entrada: CX = N
; Salida:  AX = suma total
sumar_serie:
    push cx
    xor ax, ax
.paso:
    add ax, cx
    loop .paso
    pop cx
    ret

; ── Procedimiento: comparar AX y BX e imprimir el mayor ────────────────
; Modifica AH y DX (preservados en pila)
comparar_e_imprimir:
    push ax
    push bx
    cmp ax, bx
    je  .son_iguales
    jg  .ax_mayor
    ; Caso: BX es mayor
    print_str msg_mayor
    mov al, bl
    print_digito
    nueva_linea
    jmp .fin_comp
.ax_mayor:
    print_str msg_mayor
    print_digito
    nueva_linea
    jmp .fin_comp
.son_iguales:
    print_str msg_iguales
.fin_comp:
    pop bx
    pop ax
    ret