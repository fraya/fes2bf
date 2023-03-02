**
** Increment the value of tape at 'dp'
**
@Serializable
const class AddData : TapeInstruction
{
  override const Int amount := 1

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override Void execute(BfVm vm)
  {
    vm.tape.item += amount
  }

  override Bool canBeGrouped(Instruction other)
  {
    other is AddData
  }

  @Operator
  override This plus(Instruction other)
  {
    that := other as AddData
    if (that == null)
      throw UnsupportedErr("Cant add ${this} with ${other}")
    return AddData { it.amount = this.amount + that.amount }
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeTape(this, amount)
  }

  override Str toStr()
  {
    "+${amount}"
  }
}
