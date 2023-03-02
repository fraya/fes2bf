**
** Decrements the value in tape's current item
**
@Serializable
const class SubData : TapeInstruction
{
  override const Int amount := 1

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override Void execute(BfVm vm)
  {
    vm.tape.item -= amount
  }

  override Bool canBeGrouped(Instruction other)
  {
    other is SubData
  }

  @Operator
  override This plus(Instruction other)
  {
    that := other as SubData
    if (that == null)
      throw UnsupportedErr("Cant add ${this} with ${that}")
    return SubData { it.amount = this.amount + that.amount }
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeTape(this, amount)
  }

  override Str toStr()
  {
    "-${amount}"
  }
}
