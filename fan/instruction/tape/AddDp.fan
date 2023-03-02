**
** Increment tape's data pointer 'amount' times
**
@Serializable
const class AddDp : TapeInstruction
{
  override const Int amount := 1

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override Void execute(BfVm vm)
  {
    vm.tape.dp += amount
  }

  override Bool canBeGrouped(Instruction other)
  {
    other is AddDp
  }

  @Operator
  override This plus(Instruction other)
  {
    that := other as AddDp
    if (that == null)
      throw UnsupportedErr("Cant add ${this} with ${other}")
    return AddDp { it.amount = this.amount + that.amount }
  }

  override Backend writeOn(Backend backend)
  {
    backend.writeTape(this, amount)
  }

  override Str toStr()
  {
    ">${amount}"
  }
}
