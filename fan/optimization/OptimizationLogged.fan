const class OptimizationLogged : Optimization
{
  const Optimization origin

  new make(Optimization origin)
  {
    this.origin = origin
  }

  override Program apply(Program before)
  {
    startTime := DateTime.now
    after     := origin.apply(before)
    stopTime  := DateTime.now
    elapsed   := stopTime - startTime

    echo("${origin.typeof} optimization finished in ${elapsed}")
    echo("Instructions before ${before.size} after ${after.size}")

    return after
  }
}
