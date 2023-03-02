const mixin IoInstruction : Instruction
{
  @Operator
  override This plus(Instruction other)
  {
    throw UnsupportedErr()
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeIo(this)
  }
}
