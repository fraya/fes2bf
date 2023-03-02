**
** An interpreter runs a `Program`
**
mixin Interpreter
{
  **
  ** Run a `Program`
  **
  abstract BfVm runProgram(Program program)

  **
  ** Run a 'ready made' `BfVm`
  **
  abstract BfVm run(BfVm vm)
}
