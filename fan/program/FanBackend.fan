class FanBackend : Backend
{
  Int n := 0
  BfMethod[] methods := [,]
  BfMethod[] stack   := [BfMethod("main")]

  override This writeIo(IoInstruction instruction)
  {
    switch (instruction.typeof)
    {
       case Output#:
        writeLine("Env.cur.out.writeChar(tape[dp]);")
        writeLine("Env.cur.out.flush;")
      case Input#:
        throw UnsupportedErr()
      default:
        throw UnsupportedErr()
    }

    return this
  }

  override This writeJump(Jump instruction, Int? addr := null)
  {
    switch (instruction.typeof)
    {
      case JumpForward#:
      case PrecalculatedJumpForward#:
        stack.push(BfMethod.number(n++))
        writeLine("while (tape[dp] != 0) {")
      case JumpBackward#:
      case PrecalculatedJumpBackward#:
        writeLine("} // while")
        writeLine("} // method")
        last := stack.peek
        methods.push(stack.pop)
        writeLine("${last.name};")
      default:
        throw UnsupportedErr()
    }
    return this
  }

  override This writeTape(TapeInstruction instruction, Int n := 1)
  {
    switch (instruction.typeof)
    {
      case AddData#:
        writeLine("tape[dp] += ${n};")
      case SubData#:
        writeLine("tape[dp] -= ${n};")
      case AddDp#:
        writeLine("dp += ${n};")
      case SubDp#:
        writeLine("dp -= ${n};")
      case Zero#:
        writeLine("tape[dp] = 0;")
      default:
        throw UnsupportedErr()
    }

    return this
  }

  protected Void writeLine(Str line)
  {
    stack.peek.writeline(line)
  }

  override Void writeOn(OutStream out, [Str:Obj]? options := null)
  {
    out.printLine("class BfMain {")
    out.printLine("Int pp := 0;")
    out.printLine("Int dp := 0;")
    out.printLine("Int[] tape := Int[,].fill(0, 30000);")
    out.printLine
    while (stack.peek != null) { methods.add(stack.pop) }
    methods.last.code.add("} // main")
    methods.each { it.writeOn(out) }
    out.writeChars("} // class\n")
  }
}
