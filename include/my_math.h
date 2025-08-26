#ifndef __MATH__
#define __MATH__
#include <stdlib.h>
typedef struct calculator Calculator;
struct calculator
{
  int (*sum) (int, int);
  int (*diff) (int, int);
  int (*div) (int, int);
  int (*mult) (int, int);
};
Calculator *newCalculator (void);
void destroyCalculator (Calculator *calculator);
#endif
