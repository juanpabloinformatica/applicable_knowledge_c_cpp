#include "my_math.h"
#include <stdio.h>
int
main (int argc, char *argv[])
{
  Calculator *calculator = newCalculator ();
  int a;
  int b;
#if DEBUG
  if (argc != 3)
    printf ("PASS VALUES IN ARGUMENT\n");
  return EXIT_FAILURE;
  a = atoi (argv[1]);
  b = atoi (argv[2]);
#else
  printf ("Write a:\t");
  scanf ("%i", &a);
  printf ("\n");
  printf ("Write b:\t");
  scanf ("%i", &b);
  printf ("\n");
#endif
  int result = calculator->sum (a, b);
  destroyCalculator (calculator);
  printf ("Result:\t%i", result);
  printf ("\n");
}
