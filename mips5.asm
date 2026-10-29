
.data
    msg1: .asciiz "Digite A: "
    msg2: .asciiz "Digite B: "
    msg3: .asciiz "Digite C: "
    msg4: .asciiz "DUAS RAIZES REAIS"
    msg5: .asciiz "UMA RAIZ REAL"
    msg6: .asciiz "NAO EXISTEM RAIZES REAIS"
    msg7: .asciiz "A deve ser diferente de zero"

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    beq $t0, $zero, Erro

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    add $t1, $v0, $zero

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    add $t2, $v0, $zero

    # B ao quadrado
    mul $t3, $t1, $t1

    # 4 vezes A vezes C
    li $t4, 4
    mul $t5, $t0, $t2
    mul $t5, $t5, $t4

    # Delta
    sub $t6, $t3, $t5

    bgt $t6, $zero, Duas
    beq $t6, $zero, Uma
    j Nenhuma

Duas:
    li $v0, 4
    la $a0, msg4
    syscall
    j Fim

Uma:
    li $v0, 4
    la $a0, msg5
    syscall
    j Fim

Nenhuma:
    li $v0, 4
    la $a0, msg6
    syscall
    j Fim

Erro:
    li $v0, 4
    la $a0, msg7
    syscall

Fim:
    li $v0, 10
    syscall
