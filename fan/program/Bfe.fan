const class Bfe : Program, Backend
{
  const static Log log := Bfe#.pod.log

  override const Instruction[] instructions

  static new fromFile(File file)
  {
    instructions := (Instruction[]) file.in.readObj
    return Bfe(instructions)
  }

  new make(Instruction[] instructions := [,])
  {
    this.instructions = instructions
  }

  This add(Instruction instruction)
  {
    Bfe(instructions.dup.add(instruction))
  }

  @Operator
  override Instruction get(Int index)
  {
    instructions[index]
  }

  override Int size()
  {
    instructions.size
  }

  override This writeIo(IoInstruction instruction)
  {
    Bfe(instructions.dup.add(instruction))
  }

  override This writeJump(Jump instruction, Int? addr := null)
  {
    Bfe(instructions.dup.add(instruction))
  }

  override This writeTape(TapeInstruction instruction, Int n := 1)
  {
    Bfe(instructions.dup.add(instruction))
  }

  override Void writeOn(OutStream out, [Str:Obj]? options := null)
  {
    out.writeObj(instructions, options)
  }

  override Str toStr()
  {
    instructions.toStr
  }
}
