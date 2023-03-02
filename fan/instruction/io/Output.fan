**
** Writes to output
**
@Serializable
const class Output : IoInstruction
{
  override Void execute(BfVm bf)
  {
    Env.cur.out.writeChar(bf.tape.item)
    Env.cur.out.flush
  }

  override Int hash()
  {
    0
  }

  override Bool equals(Obj? other)
  {
    other is Output
  }

  override Str toStr()
  {
    "."
  }
}
