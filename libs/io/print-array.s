@--------1---------2---------3---------4---------5---------6---------7---------8
@      
@  print_array function
@
@  the function will print the contents of an array in a formated way as
@  specified by the parameters
@  
@  parameters:
@   r0  prefix       - a text which introduces the vector values print
@   r1  fmt          - vector value format (e.g. " %02d")
@   r2  vect         - the vector array
@   r3  vect_size    - number of values printer per line
@
            .global lh_print_array
            .text
lh_print_array:

p_prefix    .req    r0
p_fmt       .req    r1
p_vect      .req    r2
p_vect_size .req    r3

            stmfd   sp!, {lr}       @ save LR; internal calls might demage it
            stmfd   sp!,  {fp, ip}  @ save FramePointer and Intra-Procedure
            stmfd   sp!, {r4-r7}    @ save the non-volatile registers

            @ save the parameters into local variables (hosted by registers)
            @ the p_prefix (r0) should not be saved because its used only one
            @ time.
v_fmt       .req    r4
v_vect      .req    r5
v_vect_size .req    r6
v_index     .req    r7

            mov     v_fmt,  p_fmt
            mov     v_vect, p_vect
            mov     v_vect_size, p_vect_size
            @ print the prefix
            @ in r0 is already the string which is supposed to be printed
            bl      printf
            @ print the values of the vector
            mov     v_index, #0     @ initialize the loop counter
loop:       cmp     v_index, v_vect_size    @ check exit condition
            bge     loop_exit
            @ print the element
            mov     r0, v_fmt       @ prepare the pritf format string
            ldr     r1, [v_vect], #1<<2     @ load the current  element
            bl      printf          @ call the printf

            add     v_index, v_index, #1    @ increase loop counter
            b       loop            @ close the loop
loop_exit:

            @ prin the end of line
            ldr     r0, =fmt_eol
            bl      printf

ret:        mov     r0, #0          
            ldmfd   sp!, {r4-r7}    @ save the non-volatile registers
            ldmfd   sp!, {fp, ip}   @ restore FramePointer and Intra-Procedure
            ldmfd   sp!, {pc}       @ restore LR into PC to return

@ literal pool
fmt_eol:    .string "\n"
