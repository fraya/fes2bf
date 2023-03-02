**
** Inmutable brainfuck program made from characters.
**
const class BfStr : Program, Backend
{
  ** Actual program source
  private const Str str

  ** New program from a 'Str'
  new make(Str str)
  {
    this.str = str
  }

  new fromInStream(InStream input)
  : this.make(input.readAllStr)
  {}


  ** Read program from file
  new fromFile(File file)
  : this.fromInStream(file.in)
  {}

  private Instruction fromChar(Int char)
  {
    switch(char)
    {
      case '+':
        return AddData()
      case '-':
        return SubData()
      case '>':
        return AddDp()
      case '<':
        return SubDp()
      case '[':
        return JumpForward()
      case ']':
        return JumpBackward()
      case '.':
        return Output()
      case ',':
        return Input()
      default:
        return Comment { it.char = char }
    }
  }

  protected Int fromInstruction(Type type)
  {
    switch (type)
    {
      case AddData#:
        return '+'
      case SubData#:
        return '-'
      case AddDp#:
        return '<'
      case SubDp#:
        return '>'
      case JumpForward#:
        return '['
      case JumpBackward#:
        return ']'
      case Output#:
        return '.'
      case Input#:
        return ','
      default:
        throw UnsupportedErr()
    }
  }

  **
  ** Get instruction at 'index'
  **
  @Operator
  override Instruction get(Int index)
  {
    fromChar(str[index])
  }

  **
  ** Return the instructions of the program
  **
  override Instruction[] instructions()
  {
    str.chars.map { fromChar(it) }
  }

  override This writeIo(IoInstruction instruction)
  {
    BfStr(str + fromInstruction(instruction.typeof))
  }

  override This writeJump(Jump instruction, Int? addr := null)
  {
    BfStr(str + fromInstruction(instruction.typeof))
  }

  override This writeTape(TapeInstruction instruction, Int n := 1)
  {
    if (instruction.typeof == ResetToZero#)
    {
      buf := StrBuf()
      buf.addChar(fromInstruction(JumpForward#))
      sub := fromInstruction(SubDp#)
      n.times { buf.addChar(sub) }
      buf.addChar(fromInstruction(JumpBackward#))
      return BfStr(str + buf.toStr)
    }
    else
    {
      char  := fromInstruction(instruction.typeof)
      buf   := StrBuf()
      n.times { buf.addChar(char) }
      return BfStr(str + buf.toStr)
    }
  }

  override Void writeOn(OutStream out, [Str:Obj]? options := null)
  {
    str.chars.each { out.writeChar(it) }
  }

  **
  ** Number of instructions
  **
  override Int size()
  {
    str.size
  }

  override Int hash()
  {
    this.str.hash
  }

  **
  ** Compare programs
  **
  override Bool equals(Obj? that)
  {
    other := that as Program
    return other != null && this.instructions == other.instructions
  }

  override Str toStr() { str }
}
