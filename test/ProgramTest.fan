class ProgramTest : Test
{
  Void testProgram()
  {
    verifyEq(BfStr("#+").instructions.size, 2)
  }

  Void testUncommentedProgram()
  {
    optimized := Uncomment().apply(BfStr("#+#"))
    verifyEq(optimized.size, 1)
    verifyType(optimized[0], AddData#)
  }

  Void testGroupOptimization()
  {
    programs := ["#+++#", "#---#", "#>>>#", "#<<<#"]
    types    := [AddData#, SubData#, AddDp#, SubDp#]

    4.times |i|
    {
      program := BfStr(programs[i])
      verifyEq(program.size, 5)
      optimized := Group().apply(program)
      verifyEq(optimized.size, 3)
      verifyType(optimized[1], types[i])
      verifyEq(optimized[1]->amount, 3)
    }
  }
}
