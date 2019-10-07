@--------1---------2---------3---------4---------5---------6---------7---------8
@
@


            .data

arr:        .word   12, 03, 89, 16, 22, 19, 67, 04, 12, 98, 02, 55
            .word   82, 23, 19, 46, 12, 29, 77, 24, 42, 18, 62, 51
            .equ    arr_size, (. - arr) >> 2
fmt_txt:    .string "UNsorted: "
fmt_nr:     .string "%02d "

            .text
            .global main

main:       stmfd   sp!, {lr}

            ldr     r0, =fmt_txt
            ldr     r1, =fmt_nr
            ldr     r2, =arr
            mov     r3, #arr_size
            bl      lh_print_array


ret:        mov     r0, #0
            ldmfd   sp!, {pc}
