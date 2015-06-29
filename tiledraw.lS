	.text
	.align	2
	@@.type	tiledraw_8, %function
	
__ASM_functions_list:
	.long	tiledraw_8
	.long	0
	.global _tiledraw_setup
_tiledraw_setup:
	str	r4, [sp, #-4]!
	@@ Setup stuff for code copy.
	ldr	r0, =__ASM_functions_start
	ldr	r1, =0x40015030
	ldr	r2, =__ASM_functions_end
	sub	r3, r1, r0		@ r3 = offset
	@@ Copy ASM funcs to IRAM + 0x30.
1:	ldr	r4, [r0], #4
	str	r4, [r1], #4
	cmp	r0, r2
	blo	1b
	@@ Put stubs in at the old addresses to jump to the new ones.
	adr	r0, __ASM_functions_list
1:	ldr	r1, [r0], #4		@ load a funcptr and inc funcptrptr
	cmp	r1, #0			@ is it the 0 at the end?
	beq	2f			@ if so, break out
	add	r2, r1, r3		@ r2 = address of func in iram
	ldr	r4, =0xe51ff004		@ r3 = encoding of `ldr pc, [pc, #-4]' (load pc from next word)
	str	r4, [r1], #4		@ store instr at func and inc funcptr
	str	r2, [r1], #4		@ store address of where-to-jump at func + 4 and inc funcptr
	b	1b			@ keep looping
2:	@@ Return.
	ldr	r4, [sp], #4
	bx	lr
	.pool

__ASM_functions_start:
	.global	tiledraw_8
tiledraw_8:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	ip, [r1], #4
	ldr	r7, [sp, #20]
	cmp	ip, #0
	mov	r4, r3
	rsbeq	r3, r7, r0
	ldr	lr, [r2], #4
	addeq	r0, r3, #8
	beq	.L3
	add	ip, ip, r7
	cmp	r7, #7
	ldrls	pc, [pc, r7, asl #2]
	b	.L3
	.p2align 2
.L21:
	.word	.L5
	.word	.L7
	.word	.L9
	.word	.L11
	.word	.L13
	.word	.L15
	.word	.L17
	.word	.L19
.L5:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #3]
	
	ldrb	r3, [ip, #4]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #4]
	
	ldrb	r3, [ip, #5]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #5]
	
	ldrb	r3, [ip, #6]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #6]
	
	ldrb	r3, [ip, #7]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #7]
	add	r0, r0, #7
	add	ip, ip, #7
	b	.L3
.L7:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #3]
	
	ldrb	r3, [ip, #4]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #4]
	
	ldrb	r3, [ip, #5]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #5]
	
	ldrb	r3, [ip, #6]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #6]
	add	r0, r0, #6
	add	ip, ip, #6
	b	.L3
.L9:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #3]
	
	ldrb	r3, [ip, #4]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #4]
	
	ldrb	r3, [ip, #5]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #5]
	add	r0, r0, #5
	add	ip, ip, #5
	b	.L3
.L11:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #3]
	
	ldrb	r3, [ip, #4]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #4]
	add	r0, r0, #4
	add	ip, ip, #4
	b	.L3
.L13:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	
	ldrb	r3, [ip, #3]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #3]
	add	r0, r0, #3
	add	ip, ip, #3
	b	.L3
.L15:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	
	ldrb	r3, [ip, #2]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #2]
	add	r0, r0, #2
	add	ip, ip, #2
	b	.L3
.L17:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #1]
	add	r0, r0, #1
	add	ip, ip, #1
	b	.L3
.L19:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	add	r0, r0, #1
.L3:
	cmp	r4, #1
	ble	.L55
	ldr	ip, [r1], #4
	cmp	ip, #0
	and	r5, r4, #1
	ldr	lr, [r2], #4
	bne	.L58
	add	r0, r0, #8
.L93:
	sub	r6, r4, #1
	cmp	r6, #1
	ble	.L55
	cmp	r5, #0
	bne	.L125
.L56:
	ldr	ip, [r1], #4
	cmp	ip, #0
	ldr	lr, [r2], #4
	addeq	r0, r0, #8
	beq	.L24
	ldrb	r4, [ip, #0]	@ zero_extendqisi2
	cmp	r4, #0
	ldrneb	r4, [r4, lr]	@ zero_extendqisi2
	strneb	r4, [r0, #0]
	ldrb	r5, [ip, #1]	@ zero_extendqisi2
	cmp	r5, #0
	ldrneb	r5, [r5, lr]	@ zero_extendqisi2
	strneb	r5, [r0, #1]
	add	ip, ip, #1
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	add	r4, r0, #1
	strneb	r3, [r4, #1]
	add	r0, ip, #1
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	add	r5, r4, #1
	strneb	r3, [r5, #1]
	add	r0, r0, #1
	add	ip, r5, #1
	ldrb	r5, [r0, #1]	@ zero_extendqisi2
	cmp	r5, #0
	ldrneb	r5, [r5, lr]	@ zero_extendqisi2
	strneb	r5, [ip, #1]
	add	r0, r0, #1
	add	r4, ip, #1
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	cmp	ip, #0
	ldrneb	ip, [ip, lr]	@ zero_extendqisi2
	strneb	ip, [r4, #1]
	add	r0, r0, #1
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	add	r5, r4, #1
	strneb	r3, [r5, #1]
	add	r0, r0, #1
	ldrb	r4, [r0, #1]	@ zero_extendqisi2
	cmp	r4, #0
	ldrneb	r4, [r4, lr]	@ zero_extendqisi2
	add	ip, r5, #1
	add	r0, ip, #1
	strneb	r4, [ip, #1]
	add	r0, r0, #1
.L24:
	ldr	ip, [r1], #4
	cmp	ip, #0
	ldr	lr, [r2], #4
	sub	r4, r6, #1
	bne	.L79
	add	r0, r0, #8
.L113:
	sub	r6, r4, #1
.L123:
	cmp	r6, #1
	bgt	.L56
.L55:
	cmp	r7, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	ldr	r1, [r1, #0]
	cmp	r1, #0
	ldr	r2, [r2, #0]
	mov	ip, r1
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	sub	r3, r7, #1
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L1
	.p2align 2
.L53:
	.word	.L51
	.word	.L49
	.word	.L47
	.word	.L45
	.word	.L43
	.word	.L41
	.word	.L39
.L58:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L126
.L67:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L66:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L65:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L64:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L63:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L62:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L61:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L60:
	add	r0, r0, #1
	b	.L93
.L79:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L88:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L87:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L86:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L85:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L84:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L83:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L82:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	ldrneb	r6, [r3, lr]	@ zero_extendqisi2
	strneb	r6, [r0, #0]
.L81:
	add	r0, r0, #1
	b	.L113
.L125:
	ldr	ip, [r1], #4
	cmp	ip, #0
	ldr	lr, [r2], #4
	addeq	r0, r0, #8
	subeq	r6, r6, #1
	beq	.L123
.L68:
	ldrb	r3, [ip, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L127
.L77:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L76:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L75:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L74:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L73:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L72:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	add	ip, ip, #1
	ldrneb	r3, [r3, lr]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
.L71:
	ldrb	r3, [ip, #1]	@ zero_extendqisi2
	cmp	r3, #0
	add	r0, r0, #1
	ldrneb	ip, [r3, lr]	@ zero_extendqisi2
	strneb	ip, [r0, #0]
.L70:
	add	r0, r0, #1
	sub	r6, r6, #1
	b	.L123
.L126:
	ldrb	r3, [r3, lr]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	b	.L67
.L127:
	ldrb	r3, [r3, lr]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	b	.L77
.L1:
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L39:
	ldrb	r1, [r1, #0]	@ zero_extendqisi2
	cmp	r1, #0
	ldrneb	r1, [r1, r2]	@ zero_extendqisi2
	strneb	r1, [r0, #0]
	add	r0, r0, #1
	add	r1, ip, #1
.L41:
	ldrb	ip, [r1, #0]	@ zero_extendqisi2
	cmp	ip, #0
	ldrneb	ip, [ip, r2]	@ zero_extendqisi2
	add	r1, r1, #1
	strneb	ip, [r0, #0]
	add	r0, r0, #1
.L43:
	ldrb	r3, [r1, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, r2]	@ zero_extendqisi2
	add	r1, r1, #1
	strneb	r3, [r0, #0]
	add	r0, r0, #1
.L45:
	ldrb	ip, [r1, #0]	@ zero_extendqisi2
	cmp	ip, #0
	ldrneb	ip, [ip, r2]	@ zero_extendqisi2
	add	r1, r1, #1
	strneb	ip, [r0, #0]
	add	r0, r0, #1
.L47:
	ldrb	r3, [r1, #0]	@ zero_extendqisi2
	cmp	r3, #0
	ldrneb	r3, [r3, r2]	@ zero_extendqisi2
	add	r1, r1, #1
	strneb	r3, [r0, #0]
	add	r0, r0, #1
.L49:
	ldrb	ip, [r1, #0]	@ zero_extendqisi2
	cmp	ip, #0
	ldrneb	ip, [ip, r2]	@ zero_extendqisi2
	add	r1, r1, #1
	strneb	ip, [r0, #0]
	add	r0, r0, #1
.L51:
	ldrb	r1, [r1, #0]	@ zero_extendqisi2
	cmp	r1, #0
	ldrneb	r3, [r1, r2]	@ zero_extendqisi2
	strneb	r3, [r0, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
__ASM_functions_end:
	.size	tiledraw_8, .-tiledraw_8
	.ident	"GCC: (GNU) 3.4.3"
