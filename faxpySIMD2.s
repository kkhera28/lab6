.text
.global faxpy

faxpy:
    stp     x29, x30, [sp, -16]!
    add     x29, sp, 0
    mov     w5, 0

_looptop:
    cmp     w5, w0
    b.ge    _loopquit

    ld1     {v0.2s}, [x1], #8    // Load 2 floats from x[]
    ld1     {v1.2s}, [x2], #8    // Load 2 floats from y[]
    fadd    v0.2s, v0.2s, v1.2s  // SIMD addition of 2 floats
    st1     {v0.2s}, [x3], #8    // Store result to result[]

    add     w5, w5, #2           // Increment loop by 2 (2-lane)
    b       _looptop

_loopquit:
    ldp     x29, x30, [sp], 16
    ret

