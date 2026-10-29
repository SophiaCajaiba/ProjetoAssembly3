
.data
    msg1: .asciiz "Digite o primeiro valor: "
    msg2: .asciiz "\nDigite o segundo valor: "
    msg3: .asciiz "\nPrimeiro valor apos troca: "
    msg4: .asciiz "\nSegundo valor apos troca: "

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

    # Troca os valores
    add $t2, $t0, $zero
    add $t0, $t1, $zero
    add $t1, $t2, $zero

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    add $a0, $t0, $zero
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    add $a0, $t1, $zero
    syscall

    li $v0, 10
    syscall
