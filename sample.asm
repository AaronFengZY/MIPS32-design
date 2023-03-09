# fzy computer organization test code
.data
    a: .word 1,2,3
.text
    j hh             # J-instruction
    addi $s1,$s1,1   # I-instruction
hh:
    la $s0,a
    lw $s1,0($s0)    # I-instruction
    lw $s2,4($s0)    # I-instruction
    
    add $s3,$s1,$s2  # R-instruction s3 = s1 + s2