**
** I write a 'Program' into a 'Backend'.
**
const mixin Transpiler
{
  **
  ** Supply a 'Backend' to write the program.
  **
  abstract Backend makeBackend()

  **
  ** Write 'src' to the 'Backend'.
  **
  Backend compile(Program src)
  {
    backend := makeBackend
    src.instructions.each { backend = it.writeOn(backend) }
    return backend
  }
}
