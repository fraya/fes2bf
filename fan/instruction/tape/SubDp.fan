**
** Decrement tape's data pointer
**
@Serializable
const class SubDp : TapeInstruction
{
  override const Int amount := 1

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override Void execute(BfVm vm)
  {
    vm.tape.dp -= amount
  }

  override Bool canBeGrouped(Instruction other)
  {
    other is SubDp
  }

  @Operator
  override This plus(Instruction other)
  {
    that := other as SubDp
    if (that == null)
      throw UnsupportedErr("Cant add ${this} with ${that}")
    return SubDp { it.amount = this.amount + that.amount }
  }

  override Str toStr()
  {
    "<${amount}"
  }
}
