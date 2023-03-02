**
** Default Brainfuck Virtual Machine
**
class DefBfVm : BfVm
{
  override Int pp

  override Instruction[] instructions := [,]

  override Tape tape := Tape()

  new make(|This| f)
  {
    f(this)
  }
}
