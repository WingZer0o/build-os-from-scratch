mov ah, 0x0e ; tty node
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' is still an al, remember?
mov al, 'o'
int 0x10

jmp $ ; jump to current address = infinite loop
;

times 510 - ($-$$) db 0
dw 0xaa55