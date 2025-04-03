.text
.global faxpy

faxpy:
    stp     x29, x30, [sp, -16]!
    add     x29, sp, 0
    mov     w5, 0

_looptop:
    cmp     w5, w0
    b.ge    _loopquit

    ld1     {v0.4s}, [x1], #16    // Load 4 floats from x[]
    ld1     {v1.4s}, [x2], #16    // Load 4 floats from y[]
    fadd    v0.4s, v0.4s, v1.4s   // SIMD addition of 4 floats
    st1     {v0.4s}, [x3], #16    // Store result to result[]

    add     w5, w5, #4            // Increment loop by 4 (since we're doing 4 lanes)
    b       _looptop

_loopquit:
    ldp     x29, x30, [sp], 16
    ret

