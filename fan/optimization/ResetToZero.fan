const class ResetToZero : Optimization
{
  const static Log log := ResetToZero#.pod.log

  override Program apply(Program src)
  {
    result  := src.instructions.dup
    i       := 0

    while (i < result.size)
    {
      if (i + 3 < result.size &&
          result[i] is JumpForward &&
          result[i+1] is SubData &&
          result[i+2] is JumpBackward)
      {
        sub := result[i+1] as SubData
        if (sub.amount == 1)
        result.removeRange(i..<i+3)
        result.insert(i, Zero { amount = sub.amount })
        i += 3
      }
      else
      {
        i++
      }
    }

    return Bfe(result)
  }
}
