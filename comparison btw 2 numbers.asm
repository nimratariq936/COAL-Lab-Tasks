.model small
.stack 100h
.data
    msg1 DB 10,13, "Enter First Number (A):$", 0
    msg2 DB 10,13, "Enter Second Number (B):$", 0
    msg_greater DB 10,13, "A is greater than B.$", 0
    msg_less DB 10,13, "A is less than B.$", 0
    msg_equal DB 10,13, "A is equal to B.$", 0

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
    mov cl, al            
    mov dx, offset msg2   
    mov ah, 9            
    int 21h               

    mov ah, 1             
    int 21h              
    sub al, 30h          
    mov dl, al           

    cmp cl, dl           
    je equal             
    jg greater           
    jl less            

greater:
    mov dx, offset msg_greater 
    mov ah, 9           
    int 21h              
    jmp end_program    

less:
    mov dx, offset msg_less    
    mov ah, 9             
    int 21h              
    jmp end_program       

equal:
    mov dx, offset msg_equal  
    mov ah, 9            

end_program:
    mov ah, 4Ch     
    int 21h              

main endp
end main
