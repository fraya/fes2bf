@Serializable
const class Zero : TapeInstruction
{
  override const Int amount

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override Void execute(BfVm vm)
  {
    vm.tape.item = 0
  }

  @Operator
  override This plus(Instruction other)
  {
    throw UnsupportedErr()
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeTape(this, amount)
  }

  override Str toStr()
  {
    "z${amount}"
  }
}
