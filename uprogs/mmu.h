#define MByte 0x100000
#define L1 0x4000
#define L2 0x3000

#define CACHELINESIZE   32

#define FEXT(d, o, w)   (((d)>>(o)) & ((1<<(w))-1))
#define L1X(va)         FEXT((va), 20, 12)
#define L2X(va)         FEXT((va), 12, 8)

/*
 * page table entries.
*/

#define Mbz             (0<<4)
#define Fault           0x00000000              /* L[12] pte: unmapped */

#define Coarse          (Mbz|1)                 /* L1 */
#define Section         (Mbz|2)                 /* L1 1MB */
#define Fine            (Mbz|3)                 /* L1 */

#define Large           0x00000001              /* L2 64KB */
#define Small           0x00000002              /* L2 4KB */
#define Tiny            0x00000003              /* L2 1KB: not in v7 */
#define Buffered        0x00000004              /* L[12]: write-back not -thru */
#define Cached          0x00000008              /* L[12] */
#define Dom0            0

#define Noaccess        0                       /* AP, DAC */
#define Krw             1                       /* AP */
/* armv7 deprecates AP[2] == 1 & AP[1:0] == 2 (Uro), prefers 3 (new in v7) */
#define Uro             2                       /* AP */
#define Urw             3                       /* AP */
#define Client          1                       /* DAC */
#define Manager         3                       /* DAC */

#define F(v, o, w)      (((v) & ((1<<(w))-1))<<(o))
#define AP(n, v)        F((v), ((n)*2)+4, 2)
#define L1AP(ap)        (AP(3, (ap)))
#define L2AP(ap) (AP(3, (ap))|AP(2, (ap))|AP(1, (ap))|AP(0, (ap))) /* pre-armv7 */
#define DAC(n, v)       F((v), (n)*2, 2)

#define HVECTORS        0xffff0000

// A virtual address 'la' has a three-part structure as follows:
//
// +--------12------+-------8--------+---------12----------+
// | Page Directory |   Page Table   | Offset within Page  |
// |      Index     |      Index     |                     |
// +----------------+----------------+---------------------+
//  \--- PDX(va) --/ \--- PTX(va) --/

// page directory index
#define PDX(va)         (((uint)(va) >> PDXSHIFT) & 0xFFF)

// page table index
#define PTX(va)         (((uint)(va) >> PTXSHIFT) & 0xFF)

// construct virtual address from indexes and offset
#define PGADDR(d, t, o) ((uint)((d) << PDXSHIFT | (t) << PTXSHIFT | (o)))

// Address in page table or page directory entry
#define PTE_ADDR(pte)   ((uint)(pte) & ~0xFFF)
#define PTE_FLAGS(pte)  ((uint)(pte) &  0xFFF)

// Page directory and page table constants.
#define NPDENTRIES      1024    // # directory entries per page directory
#define NPTENTRIES      1024    // # PTEs per page table
#define PGSIZE          4096    // bytes mapped by a page

#define PGSHIFT         12      // log2(PGSIZE)
#define PTXSHIFT        12      // offset of PTX in a linear address
#define PDXSHIFT        20      // offset of PDX in a linear address


#define PGROUNDUP(sz)  (((sz)+PGSIZE-1) & ~(PGSIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE-1))

#define PGDIR_BASE  P2V(L1)

#define KVML1ATTR       Dom0|L1AP(Urw)|Section|Cached|Buffered

#define UVML1ATTR 	Dom0|Coarse
#define UVML2ATTR	L2AP(Urw)|Cached|Buffered|Small

#define USER_MODE 0
