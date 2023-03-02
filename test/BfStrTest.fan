class BfStrTest : Test
{
  BfStr? prog

  override Void setup() { prog = BfStr("+-<>[],.") }

  override Void teardown() { prog = null }

  Void testInstructions()
  {
    verifyEq(prog[0], AddData())
    verifyEq(prog[1], SubData())
    verifyEq(prog[2], SubDp())
    verifyEq(prog[3], AddDp())
    verifyEq(prog[4], JumpForward())
    verifyEq(prog[5], JumpBackward())
    verifyEq(prog[6], Input())
    verifyEq(prog[7], Output())
  }
}
