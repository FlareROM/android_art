    .extern MterpThreadFenceForConstructor
    .extern MterpSuspendCheck
    jal     MterpThreadFenceForConstructor
    lw      ra, THREAD_FLAGS_OFFSET(rSELF)
    move    a0, rSELF
    and     ra, ra, THREAD_SUSPEND_OR_CHECKPOINT_REQUEST
    beqzc   ra, 1f
    jal     MterpSuspendCheck           # (self)
1:
    li      a0, 0
    b       MterpReturn
