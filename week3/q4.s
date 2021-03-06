# What address will be calculated, and what 
# value will be loaded into register $t0, after each of 
# the following statements (or pairs of statements)? 

Address       Data Definition
0x10010000    aa:  .word 42
0x10010004    bb:  .word 666   # hex 0x0000029a
0x10010008    cc:  .word 1
0x1001000C         .word 3
0x10010010         .word 5
0x10010014         .word 7

la   $t0, aa        $t0 = 0x10010000

lw   $t0, bb        $t0 = 666

lb   $t0, bb        $t0 = 0xffffff9a  # 0x9a sign extended to fill 32 bit register

lw   $t0, aa+4      $t0 = 666

la   $t1, cc        $t1 = 0x10010008
lw   $t0, ($t1)     $t0 = 1
# equivalent to lw $t0, cc

la   $t1, cc        $t1 = 0x10010008
lw   $t0, 8($t1)    $t0 = 5

li   $t1, 8         $t1 = 8
lw   $t0, cc($t1)   $t0 = 5

la   $t1, cc        $t1 = 0x10010008
lw   $t0, 2($t1)    # attempting to load a word from 0x1001000a will result in 
                    # error as address isn't a multiple of 4

