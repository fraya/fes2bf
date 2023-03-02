**
** Run a `Program` and execute the instructions.
**
@Serializable
const class BfInterpreter : Interpreter, Pipehole
{
  override const Optimization[] stages := [,]

  new make(|This|? f := null)
  {
    if (f != null) f(this)
  }

  override This stage(Optimization opt)
  {
    BfInterpreter { it.stages = this.stages.dup.add(opt) }
  }

  override BfVm run(BfVm vm)
  {
    vm.run
  }

  override BfVm runProgram(Program src)
  {
    vm := DefBfVm { instructions = apply(src).instructions }
    return run(vm)
  }
}
