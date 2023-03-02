**
** Precalculate jump addresses as an optimization.
**
** For every `JumpForward`, finds the pair `JumpBackward`. Then
** sets the jump address from one to each other.
** It raises a `MismatchedJumpErr` if no pair is found.
**
** IMPORTANT: Do not use another kind of optimization after
** this one because it can change the address of jump instructions.
**
const class PrecalculateJumps : Optimization
{
  override Program apply(Program src)
  {
    stack  := Int[,]
    result := src.instructions.dup

    try
    {
      result.each |v,i|
      {
        switch (result[i].typeof)
        {
          case JumpForward#:
            stack.push(i)
          case JumpBackward#:
            j := stack.pop
            result[i] = PrecalculatedJumpBackward { addr = j }
            result[j] = PrecalculatedJumpForward  { addr = i }
          default:
        }
      }
      return Bfe(result)
    }
    catch(IndexErr e)
    {
      throw MismatchedJumpErr(e)
    }
  }
}
