
.data
    msg1: .asciiz "Mes de nascimento: "
    msg2: .asciiz "Ano de nascimento: "
    msg3: .asciiz "Mes atual: "
    msg4: .asciiz "Ano atual: "
    msg5: .asciiz "Idade em meses: "

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

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    add $t2, $v0, $zero

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 5
    syscall
    add $t3, $v0, $zero

    # Calcula a diferenca dos anos
    sub $t4, $t3, $t1

    li $t5, 12
    mul $t4, $t4, $t5

    # Calcula a diferenca dos meses
    sub $t6, $t2, $t0

    # Soma tudo
    add $t7, $t4, $t6

    li $v0, 4
    la $a0, msg5
    syscall

    li $v0, 1
    add $a0, $t7, $zero
    syscall

    li $v0, 10
    syscall
