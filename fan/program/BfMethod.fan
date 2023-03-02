class BfMethod
{
  Str name

  StrBuf code := StrBuf()

  new make(Str name)
  {
    this.name = name
  }

  new number(Int n) : this.make("m${n}")
  {}

  This writeline(Str line)
  {
    code.add(line)
    code.addChar('\n')
    return this
  }

  Void writeOn(OutStream out)
  {
    out.printLine("Void ${name} () {")
    out.writeChars(code.toStr)
    out.printLine
  }
}
