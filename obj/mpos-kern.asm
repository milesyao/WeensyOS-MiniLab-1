
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 ff 02 00 00       	call   100318 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 14 96 10 00       	mov    0x109614,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 54             	imul   $0x54,%edx,%eax
  1000a4:	83 b8 b4 88 10 00 01 	cmpl   $0x1,0x1088b4(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 6c 88 10 00       	add    $0x10886c,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 79 04 00 00       	call   100534 <run>

001000bb <interrupt>:

static pid_t do_fork(process_t *parent);
static pid_t new_thread();
void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

static pid_t do_fork(process_t *parent);
static pid_t new_thread();
void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d 14 96 10 00    	mov    0x109614,%ebx

static pid_t do_fork(process_t *parent);
static pid_t new_thread();
void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 06             	cmp    $0x6,%eax
  1000e1:	0f 87 2f 02 00 00    	ja     100316 <interrupt+0x25b>
  1000e7:	ff 24 85 ec 0a 10 00 	jmp    *0x100aec(,%eax,4)

	case INT_SYS_KILL:{
		pid_t aim = current->p_registers.reg_eax;
  1000ee:	8b 53 20             	mov    0x20(%ebx),%edx
		if(aim < 1 || aim >= NPROCS || proc_array[aim].p_state == P_EMPTY || proc_array[aim].p_state == P_ZOMBIE) {
  1000f1:	8d 42 ff             	lea    -0x1(%edx),%eax
  1000f4:	83 f8 0e             	cmp    $0xe,%eax
  1000f7:	77 14                	ja     10010d <interrupt+0x52>
  1000f9:	6b f2 54             	imul   $0x54,%edx,%esi
  1000fc:	8b 8e b4 88 10 00    	mov    0x1088b4(%esi),%ecx
  100102:	85 c9                	test   %ecx,%ecx
  100104:	74 07                	je     10010d <interrupt+0x52>
  100106:	31 c0                	xor    %eax,%eax
  100108:	83 f9 03             	cmp    $0x3,%ecx
  10010b:	75 0c                	jne    100119 <interrupt+0x5e>
			current->p_registers.reg_eax = -1;
  10010d:	c7 43 20 ff ff ff ff 	movl   $0xffffffff,0x20(%ebx)

	switch (reg->reg_intno) {

	case INT_SYS_KILL:{
		pid_t aim = current->p_registers.reg_eax;
		if(aim < 1 || aim >= NPROCS || proc_array[aim].p_state == P_EMPTY || proc_array[aim].p_state == P_ZOMBIE) {
  100114:	e9 b8 00 00 00       	jmp    1001d1 <interrupt+0x116>
			current->p_registers.reg_eax = -1;
		} else {
			int i;
			for(i=1; i<NPROCS; i++) {
				if(proc_array[i].waiting_pid == proc_array[aim].p_pid) {
  100119:	8b 88 10 89 10 00    	mov    0x108910(%eax),%ecx
  10011f:	3b 8e 6c 88 10 00    	cmp    0x10886c(%esi),%ecx
  100125:	75 1e                	jne    100145 <interrupt+0x8a>
					proc_array[i].p_state = P_RUNNABLE;
  100127:	c7 80 08 89 10 00 01 	movl   $0x1,0x108908(%eax)
  10012e:	00 00 00 
					proc_array[i].p_registers.reg_eax = -1;
  100131:	c7 80 e0 88 10 00 ff 	movl   $0xffffffff,0x1088e0(%eax)
  100138:	ff ff ff 
					proc_array[i].waiting_pid =0;
  10013b:	c7 80 10 89 10 00 00 	movl   $0x0,0x108910(%eax)
  100142:	00 00 00 
  100145:	83 c0 54             	add    $0x54,%eax
		pid_t aim = current->p_registers.reg_eax;
		if(aim < 1 || aim >= NPROCS || proc_array[aim].p_state == P_EMPTY || proc_array[aim].p_state == P_ZOMBIE) {
			current->p_registers.reg_eax = -1;
		} else {
			int i;
			for(i=1; i<NPROCS; i++) {
  100148:	3d ec 04 00 00       	cmp    $0x4ec,%eax
  10014d:	75 ca                	jne    100119 <interrupt+0x5e>
					proc_array[i].p_state = P_RUNNABLE;
					proc_array[i].p_registers.reg_eax = -1;
					proc_array[i].waiting_pid =0;
				}
			}
			proc_array[aim].p_exit_status = -1;
  10014f:	6b c2 54             	imul   $0x54,%edx,%eax
			proc_array[aim].p_state = P_ZOMBIE;			
			proc_array[aim].waiting_pid = 0;
			current->p_registers.reg_eax = 0;
  100152:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
					proc_array[i].p_state = P_RUNNABLE;
					proc_array[i].p_registers.reg_eax = -1;
					proc_array[i].waiting_pid =0;
				}
			}
			proc_array[aim].p_exit_status = -1;
  100159:	c7 80 b8 88 10 00 ff 	movl   $0xffffffff,0x1088b8(%eax)
  100160:	ff ff ff 
			proc_array[aim].p_state = P_ZOMBIE;			
  100163:	c7 80 b4 88 10 00 03 	movl   $0x3,0x1088b4(%eax)
  10016a:	00 00 00 
			proc_array[aim].waiting_pid = 0;
  10016d:	c7 80 bc 88 10 00 00 	movl   $0x0,0x1088bc(%eax)
  100174:	00 00 00 
  100177:	eb 58                	jmp    1001d1 <interrupt+0x116>
			current->p_registers.reg_eax = 0;
		}
//		schedule();

		run(current);	
  100179:	b8 08 89 10 00       	mov    $0x108908,%eax
  10017e:	ba 01 00 00 00       	mov    $0x1,%edx
static pid_t
new_thread() 
{
	int i;
	for(i=1; i<NPROCS; i++) {
		if(proc_array[i].p_state == P_EMPTY) break;		
  100183:	83 38 00             	cmpl   $0x0,(%eax)
  100186:	75 3a                	jne    1001c2 <interrupt+0x107>
	}
	if(i==NPROCS) return -1;
	uint32_t aim_stk_top;
	aim_stk_top = PROC1_STACK_ADDR + PROC_STACK_SIZE * i;
	proc_array[i].p_state = P_RUNNABLE;
  100188:	6b c2 54             	imul   $0x54,%edx,%eax
	proc_array[i].p_registers = current->p_registers;
  10018b:	b9 11 00 00 00       	mov    $0x11,%ecx
  100190:	8d 73 04             	lea    0x4(%ebx),%esi
	proc_array[i].p_registers.reg_eip = current->p_registers.reg_eax;
	proc_array[i].p_registers.reg_esp = aim_stk_top;
  100193:	83 c2 0a             	add    $0xa,%edx
  100196:	c1 e2 12             	shl    $0x12,%edx
	}
	if(i==NPROCS) return -1;
	uint32_t aim_stk_top;
	aim_stk_top = PROC1_STACK_ADDR + PROC_STACK_SIZE * i;
	proc_array[i].p_state = P_RUNNABLE;
	proc_array[i].p_registers = current->p_registers;
  100199:	8d b8 70 88 10 00    	lea    0x108870(%eax),%edi
  10019f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		if(proc_array[i].p_state == P_EMPTY) break;		
	}
	if(i==NPROCS) return -1;
	uint32_t aim_stk_top;
	aim_stk_top = PROC1_STACK_ADDR + PROC_STACK_SIZE * i;
	proc_array[i].p_state = P_RUNNABLE;
  1001a1:	c7 80 b4 88 10 00 01 	movl   $0x1,0x1088b4(%eax)
  1001a8:	00 00 00 
	proc_array[i].p_registers = current->p_registers;
	proc_array[i].p_registers.reg_eip = current->p_registers.reg_eax;
	proc_array[i].p_registers.reg_esp = aim_stk_top;
  1001ab:	89 90 ac 88 10 00    	mov    %edx,0x1088ac(%eax)
	if(i==NPROCS) return -1;
	uint32_t aim_stk_top;
	aim_stk_top = PROC1_STACK_ADDR + PROC_STACK_SIZE * i;
	proc_array[i].p_state = P_RUNNABLE;
	proc_array[i].p_registers = current->p_registers;
	proc_array[i].p_registers.reg_eip = current->p_registers.reg_eax;
  1001b1:	8b 4b 20             	mov    0x20(%ebx),%ecx
  1001b4:	89 88 a0 88 10 00    	mov    %ecx,0x1088a0(%eax)
	proc_array[i].p_registers.reg_esp = aim_stk_top;
	return proc_array[i].p_pid;
  1001ba:	8b 80 6c 88 10 00    	mov    0x10886c(%eax),%eax
  1001c0:	eb 0c                	jmp    1001ce <interrupt+0x113>

static pid_t
new_thread() 
{
	int i;
	for(i=1; i<NPROCS; i++) {
  1001c2:	42                   	inc    %edx
  1001c3:	83 c0 54             	add    $0x54,%eax
  1001c6:	83 fa 10             	cmp    $0x10,%edx
  1001c9:	75 b8                	jne    100183 <interrupt+0xc8>
  1001cb:	83 c8 ff             	or     $0xffffffff,%eax
//		schedule();

		run(current);	
	}
	case INT_SYS_NEWTHREAD:
		current->p_registers.reg_eax = new_thread();
  1001ce:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  1001d1:	83 ec 0c             	sub    $0xc,%esp
  1001d4:	53                   	push   %ebx
  1001d5:	e8 5a 03 00 00       	call   100534 <run>
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1001da:	8b 03                	mov    (%ebx),%eax
  1001dc:	eb f0                	jmp    1001ce <interrupt+0x113>
		run(current);
  1001de:	b8 08 89 10 00       	mov    $0x108908,%eax
  1001e3:	bd 01 00 00 00       	mov    $0x1,%ebp
	//                What should sys_fork() return to the child process?)
	// You need to set one other process descriptor field as well.
	// Finally, return the child's process ID to the parent.
	int i;
	for(i=1; i<NPROCS; i++) {
		if(proc_array[i].p_state == P_EMPTY) break;		
  1001e8:	83 38 00             	cmpl   $0x0,(%eax)
  1001eb:	75 65                	jne    100252 <interrupt+0x197>
	}
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
  1001ed:	6b ed 54             	imul   $0x54,%ebp,%ebp
  1001f0:	b9 11 00 00 00       	mov    $0x11,%ecx

	// YOUR CODE HERE!

	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
  1001f5:	8b 03                	mov    (%ebx),%eax
	int i;
	for(i=1; i<NPROCS; i++) {
		if(proc_array[i].p_state == P_EMPTY) break;		
	}
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
  1001f7:	8d 73 04             	lea    0x4(%ebx),%esi
  1001fa:	8d 95 6c 88 10 00    	lea    0x10886c(%ebp),%edx

	// YOUR CODE HERE!

	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
  100200:	83 c0 0a             	add    $0xa,%eax
	int i;
	for(i=1; i<NPROCS; i++) {
		if(proc_array[i].p_state == P_EMPTY) break;		
	}
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
  100203:	8d 7a 04             	lea    0x4(%edx),%edi
  100206:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
	dest_stack_top = dest->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE: calculate based on the
			 other variables */
	dest_stack_bottom = dest_stack_top - stack_size;
  100208:	8b b5 6c 88 10 00    	mov    0x10886c(%ebp),%esi

	// YOUR CODE HERE!

	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
  10020e:	c1 e0 12             	shl    $0x12,%eax
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
  100211:	8b 4b 40             	mov    0x40(%ebx),%ecx
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
	dest_stack_top = dest->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE: calculate based on the
			 other variables */
	dest_stack_bottom = dest_stack_top - stack_size;
  100214:	83 c6 0a             	add    $0xa,%esi
  100217:	c1 e6 12             	shl    $0x12,%esi
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, (size_t)stack_size + 1);
  10021a:	57                   	push   %edi

	// YOUR CODE HERE!

	src_stack_top = src->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE */;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
  10021b:	29 c8                	sub    %ecx,%eax
	dest_stack_top = dest->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE: calculate based on the
			 other variables */
	dest_stack_bottom = dest_stack_top - stack_size;
  10021d:	29 c6                	sub    %eax,%esi
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, (size_t)stack_size + 1);
  10021f:	40                   	inc    %eax
  100220:	50                   	push   %eax
  100221:	51                   	push   %ecx
  100222:	56                   	push   %esi
  100223:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  100227:	e8 e0 03 00 00       	call   10060c <memcpy>
        dest->p_registers.reg_esp = dest_stack_bottom;
  10022c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
	copy_stack(&proc_array[i], parent);
	proc_array[i].p_state = P_RUNNABLE;
        proc_array[i].p_registers.reg_eax = 0;
	return proc_array[i].p_pid;
  100230:	83 c4 10             	add    $0x10,%esp
		if(proc_array[i].p_state == P_EMPTY) break;		
	}
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
	copy_stack(&proc_array[i], parent);
	proc_array[i].p_state = P_RUNNABLE;
  100233:	c7 85 b4 88 10 00 01 	movl   $0x1,0x1088b4(%ebp)
  10023a:	00 00 00 
        proc_array[i].p_registers.reg_eax = 0;
	return proc_array[i].p_pid;
  10023d:	8b 85 6c 88 10 00    	mov    0x10886c(%ebp),%eax
	}
	if(i==NPROCS) return -1;
	proc_array[i].p_registers = parent->p_registers;
	copy_stack(&proc_array[i], parent);
	proc_array[i].p_state = P_RUNNABLE;
        proc_array[i].p_registers.reg_eax = 0;
  100243:	c7 85 8c 88 10 00 00 	movl   $0x0,0x10888c(%ebp)
  10024a:	00 00 00 
	uint32_t  stack_size = src_stack_top - src_stack_bottom;
	dest_stack_top = dest->p_pid * PROC_STACK_SIZE + PROC1_STACK_ADDR; /* YOUR CODE HERE: calculate based on the
			 other variables */
	dest_stack_bottom = dest_stack_top - stack_size;
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, (size_t)stack_size + 1);
        dest->p_registers.reg_esp = dest_stack_bottom;
  10024d:	89 72 40             	mov    %esi,0x40(%edx)
  100250:	eb 0c                	jmp    10025e <interrupt+0x1a3>
	//   * ???????    There is one other difference.  What is it?  (Hint:
	//                What should sys_fork() return to the child process?)
	// You need to set one other process descriptor field as well.
	// Finally, return the child's process ID to the parent.
	int i;
	for(i=1; i<NPROCS; i++) {
  100252:	45                   	inc    %ebp
  100253:	83 c0 54             	add    $0x54,%eax
  100256:	83 fd 10             	cmp    $0x10,%ebp
  100259:	75 8d                	jne    1001e8 <interrupt+0x12d>
  10025b:	83 c8 ff             	or     $0xffffffff,%eax
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  10025e:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  100261:	83 ec 0c             	sub    $0xc,%esp
  100264:	ff 35 14 96 10 00    	pushl  0x109614
  10026a:	e9 66 ff ff ff       	jmp    1001d5 <interrupt+0x11a>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  10026f:	e8 18 fe ff ff       	call   10008c <schedule>
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		//	current->p_state = P_ZOMBIE;
		//	current->p_exit_status = current->p_registers.reg_eax;
		//	schedule();
		current->p_state = P_ZOMBIE;
  100274:	8b 15 14 96 10 00    	mov    0x109614,%edx
		int i;
		for(i=1; i<NPROCS; i++) {
			if(proc_array[i].waiting_pid == current->p_pid) {
  10027a:	31 c0                	xor    %eax,%eax
  10027c:	8b 1a                	mov    (%edx),%ebx
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		//	current->p_state = P_ZOMBIE;
		//	current->p_exit_status = current->p_registers.reg_eax;
		//	schedule();
		current->p_state = P_ZOMBIE;
  10027e:	c7 42 48 03 00 00 00 	movl   $0x3,0x48(%edx)
		int i;
		for(i=1; i<NPROCS; i++) {
			if(proc_array[i].waiting_pid == current->p_pid) {
  100285:	39 98 10 89 10 00    	cmp    %ebx,0x108910(%eax)
  10028b:	75 27                	jne    1002b4 <interrupt+0x1f9>
				proc_array[i].p_state = P_RUNNABLE;
				current->p_state = P_EMPTY;
				current->p_exit_status = current->p_registers.reg_eax;				
  10028d:	8b 4a 20             	mov    0x20(%edx),%ecx
		//	schedule();
		current->p_state = P_ZOMBIE;
		int i;
		for(i=1; i<NPROCS; i++) {
			if(proc_array[i].waiting_pid == current->p_pid) {
				proc_array[i].p_state = P_RUNNABLE;
  100290:	c7 80 08 89 10 00 01 	movl   $0x1,0x108908(%eax)
  100297:	00 00 00 
				current->p_state = P_EMPTY;
				current->p_exit_status = current->p_registers.reg_eax;				
				proc_array[i].p_registers.reg_eax = current->p_exit_status;
				proc_array[i].waiting_pid = 0;
  10029a:	c7 80 10 89 10 00 00 	movl   $0x0,0x108910(%eax)
  1002a1:	00 00 00 
		current->p_state = P_ZOMBIE;
		int i;
		for(i=1; i<NPROCS; i++) {
			if(proc_array[i].waiting_pid == current->p_pid) {
				proc_array[i].p_state = P_RUNNABLE;
				current->p_state = P_EMPTY;
  1002a4:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
				current->p_exit_status = current->p_registers.reg_eax;				
  1002ab:	89 4a 4c             	mov    %ecx,0x4c(%edx)
				proc_array[i].p_registers.reg_eax = current->p_exit_status;
  1002ae:	89 88 e0 88 10 00    	mov    %ecx,0x1088e0(%eax)
				proc_array[i].waiting_pid = 0;
  1002b4:	83 c0 54             	add    $0x54,%eax
		//	current->p_state = P_ZOMBIE;
		//	current->p_exit_status = current->p_registers.reg_eax;
		//	schedule();
		current->p_state = P_ZOMBIE;
		int i;
		for(i=1; i<NPROCS; i++) {
  1002b7:	3d ec 04 00 00       	cmp    $0x4ec,%eax
  1002bc:	75 c7                	jne    100285 <interrupt+0x1ca>
				proc_array[i].p_registers.reg_eax = current->p_exit_status;
				proc_array[i].waiting_pid = 0;
			}

		}
		schedule();
  1002be:	e8 c9 fd ff ff       	call   10008c <schedule>
		// * The current process.
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)
	        pid_t p = current->p_registers.reg_eax;	
  1002c3:	a1 14 96 10 00       	mov    0x109614,%eax
  1002c8:	8b 50 20             	mov    0x20(%eax),%edx
		if(p <= 0 || p >= NPROCS || p == current->p_pid || proc_array[p].p_state == P_EMPTY) current->p_registers.reg_eax = -1;
  1002cb:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1002ce:	83 f9 0e             	cmp    $0xe,%ecx
  1002d1:	77 14                	ja     1002e7 <interrupt+0x22c>
  1002d3:	3b 10                	cmp    (%eax),%edx
  1002d5:	74 10                	je     1002e7 <interrupt+0x22c>
  1002d7:	6b da 54             	imul   $0x54,%edx,%ebx
  1002da:	8d 8b 74 88 10 00    	lea    0x108874(%ebx),%ecx
  1002e0:	8b 71 40             	mov    0x40(%ecx),%esi
  1002e3:	85 f6                	test   %esi,%esi
  1002e5:	75 09                	jne    1002f0 <interrupt+0x235>
  1002e7:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
  1002ee:	eb 21                	jmp    100311 <interrupt+0x256>
		else if (proc_array[p].p_state == P_ZOMBIE) {
  1002f0:	83 fe 03             	cmp    $0x3,%esi
  1002f3:	75 12                	jne    100307 <interrupt+0x24c>
		     	current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1002f5:	8b 93 b8 88 10 00    	mov    0x1088b8(%ebx),%edx
			proc_array[p].p_state = P_EMPTY;
  1002fb:	c7 41 40 00 00 00 00 	movl   $0x0,0x40(%ecx)
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)
	        pid_t p = current->p_registers.reg_eax;	
		if(p <= 0 || p >= NPROCS || p == current->p_pid || proc_array[p].p_state == P_EMPTY) current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE) {
		     	current->p_registers.reg_eax = proc_array[p].p_exit_status;
  100302:	89 50 20             	mov    %edx,0x20(%eax)
  100305:	eb 0a                	jmp    100311 <interrupt+0x256>
			proc_array[p].p_state = P_EMPTY;
		} else {
			current->waiting_pid = p;
  100307:	89 50 50             	mov    %edx,0x50(%eax)
 			current->p_state = P_BLOCKED;
  10030a:	c7 40 48 02 00 00 00 	movl   $0x2,0x48(%eax)
		}
		schedule();
  100311:	e8 76 fd ff ff       	call   10008c <schedule>
  100316:	eb fe                	jmp    100316 <interrupt+0x25b>

00100318 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  100318:	53                   	push   %ebx
  100319:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  10031c:	68 40 05 00 00       	push   $0x540
  100321:	6a 00                	push   $0x0
  100323:	68 6c 88 10 00       	push   $0x10886c
  100328:	e8 43 03 00 00       	call   100670 <memset>
  10032d:	ba 6c 88 10 00       	mov    $0x10886c,%edx
  100332:	31 c0                	xor    %eax,%eax
  100334:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100337:	89 02                	mov    %eax,(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100339:	40                   	inc    %eax
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  10033a:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100341:	83 c2 54             	add    $0x54,%edx
  100344:	83 f8 10             	cmp    $0x10,%eax
  100347:	75 ee                	jne    100337 <start+0x1f>
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  100349:	c7 05 14 96 10 00 c0 	movl   $0x1088c0,0x109614
  100350:	88 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100353:	e8 74 00 00 00       	call   1003cc <segments_init>
	special_registers_init(current);
  100358:	83 ec 0c             	sub    $0xc,%esp
  10035b:	ff 35 14 96 10 00    	pushl  0x109614
  100361:	e8 e5 01 00 00       	call   10054b <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  100366:	e8 30 01 00 00       	call   10049b <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  10036b:	83 c4 0c             	add    $0xc,%esp
  10036e:	68 08 0b 10 00       	push   $0x100b08
  100373:	68 00 07 00 00       	push   $0x700
  100378:	ff 35 00 00 06 00    	pushl  0x60000
  10037e:	e8 4f 07 00 00       	call   100ad2 <console_printf>
  100383:	83 c4 10             	add    $0x10,%esp
  100386:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  10038b:	e8 4e 01 00 00       	call   1004de <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  100390:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100393:	83 fb 01             	cmp    $0x1,%ebx
  100396:	77 f3                	ja     10038b <start+0x73>
	console_clear();
  100398:	e8 fe 00 00 00       	call   10049b <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  10039d:	50                   	push   %eax
  10039e:	50                   	push   %eax
  10039f:	a1 14 96 10 00       	mov    0x109614,%eax
  1003a4:	83 c0 34             	add    $0x34,%eax
  1003a7:	50                   	push   %eax
  1003a8:	53                   	push   %ebx
  1003a9:	e8 d2 01 00 00       	call   100580 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  1003ae:	a1 14 96 10 00       	mov    0x109614,%eax
  1003b3:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  1003ba:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  1003c1:	89 04 24             	mov    %eax,(%esp)
  1003c4:	e8 6b 01 00 00       	call   100534 <run>
  1003c9:	90                   	nop
  1003ca:	90                   	nop
  1003cb:	90                   	nop

001003cc <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1003cc:	b8 ac 8d 10 00       	mov    $0x108dac,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003d1:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1003d6:	89 c2                	mov    %eax,%edx
  1003d8:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  1003db:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003dc:	bb 56 00 10 00       	mov    $0x100056,%ebx
  1003e1:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1003e4:	66 a3 3a 10 10 00    	mov    %ax,0x10103a
  1003ea:	c1 e8 18             	shr    $0x18,%eax
  1003ed:	88 15 3c 10 10 00    	mov    %dl,0x10103c
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003f3:	ba 14 8e 10 00       	mov    $0x108e14,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1003f8:	a2 3f 10 10 00       	mov    %al,0x10103f
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1003fd:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1003ff:	66 c7 05 38 10 10 00 	movw   $0x68,0x101038
  100406:	68 00 
  100408:	c6 05 3e 10 10 00 40 	movb   $0x40,0x10103e
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  10040f:	c6 05 3d 10 10 00 89 	movb   $0x89,0x10103d

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  100416:	c7 05 b0 8d 10 00 00 	movl   $0x80000,0x108db0
  10041d:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  100420:	66 c7 05 b4 8d 10 00 	movw   $0x10,0x108db4
  100427:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100429:	66 89 0c c5 14 8e 10 	mov    %cx,0x108e14(,%eax,8)
  100430:	00 
  100431:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100438:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10043d:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  100442:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  100447:	40                   	inc    %eax
  100448:	3d 00 01 00 00       	cmp    $0x100,%eax
  10044d:	75 da                	jne    100429 <segments_init+0x5d>
  10044f:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  100453:	ba 14 8e 10 00       	mov    $0x108e14,%edx
  100458:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  10045f:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100466:	66 89 0c c5 14 8e 10 	mov    %cx,0x108e14(,%eax,8)
  10046d:	00 
  10046e:	c1 e9 10             	shr    $0x10,%ecx
  100471:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100476:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  10047b:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100480:	40                   	inc    %eax
  100481:	83 f8 3a             	cmp    $0x3a,%eax
  100484:	75 d2                	jne    100458 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  100486:	b0 28                	mov    $0x28,%al
  100488:	0f 01 15 00 10 10 00 	lgdtl  0x101000
  10048f:	0f 00 d8             	ltr    %ax
  100492:	0f 01 1d 08 10 10 00 	lidtl  0x101008
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  100499:	5b                   	pop    %ebx
  10049a:	c3                   	ret    

0010049b <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  10049b:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  10049c:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  10049e:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  10049f:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  1004a6:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  1004a9:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  1004b0:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  1004b3:	40                   	inc    %eax
  1004b4:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  1004b9:	75 ee                	jne    1004a9 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1004bb:	be d4 03 00 00       	mov    $0x3d4,%esi
  1004c0:	b0 0e                	mov    $0xe,%al
  1004c2:	89 f2                	mov    %esi,%edx
  1004c4:	ee                   	out    %al,(%dx)
  1004c5:	31 c9                	xor    %ecx,%ecx
  1004c7:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1004cc:	88 c8                	mov    %cl,%al
  1004ce:	89 da                	mov    %ebx,%edx
  1004d0:	ee                   	out    %al,(%dx)
  1004d1:	b0 0f                	mov    $0xf,%al
  1004d3:	89 f2                	mov    %esi,%edx
  1004d5:	ee                   	out    %al,(%dx)
  1004d6:	88 c8                	mov    %cl,%al
  1004d8:	89 da                	mov    %ebx,%edx
  1004da:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  1004db:	5b                   	pop    %ebx
  1004dc:	5e                   	pop    %esi
  1004dd:	c3                   	ret    

001004de <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1004de:	ba 64 00 00 00       	mov    $0x64,%edx
  1004e3:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  1004e4:	a8 01                	test   $0x1,%al
  1004e6:	74 45                	je     10052d <console_read_digit+0x4f>
  1004e8:	b2 60                	mov    $0x60,%dl
  1004ea:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  1004eb:	8d 50 fe             	lea    -0x2(%eax),%edx
  1004ee:	80 fa 08             	cmp    $0x8,%dl
  1004f1:	77 05                	ja     1004f8 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  1004f3:	0f b6 c0             	movzbl %al,%eax
  1004f6:	48                   	dec    %eax
  1004f7:	c3                   	ret    
	else if (data == 0x0B)
  1004f8:	3c 0b                	cmp    $0xb,%al
  1004fa:	74 35                	je     100531 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  1004fc:	8d 50 b9             	lea    -0x47(%eax),%edx
  1004ff:	80 fa 02             	cmp    $0x2,%dl
  100502:	77 07                	ja     10050b <console_read_digit+0x2d>
		return data - 0x47 + 7;
  100504:	0f b6 c0             	movzbl %al,%eax
  100507:	83 e8 40             	sub    $0x40,%eax
  10050a:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  10050b:	8d 50 b5             	lea    -0x4b(%eax),%edx
  10050e:	80 fa 02             	cmp    $0x2,%dl
  100511:	77 07                	ja     10051a <console_read_digit+0x3c>
		return data - 0x4B + 4;
  100513:	0f b6 c0             	movzbl %al,%eax
  100516:	83 e8 47             	sub    $0x47,%eax
  100519:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  10051a:	8d 50 b1             	lea    -0x4f(%eax),%edx
  10051d:	80 fa 02             	cmp    $0x2,%dl
  100520:	77 07                	ja     100529 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  100522:	0f b6 c0             	movzbl %al,%eax
  100525:	83 e8 4e             	sub    $0x4e,%eax
  100528:	c3                   	ret    
	else if (data == 0x53)
  100529:	3c 53                	cmp    $0x53,%al
  10052b:	74 04                	je     100531 <console_read_digit+0x53>
  10052d:	83 c8 ff             	or     $0xffffffff,%eax
  100530:	c3                   	ret    
  100531:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  100533:	c3                   	ret    

00100534 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  100534:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100538:	a3 14 96 10 00       	mov    %eax,0x109614

	asm volatile("movl %0,%%esp\n\t"
  10053d:	83 c0 04             	add    $0x4,%eax
  100540:	89 c4                	mov    %eax,%esp
  100542:	61                   	popa   
  100543:	07                   	pop    %es
  100544:	1f                   	pop    %ds
  100545:	83 c4 08             	add    $0x8,%esp
  100548:	cf                   	iret   
  100549:	eb fe                	jmp    100549 <run+0x15>

0010054b <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  10054b:	53                   	push   %ebx
  10054c:	83 ec 0c             	sub    $0xc,%esp
  10054f:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  100553:	6a 44                	push   $0x44
  100555:	6a 00                	push   $0x0
  100557:	8d 43 04             	lea    0x4(%ebx),%eax
  10055a:	50                   	push   %eax
  10055b:	e8 10 01 00 00       	call   100670 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100560:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  100566:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  10056c:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  100572:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  100578:	83 c4 18             	add    $0x18,%esp
  10057b:	5b                   	pop    %ebx
  10057c:	c3                   	ret    
  10057d:	90                   	nop
  10057e:	90                   	nop
  10057f:	90                   	nop

00100580 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100580:	55                   	push   %ebp
  100581:	57                   	push   %edi
  100582:	56                   	push   %esi
  100583:	53                   	push   %ebx
  100584:	83 ec 1c             	sub    $0x1c,%esp
  100587:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  10058b:	83 f8 01             	cmp    $0x1,%eax
  10058e:	7f 04                	jg     100594 <program_loader+0x14>
  100590:	85 c0                	test   %eax,%eax
  100592:	79 02                	jns    100596 <program_loader+0x16>
  100594:	eb fe                	jmp    100594 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  100596:	8b 34 c5 40 10 10 00 	mov    0x101040(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  10059d:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  1005a3:	74 02                	je     1005a7 <program_loader+0x27>
  1005a5:	eb fe                	jmp    1005a5 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1005a7:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  1005aa:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1005ae:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  1005b0:	c1 e5 05             	shl    $0x5,%ebp
  1005b3:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  1005b6:	eb 3f                	jmp    1005f7 <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  1005b8:	83 3b 01             	cmpl   $0x1,(%ebx)
  1005bb:	75 37                	jne    1005f4 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  1005bd:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1005c0:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  1005c3:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1005c6:	01 c7                	add    %eax,%edi
	memsz += va;
  1005c8:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  1005ca:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  1005cf:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  1005d3:	52                   	push   %edx
  1005d4:	89 fa                	mov    %edi,%edx
  1005d6:	29 c2                	sub    %eax,%edx
  1005d8:	52                   	push   %edx
  1005d9:	8b 53 04             	mov    0x4(%ebx),%edx
  1005dc:	01 f2                	add    %esi,%edx
  1005de:	52                   	push   %edx
  1005df:	50                   	push   %eax
  1005e0:	e8 27 00 00 00       	call   10060c <memcpy>
  1005e5:	83 c4 10             	add    $0x10,%esp
  1005e8:	eb 04                	jmp    1005ee <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  1005ea:	c6 07 00             	movb   $0x0,(%edi)
  1005ed:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1005ee:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  1005f2:	72 f6                	jb     1005ea <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  1005f4:	83 c3 20             	add    $0x20,%ebx
  1005f7:	39 eb                	cmp    %ebp,%ebx
  1005f9:	72 bd                	jb     1005b8 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  1005fb:	8b 56 18             	mov    0x18(%esi),%edx
  1005fe:	8b 44 24 34          	mov    0x34(%esp),%eax
  100602:	89 10                	mov    %edx,(%eax)
}
  100604:	83 c4 1c             	add    $0x1c,%esp
  100607:	5b                   	pop    %ebx
  100608:	5e                   	pop    %esi
  100609:	5f                   	pop    %edi
  10060a:	5d                   	pop    %ebp
  10060b:	c3                   	ret    

0010060c <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  10060c:	56                   	push   %esi
  10060d:	31 d2                	xor    %edx,%edx
  10060f:	53                   	push   %ebx
  100610:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100614:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100618:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  10061c:	eb 08                	jmp    100626 <memcpy+0x1a>
		*d++ = *s++;
  10061e:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  100621:	4e                   	dec    %esi
  100622:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100625:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100626:	85 f6                	test   %esi,%esi
  100628:	75 f4                	jne    10061e <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  10062a:	5b                   	pop    %ebx
  10062b:	5e                   	pop    %esi
  10062c:	c3                   	ret    

0010062d <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  10062d:	57                   	push   %edi
  10062e:	56                   	push   %esi
  10062f:	53                   	push   %ebx
  100630:	8b 44 24 10          	mov    0x10(%esp),%eax
  100634:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100638:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  10063c:	39 c7                	cmp    %eax,%edi
  10063e:	73 26                	jae    100666 <memmove+0x39>
  100640:	8d 34 17             	lea    (%edi,%edx,1),%esi
  100643:	39 c6                	cmp    %eax,%esi
  100645:	76 1f                	jbe    100666 <memmove+0x39>
		s += n, d += n;
  100647:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  10064a:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  10064c:	eb 07                	jmp    100655 <memmove+0x28>
			*--d = *--s;
  10064e:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100651:	4a                   	dec    %edx
  100652:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100655:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  100656:	85 d2                	test   %edx,%edx
  100658:	75 f4                	jne    10064e <memmove+0x21>
  10065a:	eb 10                	jmp    10066c <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  10065c:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  10065f:	4a                   	dec    %edx
  100660:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  100663:	41                   	inc    %ecx
  100664:	eb 02                	jmp    100668 <memmove+0x3b>
  100666:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  100668:	85 d2                	test   %edx,%edx
  10066a:	75 f0                	jne    10065c <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  10066c:	5b                   	pop    %ebx
  10066d:	5e                   	pop    %esi
  10066e:	5f                   	pop    %edi
  10066f:	c3                   	ret    

00100670 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100670:	53                   	push   %ebx
  100671:	8b 44 24 08          	mov    0x8(%esp),%eax
  100675:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100679:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  10067d:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  10067f:	eb 04                	jmp    100685 <memset+0x15>
		*p++ = c;
  100681:	88 1a                	mov    %bl,(%edx)
  100683:	49                   	dec    %ecx
  100684:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100685:	85 c9                	test   %ecx,%ecx
  100687:	75 f8                	jne    100681 <memset+0x11>
		*p++ = c;
	return v;
}
  100689:	5b                   	pop    %ebx
  10068a:	c3                   	ret    

0010068b <strlen>:

size_t
strlen(const char *s)
{
  10068b:	8b 54 24 04          	mov    0x4(%esp),%edx
  10068f:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100691:	eb 01                	jmp    100694 <strlen+0x9>
		++n;
  100693:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100694:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100698:	75 f9                	jne    100693 <strlen+0x8>
		++n;
	return n;
}
  10069a:	c3                   	ret    

0010069b <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  10069b:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  10069f:	31 c0                	xor    %eax,%eax
  1006a1:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1006a5:	eb 01                	jmp    1006a8 <strnlen+0xd>
		++n;
  1006a7:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1006a8:	39 d0                	cmp    %edx,%eax
  1006aa:	74 06                	je     1006b2 <strnlen+0x17>
  1006ac:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  1006b0:	75 f5                	jne    1006a7 <strnlen+0xc>
		++n;
	return n;
}
  1006b2:	c3                   	ret    

001006b3 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1006b3:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  1006b4:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1006b9:	53                   	push   %ebx
  1006ba:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  1006bc:	76 05                	jbe    1006c3 <console_putc+0x10>
  1006be:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  1006c3:	80 fa 0a             	cmp    $0xa,%dl
  1006c6:	75 2c                	jne    1006f4 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1006c8:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  1006ce:	be 50 00 00 00       	mov    $0x50,%esi
  1006d3:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  1006d5:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1006d8:	99                   	cltd   
  1006d9:	f7 fe                	idiv   %esi
  1006db:	89 de                	mov    %ebx,%esi
  1006dd:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  1006df:	eb 07                	jmp    1006e8 <console_putc+0x35>
			*cursor++ = ' ' | color;
  1006e1:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1006e4:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  1006e5:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1006e8:	83 f8 50             	cmp    $0x50,%eax
  1006eb:	75 f4                	jne    1006e1 <console_putc+0x2e>
  1006ed:	29 d0                	sub    %edx,%eax
  1006ef:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  1006f2:	eb 0b                	jmp    1006ff <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  1006f4:	0f b6 d2             	movzbl %dl,%edx
  1006f7:	09 ca                	or     %ecx,%edx
  1006f9:	66 89 13             	mov    %dx,(%ebx)
  1006fc:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  1006ff:	5b                   	pop    %ebx
  100700:	5e                   	pop    %esi
  100701:	c3                   	ret    

00100702 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  100702:	56                   	push   %esi
  100703:	53                   	push   %ebx
  100704:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  100708:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10070b:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  10070f:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  100714:	75 04                	jne    10071a <fill_numbuf+0x18>
  100716:	85 d2                	test   %edx,%edx
  100718:	74 10                	je     10072a <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  10071a:	89 d0                	mov    %edx,%eax
  10071c:	31 d2                	xor    %edx,%edx
  10071e:	f7 f1                	div    %ecx
  100720:	4b                   	dec    %ebx
  100721:	8a 14 16             	mov    (%esi,%edx,1),%dl
  100724:	88 13                	mov    %dl,(%ebx)
			val /= base;
  100726:	89 c2                	mov    %eax,%edx
  100728:	eb ec                	jmp    100716 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  10072a:	89 d8                	mov    %ebx,%eax
  10072c:	5b                   	pop    %ebx
  10072d:	5e                   	pop    %esi
  10072e:	c3                   	ret    

0010072f <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  10072f:	55                   	push   %ebp
  100730:	57                   	push   %edi
  100731:	56                   	push   %esi
  100732:	53                   	push   %ebx
  100733:	83 ec 38             	sub    $0x38,%esp
  100736:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  10073a:	8b 7c 24 54          	mov    0x54(%esp),%edi
  10073e:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100742:	e9 60 03 00 00       	jmp    100aa7 <console_vprintf+0x378>
		if (*format != '%') {
  100747:	80 fa 25             	cmp    $0x25,%dl
  10074a:	74 13                	je     10075f <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  10074c:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100750:	0f b6 d2             	movzbl %dl,%edx
  100753:	89 f0                	mov    %esi,%eax
  100755:	e8 59 ff ff ff       	call   1006b3 <console_putc>
  10075a:	e9 45 03 00 00       	jmp    100aa4 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10075f:	47                   	inc    %edi
  100760:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  100767:	00 
  100768:	eb 12                	jmp    10077c <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  10076a:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  10076b:	8a 11                	mov    (%ecx),%dl
  10076d:	84 d2                	test   %dl,%dl
  10076f:	74 1a                	je     10078b <console_vprintf+0x5c>
  100771:	89 e8                	mov    %ebp,%eax
  100773:	38 c2                	cmp    %al,%dl
  100775:	75 f3                	jne    10076a <console_vprintf+0x3b>
  100777:	e9 3f 03 00 00       	jmp    100abb <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10077c:	8a 17                	mov    (%edi),%dl
  10077e:	84 d2                	test   %dl,%dl
  100780:	74 0b                	je     10078d <console_vprintf+0x5e>
  100782:	b9 3c 0b 10 00       	mov    $0x100b3c,%ecx
  100787:	89 d5                	mov    %edx,%ebp
  100789:	eb e0                	jmp    10076b <console_vprintf+0x3c>
  10078b:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  10078d:	8d 42 cf             	lea    -0x31(%edx),%eax
  100790:	3c 08                	cmp    $0x8,%al
  100792:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  100799:	00 
  10079a:	76 13                	jbe    1007af <console_vprintf+0x80>
  10079c:	eb 1d                	jmp    1007bb <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  10079e:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  1007a3:	0f be c0             	movsbl %al,%eax
  1007a6:	47                   	inc    %edi
  1007a7:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  1007ab:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  1007af:	8a 07                	mov    (%edi),%al
  1007b1:	8d 50 d0             	lea    -0x30(%eax),%edx
  1007b4:	80 fa 09             	cmp    $0x9,%dl
  1007b7:	76 e5                	jbe    10079e <console_vprintf+0x6f>
  1007b9:	eb 18                	jmp    1007d3 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  1007bb:	80 fa 2a             	cmp    $0x2a,%dl
  1007be:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  1007c5:	ff 
  1007c6:	75 0b                	jne    1007d3 <console_vprintf+0xa4>
			width = va_arg(val, int);
  1007c8:	83 c3 04             	add    $0x4,%ebx
			++format;
  1007cb:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  1007cc:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007cf:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  1007d3:	83 cd ff             	or     $0xffffffff,%ebp
  1007d6:	80 3f 2e             	cmpb   $0x2e,(%edi)
  1007d9:	75 37                	jne    100812 <console_vprintf+0xe3>
			++format;
  1007db:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  1007dc:	31 ed                	xor    %ebp,%ebp
  1007de:	8a 07                	mov    (%edi),%al
  1007e0:	8d 50 d0             	lea    -0x30(%eax),%edx
  1007e3:	80 fa 09             	cmp    $0x9,%dl
  1007e6:	76 0d                	jbe    1007f5 <console_vprintf+0xc6>
  1007e8:	eb 17                	jmp    100801 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  1007ea:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1007ed:	0f be c0             	movsbl %al,%eax
  1007f0:	47                   	inc    %edi
  1007f1:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  1007f5:	8a 07                	mov    (%edi),%al
  1007f7:	8d 50 d0             	lea    -0x30(%eax),%edx
  1007fa:	80 fa 09             	cmp    $0x9,%dl
  1007fd:	76 eb                	jbe    1007ea <console_vprintf+0xbb>
  1007ff:	eb 11                	jmp    100812 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  100801:	3c 2a                	cmp    $0x2a,%al
  100803:	75 0b                	jne    100810 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  100805:	83 c3 04             	add    $0x4,%ebx
				++format;
  100808:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  100809:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  10080c:	85 ed                	test   %ebp,%ebp
  10080e:	79 02                	jns    100812 <console_vprintf+0xe3>
  100810:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  100812:	8a 07                	mov    (%edi),%al
  100814:	3c 64                	cmp    $0x64,%al
  100816:	74 34                	je     10084c <console_vprintf+0x11d>
  100818:	7f 1d                	jg     100837 <console_vprintf+0x108>
  10081a:	3c 58                	cmp    $0x58,%al
  10081c:	0f 84 a2 00 00 00    	je     1008c4 <console_vprintf+0x195>
  100822:	3c 63                	cmp    $0x63,%al
  100824:	0f 84 bf 00 00 00    	je     1008e9 <console_vprintf+0x1ba>
  10082a:	3c 43                	cmp    $0x43,%al
  10082c:	0f 85 d0 00 00 00    	jne    100902 <console_vprintf+0x1d3>
  100832:	e9 a3 00 00 00       	jmp    1008da <console_vprintf+0x1ab>
  100837:	3c 75                	cmp    $0x75,%al
  100839:	74 4d                	je     100888 <console_vprintf+0x159>
  10083b:	3c 78                	cmp    $0x78,%al
  10083d:	74 5c                	je     10089b <console_vprintf+0x16c>
  10083f:	3c 73                	cmp    $0x73,%al
  100841:	0f 85 bb 00 00 00    	jne    100902 <console_vprintf+0x1d3>
  100847:	e9 86 00 00 00       	jmp    1008d2 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  10084c:	83 c3 04             	add    $0x4,%ebx
  10084f:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  100852:	89 d1                	mov    %edx,%ecx
  100854:	c1 f9 1f             	sar    $0x1f,%ecx
  100857:	89 0c 24             	mov    %ecx,(%esp)
  10085a:	31 ca                	xor    %ecx,%edx
  10085c:	55                   	push   %ebp
  10085d:	29 ca                	sub    %ecx,%edx
  10085f:	68 44 0b 10 00       	push   $0x100b44
  100864:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100869:	8d 44 24 40          	lea    0x40(%esp),%eax
  10086d:	e8 90 fe ff ff       	call   100702 <fill_numbuf>
  100872:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  100876:	58                   	pop    %eax
  100877:	5a                   	pop    %edx
  100878:	ba 01 00 00 00       	mov    $0x1,%edx
  10087d:	8b 04 24             	mov    (%esp),%eax
  100880:	83 e0 01             	and    $0x1,%eax
  100883:	e9 a5 00 00 00       	jmp    10092d <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  100888:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  10088b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100890:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100893:	55                   	push   %ebp
  100894:	68 44 0b 10 00       	push   $0x100b44
  100899:	eb 11                	jmp    1008ac <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  10089b:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  10089e:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1008a1:	55                   	push   %ebp
  1008a2:	68 58 0b 10 00       	push   $0x100b58
  1008a7:	b9 10 00 00 00       	mov    $0x10,%ecx
  1008ac:	8d 44 24 40          	lea    0x40(%esp),%eax
  1008b0:	e8 4d fe ff ff       	call   100702 <fill_numbuf>
  1008b5:	ba 01 00 00 00       	mov    $0x1,%edx
  1008ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1008be:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  1008c0:	59                   	pop    %ecx
  1008c1:	59                   	pop    %ecx
  1008c2:	eb 69                	jmp    10092d <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  1008c4:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  1008c7:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1008ca:	55                   	push   %ebp
  1008cb:	68 44 0b 10 00       	push   $0x100b44
  1008d0:	eb d5                	jmp    1008a7 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  1008d2:	83 c3 04             	add    $0x4,%ebx
  1008d5:	8b 43 fc             	mov    -0x4(%ebx),%eax
  1008d8:	eb 40                	jmp    10091a <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  1008da:	83 c3 04             	add    $0x4,%ebx
  1008dd:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1008e0:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  1008e4:	e9 bd 01 00 00       	jmp    100aa6 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1008e9:	83 c3 04             	add    $0x4,%ebx
  1008ec:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1008ef:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  1008f3:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  1008f8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1008fc:	88 44 24 24          	mov    %al,0x24(%esp)
  100900:	eb 27                	jmp    100929 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  100902:	84 c0                	test   %al,%al
  100904:	75 02                	jne    100908 <console_vprintf+0x1d9>
  100906:	b0 25                	mov    $0x25,%al
  100908:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  10090c:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  100911:	80 3f 00             	cmpb   $0x0,(%edi)
  100914:	74 0a                	je     100920 <console_vprintf+0x1f1>
  100916:	8d 44 24 24          	lea    0x24(%esp),%eax
  10091a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10091e:	eb 09                	jmp    100929 <console_vprintf+0x1fa>
				format--;
  100920:	8d 54 24 24          	lea    0x24(%esp),%edx
  100924:	4f                   	dec    %edi
  100925:	89 54 24 04          	mov    %edx,0x4(%esp)
  100929:	31 d2                	xor    %edx,%edx
  10092b:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10092d:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  10092f:	83 fd ff             	cmp    $0xffffffff,%ebp
  100932:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100939:	74 1f                	je     10095a <console_vprintf+0x22b>
  10093b:	89 04 24             	mov    %eax,(%esp)
  10093e:	eb 01                	jmp    100941 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100940:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100941:	39 e9                	cmp    %ebp,%ecx
  100943:	74 0a                	je     10094f <console_vprintf+0x220>
  100945:	8b 44 24 04          	mov    0x4(%esp),%eax
  100949:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  10094d:	75 f1                	jne    100940 <console_vprintf+0x211>
  10094f:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100952:	89 0c 24             	mov    %ecx,(%esp)
  100955:	eb 1f                	jmp    100976 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  100957:	42                   	inc    %edx
  100958:	eb 09                	jmp    100963 <console_vprintf+0x234>
  10095a:	89 d1                	mov    %edx,%ecx
  10095c:	8b 14 24             	mov    (%esp),%edx
  10095f:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100963:	8b 44 24 04          	mov    0x4(%esp),%eax
  100967:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  10096b:	75 ea                	jne    100957 <console_vprintf+0x228>
  10096d:	8b 44 24 08          	mov    0x8(%esp),%eax
  100971:	89 14 24             	mov    %edx,(%esp)
  100974:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  100976:	85 c0                	test   %eax,%eax
  100978:	74 0c                	je     100986 <console_vprintf+0x257>
  10097a:	84 d2                	test   %dl,%dl
  10097c:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  100983:	00 
  100984:	75 24                	jne    1009aa <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  100986:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  10098b:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  100992:	00 
  100993:	75 15                	jne    1009aa <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  100995:	8b 44 24 14          	mov    0x14(%esp),%eax
  100999:	83 e0 08             	and    $0x8,%eax
  10099c:	83 f8 01             	cmp    $0x1,%eax
  10099f:	19 c9                	sbb    %ecx,%ecx
  1009a1:	f7 d1                	not    %ecx
  1009a3:	83 e1 20             	and    $0x20,%ecx
  1009a6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  1009aa:	3b 2c 24             	cmp    (%esp),%ebp
  1009ad:	7e 0d                	jle    1009bc <console_vprintf+0x28d>
  1009af:	84 d2                	test   %dl,%dl
  1009b1:	74 40                	je     1009f3 <console_vprintf+0x2c4>
			zeros = precision - len;
  1009b3:	2b 2c 24             	sub    (%esp),%ebp
  1009b6:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  1009ba:	eb 3f                	jmp    1009fb <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1009bc:	84 d2                	test   %dl,%dl
  1009be:	74 33                	je     1009f3 <console_vprintf+0x2c4>
  1009c0:	8b 44 24 14          	mov    0x14(%esp),%eax
  1009c4:	83 e0 06             	and    $0x6,%eax
  1009c7:	83 f8 02             	cmp    $0x2,%eax
  1009ca:	75 27                	jne    1009f3 <console_vprintf+0x2c4>
  1009cc:	45                   	inc    %ebp
  1009cd:	75 24                	jne    1009f3 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  1009cf:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1009d1:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  1009d4:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1009d9:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1009dc:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  1009df:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  1009e3:	7d 0e                	jge    1009f3 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  1009e5:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1009e9:	29 ca                	sub    %ecx,%edx
  1009eb:	29 c2                	sub    %eax,%edx
  1009ed:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1009f1:	eb 08                	jmp    1009fb <console_vprintf+0x2cc>
  1009f3:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1009fa:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1009fb:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1009ff:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100a01:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100a05:	2b 2c 24             	sub    (%esp),%ebp
  100a08:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100a0d:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100a10:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100a13:	29 c5                	sub    %eax,%ebp
  100a15:	89 f0                	mov    %esi,%eax
  100a17:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100a1b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a1f:	eb 0f                	jmp    100a30 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  100a21:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a25:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100a2a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100a2b:	e8 83 fc ff ff       	call   1006b3 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100a30:	85 ed                	test   %ebp,%ebp
  100a32:	7e 07                	jle    100a3b <console_vprintf+0x30c>
  100a34:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100a39:	74 e6                	je     100a21 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  100a3b:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100a40:	89 c6                	mov    %eax,%esi
  100a42:	74 23                	je     100a67 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  100a44:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100a49:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a4d:	e8 61 fc ff ff       	call   1006b3 <console_putc>
  100a52:	89 c6                	mov    %eax,%esi
  100a54:	eb 11                	jmp    100a67 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  100a56:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a5a:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100a5f:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100a60:	e8 4e fc ff ff       	call   1006b3 <console_putc>
  100a65:	eb 06                	jmp    100a6d <console_vprintf+0x33e>
  100a67:	89 f0                	mov    %esi,%eax
  100a69:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100a6d:	85 f6                	test   %esi,%esi
  100a6f:	7f e5                	jg     100a56 <console_vprintf+0x327>
  100a71:	8b 34 24             	mov    (%esp),%esi
  100a74:	eb 15                	jmp    100a8b <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  100a76:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100a7a:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  100a7b:	0f b6 11             	movzbl (%ecx),%edx
  100a7e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a82:	e8 2c fc ff ff       	call   1006b3 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100a87:	ff 44 24 04          	incl   0x4(%esp)
  100a8b:	85 f6                	test   %esi,%esi
  100a8d:	7f e7                	jg     100a76 <console_vprintf+0x347>
  100a8f:	eb 0f                	jmp    100aa0 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  100a91:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100a95:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100a9a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100a9b:	e8 13 fc ff ff       	call   1006b3 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100aa0:	85 ed                	test   %ebp,%ebp
  100aa2:	7f ed                	jg     100a91 <console_vprintf+0x362>
  100aa4:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100aa6:	47                   	inc    %edi
  100aa7:	8a 17                	mov    (%edi),%dl
  100aa9:	84 d2                	test   %dl,%dl
  100aab:	0f 85 96 fc ff ff    	jne    100747 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  100ab1:	83 c4 38             	add    $0x38,%esp
  100ab4:	89 f0                	mov    %esi,%eax
  100ab6:	5b                   	pop    %ebx
  100ab7:	5e                   	pop    %esi
  100ab8:	5f                   	pop    %edi
  100ab9:	5d                   	pop    %ebp
  100aba:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100abb:	81 e9 3c 0b 10 00    	sub    $0x100b3c,%ecx
  100ac1:	b8 01 00 00 00       	mov    $0x1,%eax
  100ac6:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100ac8:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100ac9:	09 44 24 14          	or     %eax,0x14(%esp)
  100acd:	e9 aa fc ff ff       	jmp    10077c <console_vprintf+0x4d>

00100ad2 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  100ad2:	8d 44 24 10          	lea    0x10(%esp),%eax
  100ad6:	50                   	push   %eax
  100ad7:	ff 74 24 10          	pushl  0x10(%esp)
  100adb:	ff 74 24 10          	pushl  0x10(%esp)
  100adf:	ff 74 24 10          	pushl  0x10(%esp)
  100ae3:	e8 47 fc ff ff       	call   10072f <console_vprintf>
  100ae8:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  100aeb:	c3                   	ret    
