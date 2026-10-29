
.data
    msg1: .asciiz "Digite o valor da compra: "
    msg2: .asciiz "Digite o valor da parcela: "
    msg3: .asciiz "\nValor invalido!"
    msg4: .asciiz "\nQuantidade de parcelas: "

.text
main:

LerCompra:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $t1, 1000
    blt $t0, $t1, ErroCompra

    li $t1, 9999
    bgt $t0, $t1, ErroCompra

    j LerParcela

ErroCompra:
    li $v0, 4
    la $a0, msg3
    syscall
    j LerCompra

LerParcela:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    add $t2, $v0, $zero

    li $t1, 100
    blt $t2, $t1, ErroParcela

    li $t1, 500
    bgt $t2, $t1, ErroParcela

    j Calcular

ErroParcela:
    li $v0, 4
    la $a0, msg3
    syscall
    j LerParcela

Calcular:
    # Divide compra pela parcela
    div $t3, $t0, $t2

    # Calcula o resto
    rem $t4, $t0, $t2

    beq $t4, $zero, Mostrar

    # Se sobrar valor, acrescenta uma parcela
    li $t5, 1
    add $t3, $t3, $t5

Mostrar:
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    add $a0, $t3, $zero
    syscall

    li $v0, 10
    syscall
