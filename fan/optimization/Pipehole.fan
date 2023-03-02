const mixin Pipehole : Optimization
{
  abstract This stage(Optimization optimization)

  abstract Optimization[] stages()

  Void each(|Optimization,Int| f)
  {
    stages.each(f)
  }

  override Program apply(Program program)
  {
    stages.reduce(program) |r,s| { s.apply(r) }
  }
}
