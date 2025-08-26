#include "my_math.h"

int
cal_sum (int a, int b)
{
  return a + b;
}
int
cal_diff (int a, int b)
{
  return a - b;
}
int
cal_div (int a, int b)
{
  return a / b;
}
int
cal_mult (int a, int b)
{
  return a * b;
}

Calculator *
newCalculator ()
{
  Calculator *calculator_ptr = calloc (1, sizeof (Calculator));
  if (calculator_ptr == NULL)
    return NULL;
  calculator_ptr->sum = cal_sum;
  calculator_ptr->diff = cal_diff;
  calculator_ptr->div = cal_div;
  calculator_ptr->mult = cal_mult;
  return calculator_ptr;
}
void
destroyCalculator (Calculator *calculator)
{
  free (calculator);
}
