#include "test_calculator.hpp"
#include <gtest/gtest.h>

void
CalculatorTest::SetUp ()
{
  this->calculator = newCalculator ();
}
void
CalculatorTest::TearDown ()
{
  destroyCalculator (this->calculator);
}

TEST_F (CalculatorTest, testAdd)
{
  // ASSERT_EQ (this->calculator->sum (5, 5), 5);
  // ASSERT_EQ (this->calculator->sum (-5, 5), 0);
}

