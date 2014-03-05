/******************************************************************************
*	kernel.ld
*	 by Alex Chadwick
*
*	A linker script for generation of raspberry pi kernel images.
******************************************************************************/

SECTIONS {
        /* Link the kernel at this address: "." means the current address */
        /* Must be equal to KERNLINK */
        . = 0x80008000;


	/*
	* First and formost we need the .init section, containing the code to 
        * be run first. We allow room for the ATAGs and stack and conform to 
        * the bootloader's expectation by putting this code at 0x8000.
	*/
	.init 0x80008000 : AT(0x8000) {
		*(.init)
	}
	
	/* 
	* Next we put the rest of the code.
	*/
	.text : {
		*.c.o(.text)
		*(.text .stub .text.*)
	}

	/*
	* read-only data
	*/
	.rodata : {
		*(.rodata .rodata.*)
	}

	/* Adjust the address for the data segment to the next page */
	. = ALIGN(0x1000);
	
	/* 
	* Next we put the data.
	*/
	.data : {
		*(.data)
		*.c.o(*)
	}

	.bss : {
		*(.bss)
	}

	PROVIDE(end = .);

	/*
	* Finally comes everything else. A fun trick here is to put all other 
	* sections into this section, which will be discarded by default.
	*/
	/DISCARD/ : {
		*(.eh_frame .note.GNU-stack)
	}
}
