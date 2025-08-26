#ifndef __CALCULATOR_TEST__
#define __CALCULATOR_TEST__
#include <gtest/gtest.h>
extern "C"
{
#include "my_math.h"
}
using ::testing::Test;
class CalculatorTest : public Test
{
protected:
  Calculator *calculator;
  void SetUp () override;
  void TearDown () override;
};
#endif
