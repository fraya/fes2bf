**
** Group `TapeInstruction`s of the same type.
**
** For instance, '+++' is optimized to '+3'
**
const class Group : Optimization
{
  override Program apply(Program program)
  {
    if (program.size == 0) return program

    result := Instruction[,].add(program[0])

    i     := 1
    limit := program.size

    while (i < limit)
    {
      last := result.last
      next := program[i]
      if (last.canBeGrouped(next))
        result[-1] = last + next
      else
        result.add(next)
      i++
    }

    return Bfe(result)
  }
}
