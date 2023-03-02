const mixin Jump : Instruction
{
  **
  ** 'true' if the instruction can jump
  **
  abstract Bool canJump(BfVm vm)

  **
  ** Address to jump
  **
  abstract Int jumpAddr(BfVm vm)

  @Operator
  override This plus(Instruction other)
  {
    throw UnsupportedErr()
  }

  override Void execute(BfVm vm)
  {
    if (!canJump(vm)) return
    vm.pp = jumpAddr(vm)
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeJump(this)
  }
}
