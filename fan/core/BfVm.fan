**
** Brainfuck virtual machine with program pointer, instructions
** and tape.
**
** This mixin is *mutable* because we need to write 'pp' and
** 'tape' with a reasonable performance.
**
mixin BfVm
{
  **
  ** Program pointer is the current instruction to be executed.
  **
  abstract Int pp

  **
  ** A brainfuck program is composed of instructions
  **
  abstract Instruction[] instructions

  **
  ** Memory or data tape
  **
  abstract Tape tape

  **
  ** Runs the program from current 'pp' to the end.
  **
  This run()
  {
    limit := instructions.size

    while(pp < limit)
    {
      instructions[pp].execute(this)
      pp++
    }

    return this
  }

  **
  ** Resets 'pp' and 'tape'
  **
  Void reset()
  {
    pp = 0
    tape = Tape()
  }
}
