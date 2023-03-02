**
** Ancestry of all instructions that access to the tape
**
const mixin TapeInstruction : Instruction
{
  **
  ** Number to apply to tape instruction
  **
  abstract Int amount()

  override Backend writeOn(Backend backend)
  {
    backend.writeTape(this, amount)
  }

  override Int hash()
  {
    amount.hash
  }

  override Bool equals(Obj? obj)
  {
    this.typeof == obj.typeof && this.amount == obj->amount
  }
}
