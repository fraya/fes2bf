const class PipeholeLogged : Pipehole
{
  override const Optimization[] stages

  new make(Optimization[] stages := [,])
  {
    this.stages = stages
  }

  override This stage(Optimization stage)
  {
    PipeholeLogged(stages.dup.add(OptimizationLogged(stage)))
  }
}
