**
** 'JumpForward' with a precalculated jump.
**
@Serializable
const class PrecalculatedJumpForward : JumpForward
{
  ** Instruction index to jump if 'canJump' is 'true
  const Int addr

  new make(|This| f)
  {
    f(this)
  }

  override Int jumpAddr(BfVm vm)
  {
    addr
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeJump(this, addr)
  }

  override Bool equals(Obj? other)
  {
    that := other as PrecalculatedJumpForward
    return that != null && this.addr == that.addr
  }

  override Int hash()
  {
    typeof.hash
  }

  override Str toStr()
  {
    "[${addr}"
  }
}

