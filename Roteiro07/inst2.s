.text
main:
    addi a1, x0, 0xfe
    li x2, 0x000
    lui x2, 0x10000
    sw a1, 0xc(x2)
    lw x10, 0xc(x2)