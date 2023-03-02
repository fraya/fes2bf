**
** Computer program in brainfuck.
**
const mixin Program
{
  **
  ** Program's instructions
  **
  abstract Instruction[] instructions()

  **
  ** Number of instructions
  **
  abstract Int size()

  **
  ** Return the 'Instruction' at 'index'
  **
  @Operator
  abstract Instruction get(Int index)
}
