
.data
    msg1: .asciiz "Digite o primeiro numero: "
    msg2: .asciiz "Digite o segundo numero: "
    msg3: .asciiz "Numeros iguais"
    msg4: .asciiz "Numeros diferentes"
    msg5: .asciiz "\nMaior: "
    msg6: .asciiz "\nMenor: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    add $t1, $v0, $zero

    beq $t0, $t1, Iguais

    li $v0, 4
    la $a0, msg4
    syscall

    bgt $t0, $t1, PrimeiroMaior

    add $t2, $t1, $zero
    add $t3, $t0, $zero
    j Mostrar

PrimeiroMaior:
    add $t2, $t0, $zero
    add $t3, $t1, $zero

Mostrar:
    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    add $a0, $t2, $zero
    syscall

    li $v0, 4
    la $a0, msg6
    syscall

    li $v0, 1
    add $a0, $t3, $zero
    syscall
    j Fim

Iguais:
    li $v0, 4
    la $a0, msg3
    syscall

Fim:
    li $v0, 10
    syscall
