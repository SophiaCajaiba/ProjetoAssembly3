
.data
    msg1: .asciiz "Digite um numero entre 100 e 999: "
    msg2: .asciiz "\nNumero invalido!"
    msg3: .asciiz "\nCENTENA = "
    msg4: .asciiz "\nDEZENA = "
    msg5: .asciiz "\nUNIDADE = "

.text
main:
Ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $t1, 100
    blt $t0, $t1, Erro

    li $t2, 999
    bgt $t0, $t2, Erro

    # Calcula a centena
    div $t3, $t0, $t1

    # Retira a centena
    mul $t4, $t3, $t1
    sub $t5, $t0, $t4

    # Calcula a dezena
    li $t6, 10
    div $t7, $t5, $t6

    # Calcula a unidade
    mul $t8, $t7, $t6
    sub $t9, $t5, $t8

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    add $a0, $t3, $zero
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    add $a0, $t7, $zero
    syscall

    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    add $a0, $t9, $zero
    syscall

    j Fim

Erro:
    li $v0, 4
    la $a0, msg2
    syscall
    j Ler

Fim:
    li $v0, 10
    syscall
