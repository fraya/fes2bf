**
** Instruction to jump to a previous instruction if
** 'canJump' condition is 'true'
**
@Serializable
const class JumpBackward : Jump
{
  **
  ** Jump if tape's item is not 0
  **
  override Bool canJump(BfVm vm)
  {
    vm.tape.item != 0
  }

  override Int jumpAddr(BfVm vm)
  {
    try
    {
      pp    := vm.pp
      level := 1

      while (level > 0)
      {
        pp--
        switch (vm.instructions[pp].typeof)
        {
          case JumpForward#:  level--
          case JumpBackward#: level++
          default:
        }
      }
      return pp
    }
    catch (IndexErr e)
    {
      throw MismatchedJumpErr(e)
    }
  }

  override Int hash()
  {
    0
  }

  override Bool equals(Obj? other)
  {
    other is JumpBackward
  }

  override Str toStr()
  {
    "]"
  }
}
