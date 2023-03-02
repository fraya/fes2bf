**
** Error produced in the interpretation of an instruction.
**
const class BfErr : Err
{  
  new make(Str msg := "", Err? cause := null) 
  : super(msg, cause)
  {}
}

**
** Error if 'JumpForward' or 'JumpBackward' can't find
** a paired jump
**
const class MismatchedJumpErr : BfErr
{
  new make(Err? cause := null)
  : super("Mismatched Jump instruction", cause)
  {}
}

