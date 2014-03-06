//PAGEBREAK: 36
// Layout of the trap frame built on the stack by the
// hardware and by trapasm.S, and passed to trap().
struct trapframe {
  uint trapno;
  uint spsr; // saved cpsr from the trapped/interrupted mode
  uint ifar; // Instruction Fault Address Register (IFAR)
  uint cpsr;
  uint sp; // user mode sp
  uint lr;  // return address of the interrupted code
  uint r12;
  uint r11; 
  uint r10;
  uint r9;
  uint r8;
  uint r7;
  uint r6;
  uint r5;
  uint r4;
  uint r3;
  uint r2;
  uint r1;
  uint r0;
};

