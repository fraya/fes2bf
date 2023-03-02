**
** Read a byte from input stream
**
@Serializable
const class Input : IoInstruction
{
  ** Waits for a valid input
  override Void execute(BfVm bf)
  {
    valid := false

    while (!valid)
    {
      try
      {
        n := Env.cur.in.readLine.toInt
	    bf.tape.item = n
	    valid = true
      }
      catch (Err e) { echo("Invalid input: " + e.msg) }
    }
  }

  override Int hash()
  {
    0
  }

  override Bool equals(Obj? other)
  {
    other is Input
  }

  override Str toStr()
  {
    ","
  }
}
