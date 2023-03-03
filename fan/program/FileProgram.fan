const class FileProgram : Program
{
  private const File file

  new make(File file)
  {
    this.file = file
  }

  private Program program()
  {
    switch (file.ext.lower)
    {
      case "b":
      case "bf":
        return BfStr.fromFile(file)
      case "bfe":
        return Bfe.fromFile(file)
      default:
        throw ArgErr("Unknown source file extension '${file.ext}'")
    }
  }

  override Instruction[] instructions()
  {
    program.instructions
  }

  override Int size()
  {
    program.size
  }

  override Instruction get(Int index)
  {
    program[index]
  }
}
