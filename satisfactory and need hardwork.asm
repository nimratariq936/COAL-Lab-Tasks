.model small
.stack 100h

.data
    msg1 DB 10,13, "Enter your Lab Mid marks (0-9):$", 0
    msg_hardwork DB 10,13, "Need hard work.$", 0
    msg_satisfactory DB 10,13, "Satisfactory.$", 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset msg1
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 30h

    cmp al, 5
    jl hardwork

    mov dx, offset msg_satisfactory
    mov ah, 9
    int 21h
    jmp end_program

hardwork:
    mov dx, offset msg_hardwork
    mov ah, 9
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

main endp
end main
