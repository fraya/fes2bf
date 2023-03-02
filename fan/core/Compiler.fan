**
** Optimize a 'src' `Program` into another `Program`.
**
const mixin Compiler : Pipehole
{
  **
  ** Return a new 'Program' optimized
  **
  abstract Program compile(Program src)
}

