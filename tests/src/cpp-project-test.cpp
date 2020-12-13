#include "cpp-project.h"
#include "gtest/gtest.h"

TEST(cpp_project_test, demo)
{
  EXPECT_EQ(cpp_project::add(1, 2), 3);
}

TEST(cpp_project_test, foo)
{
  EXPECT_EQ(cpp_project::foo::bar("BAZ"), "BAZ");
}