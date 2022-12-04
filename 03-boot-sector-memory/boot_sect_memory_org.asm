[org 0x7c00]
mov ah, 0x0e

; attempt 1
; Will fail again regardless of 'org' because we are still addressing the pointer
; and not the data it points to
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; attempt 2
; Having solved the memory problem with 'org', this is now the correct answer
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; attemmpt 3
; As you expected, we are adding 0x7c00 twice, so this is not going to work
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; attempt 4 
; This still works because there are no memory references to pointers, so
; the 'org' mode never applies. Directly addressing memory by counting bytes
; is always going to work, but it's inconvenient
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $ ; infinite loop

the_secret:
