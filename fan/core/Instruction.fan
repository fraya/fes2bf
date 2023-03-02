**
** A brainfuck instruction it's a _Command pattern_ that takes
** a brainfuck virtual machine as parameter.
**
const mixin Instruction
{
  **
  ** Execute the instruction in the virtual machine.
  **
  abstract Void execute(BfVm vm)

  **
  ** Write the instruction into a `Backed`.
  **
  abstract Backend writeOn(Backend backend)

  **
  ** Can this instruction be grouped with 'other'?.
  ** Overriden by subclasses.
  **
  virtual Bool canBeGrouped(Instruction other)
  {
    false
  }

  **
  ** Add 'this' instruction with 'other', returning
  ** a new instruction.
  **
  @Operator
  abstract This plus(Instruction other)
}
