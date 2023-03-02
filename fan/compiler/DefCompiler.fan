 const class DefCompiler : Compiler
{
  override const Optimization[] stages

  new make(Optimization[] stages := [,])
  {
    this.stages = stages
  }

  override This stage(Optimization opt)
  {
    DefCompiler(this.stages.dup.add(opt))
  }

  override Program compile(Program src)
  {
    apply(src)
  }

  This level0()
  {
    DefCompiler()
  }

  This level1()
  {
    level0.stage(Uncomment())
  }

  This level2()
  {
    level1.stage(Group())
  }

  This level3()
  {
    level2.stage(ResetToZero())
  }

  This level4()
  {
    level3.stage(PrecalculateJumps())
  }

  Compiler level(Int n)
  {
    switch (n)
    {
      case 0:
        return level0
      case 1:
        return level1
      case 2:
        return level2
      case 3:
        return level3
      case 4:
        return level4
      default:
       throw ArgErr("Invalid optimization level")
    }
  }

}
