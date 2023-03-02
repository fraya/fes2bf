**
** A Tape is the memory of a brainfuck virtual machine.
** The values are of type 'Int' initialized to zero.
**
@Serializable
class Tape
{
  ** Default size of a tape
  const static Int defSize := 30000

  **
  ** Tape data or memory
  **
  Int[] data := Int[,].fill(0, defSize)

  **
  ** The data pointer (dp) is the index of the tape
  **
  Int dp := 0

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  **
  ** Value of the tape at 'index'
  **
  @Operator
  Int get(Int index)
  {
    data[index]
  }

  **
  ** Tape data at data pointer
  **
  Int item
  {
    get { return data[dp] }
    set { data[dp] = it }
  }

  **
  ** Number of data in the tape
  **
  Int size()
  {
    data.size
  }
}
