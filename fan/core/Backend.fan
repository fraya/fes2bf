**
** Write every instruction to a representation.
**
mixin Backend
{
  ** Write an Input/Output instruction
  abstract This writeIo(IoInstruction instruction)

  **
  ** Write an instruction that writes to the tape, where
  ** 'n' is the number written.
  **
  abstract This writeTape(TapeInstruction instruction, Int n := 1)

  **
  ** Write a jump instruction. If 'address' is 'null' we have a
  ** `JumpForward` or `JumpBackward`, if not 'null' is a precalculated
  ** jump address.
  **
  abstract This writeJump(Jump jump, Int? address := null)

  **
  ** Write the backend stored information to an `OutStream`.
  ** The parameter 'options' can be set to 'indent'
  **
  abstract Void writeOn(OutStream out, [Str:Obj]? options := null)
}
