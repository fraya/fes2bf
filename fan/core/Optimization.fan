**
** Optimize a 'src' `Instruction` returning
** a new `Program`
**
const mixin Optimization
{
  abstract Program apply(Program src)
}
