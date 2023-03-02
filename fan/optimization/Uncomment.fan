**
** Remove comments from a program
**
const class Uncomment : Optimization
{
  override Program apply(Program program)
  {
    uncommented := program.instructions.findAll |instruction->Bool|
    { return instruction isnot Comment }
    return Bfe(uncommented)
  }
}
