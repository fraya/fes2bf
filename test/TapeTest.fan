class TapeTest : Test
{
  Tape? tape
  
  override Void setup()
  {
    tape = Tape { data = [0,0,0] }
  }

  override Void teardown()
  {
    tape = null
  }
  
  Void testConstructor()
  {
    verifyEq(tape.size, 3)
  }

  Void testGetInsideBounds()
  {
    verifyEq(tape[0], 0)
    verifyEq(tape[1], 0)
    verifyEq(tape[2], 0)
  }

  Void testGetOutsideBounds()
  {
    verifyErr(IndexErr#) { x := tape[3] }
  }

  Void testSetInsideBounds()
  {
    verifyEq(tape[0], 0)
    tape.item++
    verifyEq(tape[0], 1)
    
    verifyEq(tape[-1], 0)
    tape.dp--
    verifyEq(tape.dp, -1)
    tape.item++
    verifyEq(tape[-1], 1)
  }

  Void testForth()
  {
    tape.dp++
    verifyEq(tape.dp, 1)
    tape.dp++
    verifyEq(tape.dp, 2)
  }

  Void testBack()
  {
    tape.dp += 2
    tape.dp--
    verifyEq(tape.dp, 1)
  }

  Void testPut()
  {
    tape.item = 3
    verifyEq(tape.item, 3)
  }

  Void testPlus()
  {
    tape.item += 3
    verifyEq(tape.item, 3)
  }

  Void testMinus()
  {
    tape.item += 3
    verifyEq(tape.item, 3)
    tape.item -= 3
    verifyEq(tape.item, 0)
  }
}
