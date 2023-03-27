#include <string.h>

#include "ex1.h"

/* Returns the number of times LETTER appears in STR.
There are two different ways to iterate through a string.
1st way hint: strlen() may be useful
2nd way hint: all strings end in a null terminator */
/*int num_occurrences(char *str, char letter)
{
    /* TODO: implement num_occurances */
 int  Total = strlen(str) ;
 int count=0;
 int i=0;
 for(i=0;i<Total;i++)
{
  if(str[i]==letter)
   {
     count++;
   }
}
return count;
}

/* Populates DNA_SEQ with the number of times each nucleotide appears.
Each sequence will end with a NULL terminator and will have up to 20 nucleotides.
All letters will be upper case. */
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    /* TODO: implement compute_nucleotide_occurances */
int Length = strlen(dna_seq->sequence);
int i=0;
 dna_seq->A_count=0;
 dna_seq->C_count=0;
 dna_seq->G_count=0;
 dna_seq->T_count=0;
for(i=0;i<Length;i++)
{
if(dna_seq->sequence[i] == 'A')
 {
  dna_seq->A_count++;
 }
else if(dna_seq->sequence[i] == 'C')
 {
  dna_seq->C_count++;
 }
else if(dna_seq->sequence[i] == 'G')
 {
  dna_seq->G_count++;
 }
else
 {
  dna_seq->T_count++;
 }
}
    return;
}

