.model small
.stack 100h
.data
    msg1 DB 10,13, "Enter a single-digit number:$", 0
    msg_positive DB 10,13, "The number is positive.$", 0
    msg_zero DB 10,13, "The number is zero.$", 0
    msg_invalid DB 10,13, "Invalid input. Enter a digit between 0 and 9.$", 0

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

    cmp al, 0
    jl invalid_input
    cmp al, 9
    jg invalid_input

    cmp al, 0
    je is_zero

    mov dx, offset msg_positive
    mov ah, 9
    int 21h
    jmp end_program

is_zero:
    mov dx, offset msg_zero
    mov ah, 9
    int 21h
    jmp end_program

invalid_input:
    mov dx, offset msg_invalid
    mov ah, 9
    int 21h

end_program:
    mov ah, 4Ch
    int 21h

main endp
end main
