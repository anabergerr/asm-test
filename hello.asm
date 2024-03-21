global _main
extern _GetStdHandle@4
extern _WriteFile@20
extern _ExitProcess@4

section .text
_main:
    ; Obtenha o handle para a saída padrão (console)
    push -11
    call _GetStdHandle@4
    mov ebx, eax

    ; Escreva a mensagem no console
    push 0
    lea eax, [ebp-4]
    push eax
    push (message_end - message)
    push message
    push ebx
    call _WriteFile@20

    ; Encerre o programa
    push 0
    call _ExitProcess@4
    hlt

message:
    db 'ola, mundoooo', 10
message_end:
