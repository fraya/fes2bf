**
** Every character that is not an instruction
**
@Serializable
const class Comment : Instruction
{
  **
  ** Saved character comment
  **
  const Int char

  **
  ** Comment with 'c' character
  **
  new make(|This| f)
  {
    f(this)
  }

  @Operator
  override This plus(Instruction other)
  {
    throw UnsupportedErr()
  }

  **
  ** Write nothing to backend
  **
  override Backend writeOn(Backend backend)
  {
    backend
  }

  **
  ** A comment does nothing
  **
  override Void execute(BfVm bf)
  {}

  override Str toStr()
  {
    char.toChar
  }
}
