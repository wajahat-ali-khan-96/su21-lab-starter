#include <stdio.h>
#include "bit_ops.h"
#define BIT_MASK (1U<<n)
#define SET_BIT_MASK (v<<n)

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* YOUR CODE HERE */
    return (x & (BIT_MASK)) >> n; /* UPDATE WITH THE CORRECT RETURN VALUE*/
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    /* YOUR CODE HERE */
	*x = *x & ~(BIT_MASK);
	*x = *x | SET_BIT_MASK;
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* YOUR CODE HERE */
	*x = *x ^ BIT_MASK;
}

